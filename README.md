# nvim-batman
A fancy sleep screen for neovim.

https://user-images.githubusercontent.com/107340417/210015397-c6e8da70-534f-43ad-9ed3-86fd81832e98.mp4


https://user-images.githubusercontent.com/107340417/210015398-e98c1ece-eab4-4f2c-b13c-3ec9383cb4d3.mp4


# Configuration
1-) From ```init.lua```
Add following to your ```.config/init.lua``` file:
```lua
use "yunusey/nvim-batman"
```
2-) From github
```bash
cd ~/.local/share/nvim/site/pack/packer/start/
git clone https://github.com/yunusey/nvim-batman.git
```

# Using Commands
```
:SleepNormal
```
Batman logo moves 1 unit right and 1 unit left until it reaches the borders. When it does, it bounces and keeps going on.
```
:SleepRandom
```
Batman logo teleports to anywhere in the screen.

# Customization
Everything about the plugin can be found in ```nvim-batman/lua/nvim-batman/sleep.lua``` file. There are three main functions (```sleepRandom()```, ```sleepNormal()```, ```closeTimer()```).
For animations, I used ```vim.loop.new_timer()``` which basically creates a timer. In ```timer:start(x, y, function())```, if you change ```x```, program will wait for ```x milliseconds```. If you change ```y```, it will wait for ```y milliseconds``` before starting each function. 

# Quitting
For quitting, please type ```q```. If you try to quit using ```ZZ```, it will create an error:
```
Error executing vim.schedule lua callback: .../pack/packer/start/nvim-batman/lua/nvim-batman/sleep.lua:65: Vim:E322: line number out of range: 1 past the end stack traceback:
        [C]: in function 'nvim_buf_set_lines'
        .../pack/packer/start/nvim-batman/lua/nvim-batman/sleep.lua:65: in function ''
        vim/_editor.lua: in function <vim/_editor.lua:0>
```

# Contribution
If you'd like to improve the nvim-batman, I'd appreciate it. Please feel free to ask questions. And, please consider answering issues and errors.
