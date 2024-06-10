local config = {
	cmd_prefix = "Gp",
	agents = {
		{
			name = "ChatGPT4",
			chat = true,
			command = true,
			-- string with model name or table with model name and parameters
			model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = "You are a general AI assistant.\n\n"
				.. "The user provided the additional info about how they would like you to respond:\n\n"
				.. "- If you're unsure don't guess and say you don't know instead.\n"
				.. "- Ask questions if you need clarification to provide better answers.\n"
				.. "- Don't omit any code from your output if the answer requires coding.\n"
        .. "- Be concise and to the point, don't overextend in your explanations unless explicitely asked to.\n"
        .. "- Any code in your answer contains no comments."
		},
		{
			name = "CodeGPT4",
			chat = false,
			command = false,
			-- string with model name or table with model name and parameters
			model = { model = "gpt-4o", temperature = 0.8, top_p = 1 },
			-- system prompt (use this to specify the persona/role of the AI)
			system_prompt = "You are an AI working as a code editor.\n\n"
				.. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
				.. "START AND END YOUR ANSWER WITH:\n\n```",
		},
    {
 			name = "ChatGPT3-5",
 			chat = false,
 			command = false,
 		},
    {
 			name = "CodeGPT3-5",
 			chat = false,
 			command = false,
 		},
	},

  -- chat topic model (string with model name or table with model name and parameters)
  chat_topic_gen_model = "gpt-4o",
}

require("gp").setup(config)

