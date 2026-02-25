vim.g.is_ssh = os.getenv("SSH_TTY") ~= nil
require("config.options")
require("config.keymaps")
require("config.cmds")
require("config.lazy")
