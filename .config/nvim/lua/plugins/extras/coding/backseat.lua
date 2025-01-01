---@type LazySpec[]
return {
  {
    "james1236/backseat.nvim",
    cmd = { "Backseat", "BackseatAsk", "BackseatClear", "BackseatClearLine" },
    opts = {
      openai_model_id = "gpt-3.5-turbo", --gpt-4
      language = "english", -- Such as 'japanese', 'french', 'pirate', 'LOLCAT'
      -- additional_instruction = "Respond snarkily", -- (GPT-3 will probably deny this request, but GPT-4 complies)
      -- highlight = {
      --     icon = '', -- ''
      --     group = 'Comment',
      -- }
    },
  },
}
