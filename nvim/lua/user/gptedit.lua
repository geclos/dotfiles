local api = vim.api
local curl = require("plenary.curl")

local function prompt_user_input(prompt)
  return vim.fn.input(prompt)
end

local function build_user_prompt(user_input, filetype, buffer, row, selection)
  local prompt = "I have the following code:\n\n"
  .. "```" .. filetype .. "\n" .. table.concat(buffer, "\n") .. "\n```\n\n"
  .. "Cursor is at line: \n\n"
  .. "```" .. filetype .. "\n" .. table.concat(api.nvim_buf_get_lines(0, row-1, row, false), "\n") .. "\n```\n\n"

  if selection then
    prompt = prompt
    .. "I also have the following code selected from the buffer:\n\n"
  .. "```" .. filetype .. "\n" .. table.concat(selection, "\n") .. "\n```\n\n"
  end

  prompt = prompt .. user_input .. "\n\n"

  if selection then
    prompt = prompt
    .. "Just give me the code snippet to replace my selection, nothing else."
  else
    prompt = prompt
    .. "Just give me the code snippet to add before the cursor, nothing else."
  end

  return prompt
end

local function stream_openai_api(prompt, filetype, buffer, row, selection)
  local api_key = os.getenv("OPENAI_API_KEY")
  local user_prompt = build_user_prompt(prompt, filetype, buffer, row, selection)
  local body = vim.fn.json_encode({
    model = "gpt-4o",
    messages = {
      {
        role = "system",
        content = "You are an AI working as a code editor. Here's how you work:\n\n"
        .. "- You avoid any commentary outside of the code snippet\n"
        .. "- Your responses include ONLY CODE\n"
        .. "- You do not wrap your code snippet on backticks or any other markdown formatting\n"
        .. "- Your code does not contain any comments\n"
      },
      {
        role = "user",
        content = user_prompt
      }
    },
    n = 1,
    temperature = 0.7,
    stream = false,
  })

  local response = curl.request({
    method = 'POST',
    url = 'https://api.openai.com/v1/chat/completions',
    body = body,
    headers = {
      ["Content-Type"] = "application/json",
      ["Authorization"] = "Bearer " .. api_key
    },
  })

  return vim.json.decode(response.body)
end

local function handle_openai_completion(start_line, end_line, range)
  local filetype = vim.bo.filetype
  local buffer = api.nvim_buf_get_lines(0, 0, -1, false)
  local user_input = prompt_user_input("Prompt: ")
  local selection
  if range == 2 then
    selection = api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  end

  local payload = stream_openai_api(user_input, filetype, buffer, start_line, selection)
  local msg = payload.choices[1].message.content
  local lines = {}
  for line in msg:gmatch("[^\r\n]+") do
    table.insert(lines, line)
  end

  if range == 2 then
    api.nvim_buf_set_lines(0, start_line-1, end_line, false, lines)
  else
    api.nvim_buf_set_lines(0, start_line-1, start_line-1, false, lines)
  end
end

vim.api.nvim_create_user_command(
"GPTedit",
function(params) handle_openai_completion(params.line1, params.line2, params.range) end,
{ nargs = 0, range = true}
)
