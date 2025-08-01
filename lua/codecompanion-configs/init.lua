require("codecompanion").setup({
  strategies = {
  -- Change the default chat adapter
    chat = {
      adapter = "deepseek",
    },
    inline = {
      adapter = "deepseek"
    }
  },
  log_level = 'DEBUG',
  adapters = {
    deepseek = function()
      return require("codecompanion.adapters").extend("deepseek", {
        env = {
          api_key = "DEEPSEEK_API_KEY",
        }
    })
    end,
  },
})
