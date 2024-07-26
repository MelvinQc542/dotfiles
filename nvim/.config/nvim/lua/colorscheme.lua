-- Set the colorscheme to vim using a protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme vim")
if not status then
  print("Colorscheme not found!")
  config.setup()
end
