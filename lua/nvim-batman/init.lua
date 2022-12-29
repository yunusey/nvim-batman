local sleep = require("nvim-batman.sleep")


local M = {}

M.sleepRandom = sleep.sleepRandom
M.sleepNormal = sleep.sleepNormal
M.stopTimer = sleep.stopTimer

return M
