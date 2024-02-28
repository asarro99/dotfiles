return {
  "andweeb/presence.nvim",
  config = function()
    local presence = require("presence")

    presence.setup({
      neovim_image_text = "A True Text Editor",
      main_image = "file",
      enable_line_number = true,
      buttons = false
    })
  end
}
