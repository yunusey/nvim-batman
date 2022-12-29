local M = {}

M.bat = {
    "_____________________                              _____________________ ",
    "`-._:  .:'   `:::  .:\\           |\\__/|           /::  .:'   `:::  .:.-' ",
    "    \\      :          \\          |:   |          /         :       /     ",
    "     \\     ::    .     `-_______/ ::   \\_______-'   .      ::   . /      ",
    "      |  :   :: ::'  :   :: ::'  :   :: ::'      :: ::'  :   :: :|       ",
    "      |     ;::         ;::         ;::         ;::         ;::  |       ",
    "      |  .:'   `:::  .:'   `:::  .:'   `:::  .:'   `:::  .:'   `:|       ",
    "      /     :           :           :           :           :    \\       ",
    "     /______::_____     ::    .     ::    .     ::   _____._::____\\      ",
    "                   `----._:: ::'  :   :: ::'  _.----'                    ",
    "                          `--.       ;::  .--'                           ",
    "                              `-. .:'  .-'                               ",
    "                                 \\    /                                  ",
    "                                  \\  /                                   ",
    "                                   \\/                                    "
}

function M.sleepNormal()
    local bat = {}
    for index, value in ipairs(M.bat) do
        table.insert(bat, value)
    end
    local buf = vim.api.nvim_create_buf(false, true)
    M.buf = buf
    M.win = vim.api.nvim_open_win(buf, true, {
            relative='win', row=0, col=0, 
            width=vim.api.nvim_win_get_width(vim.api.nvim_get_current_win()), 
            height=vim.api.nvim_win_get_height(vim.api.nvim_get_current_win())
        }
    )
    local h = vim.api.nvim_win_get_height(M.win)
    local w = vim.api.nvim_win_get_width(M.win)
    M.timer = vim.loop.new_timer()
    local turn = 0
    local i = 0
    local j = 0
    local i_inc = 1
    local j_inc = 1
    local i_max = w - 80
    local j_max = h - 15
    vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':lua require"nvim-batman".stopTimer()<cr>', {noremap=true})
    M.timer:start(0, 100, vim.schedule_wrap ( function ()
        local text = {}
        for index, value in ipairs(bat) do
            table.insert(text, value)
        end
        while #text < h do
            table.insert(text, " ")
        end
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, text)
        for index, value in ipairs(text) do
            vim.api.nvim_buf_add_highlight(buf, -1, "ErrorMsg", index - 1, 0, -1)
        end
        for index, value in ipairs(bat) do
            if i_inc == 1 then
                bat[index] = " " .. value
            end

            if i_inc == -1 then
                if value:len() > 1 then
                    bat[index] = string.sub(value, 2, -1)
                end
            end
        end
        if i == i_max then
            i_inc = -1
        end

        if j == j_max then
            j_inc = -1
        end

        if i == 0 then
            i_inc = 1
        end

        if j == 0 then
            j_inc = 1
        end

        if j_inc == -1 then
            table.remove(bat, 1)
        end

        if j_inc == 1 then
            table.insert(bat, 1, " ")
        end
        i = i + i_inc
        j = j + j_inc
        turn = turn + 1
    end))
    
end

function M.sleepRandom()
    local buf = vim.api.nvim_create_buf(false, true)
    M.buf = buf
    M.win = vim.api.nvim_open_win(buf, true, {
            relative='win', row=0, col=0, 
            width=vim.api.nvim_win_get_width(vim.api.nvim_get_current_win()), 
            height=vim.api.nvim_win_get_height(vim.api.nvim_get_current_win())
        }
    )
    local h = vim.api.nvim_win_get_height(M.win)
    local w = vim.api.nvim_win_get_width(M.win)
    local h_range = h - 15
    local w_range = w - 80
    local bat = {}
    for index, value in ipairs(M.bat) do
        table.insert(bat, value)
    end
    M.timer = vim.loop.new_timer()
    local turn = 0
    vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':lua require"nvim-batman".stopTimer()<cr>', {noremap=true})
    M.timer:start(0, 1000, vim.schedule_wrap ( function ()
        local i = math.random() * w_range
        local j = math.random() * h_range
        local text = {}
        for line = 0, j, 1 do
            table.insert(text, "")
        end
        for index, value in ipairs(bat) do
            local s = ""
            for line = 0, i, 1 do
                s = " " .. s
            end
            s = s .. value
            table.insert(text, s)
        end
        while #text < h do
            table.insert(text, "")
        end
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, text)
        for index, value in ipairs(text) do
            vim.api.nvim_buf_add_highlight(buf, -1, "ErrorMsg", index - 1, 0, -1)
        end
        turn = turn + 1
    end))
    
end

function M.stopTimer()
    M.timer:stop()
    vim.api.nvim_buf_delete(M.buf, {})
    vim.api.nvim_win_close(M.win, true)
end

return M
