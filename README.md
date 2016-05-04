# SatanOnDocker
A docker image configured to hit it and quit it for Satan GH60. 

This image uses the TMK fork from https://github.com/kairyu/tmk_keyboard_custom and automatically compiles any keymaps put into the `keymaps` folder and puts the firmware in the firmware folder. 
If there already is a firmware-folder, it will rename it and create a new one. That way there will be no overwritten files (I hope).
