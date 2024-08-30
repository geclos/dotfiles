local config = {
  cmd_prefix = "Gp",
  providers = {
    openai = {
      endpoint = "https://api.openai.com/v1/chat/completions",
      secret = os.getenv("OPENAI_API_KEY"),
    }
  },
  agents = {
    {
      name = "GPT-4o",
      provider = 'openai',
      chat = true,
      command = true,
      model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
      system_prompt = "You are a general AI assistant.\n\n"
      .. "The user provided the additional info about how they would like you to respond:\n\n"
      .. "- Ask questions if you need clarification to provide better answers.\n"
      .. "- Be concise and to the point, don't overextend in your explanations unless explicitely asked to.\n"
      .. "- Don't omit any code from your answer if the answer requires coding.\n"
      .. "- Code in your answers contains no comments."
    },
    { name = "ChatGPT3-5", disable = true },
    { name = "ChatGPT4", disable = true },
    { name = "CodeGPT3-5", disable = true },
    { name = "CodeGPT4", disable = true },
  },

  -- chat topic model (string with model name or table with model name and parameters)
  chat_topic_gen_model = "gpt-4o",
}

-- require gp.nvim from parent folder
require("gp").setup(config)

