require("notify").setup {
  -- stages = "fade_in_slide_out",
  stages = "static",
  -- render = "compact",
  background_colour = "FloatShadow",
  timeout = 3000,
}
vim.notify = require "notify"
