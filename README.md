# SatanOnDocker
A docker image configured to hit it and quit it for Satan GH60. 

# DEPRECATED
Use the QMK official Docker image instead. Not only has QMK overtaken TMK and now has more features, but the documentation and community provides far better support!

https://github.com/jackhumbert/qmk_firmware#docker

This image uses the TMK fork from https://github.com/kairyu/tmk_keyboard_custom and automatically compiles any keymaps put into the `keymaps` folder and puts the firmware in the firmware folder. 
Existing firmware will be renamed to avoid dataloss.

Note: No container will be created. This script runs inside the image in a temporary container when using the start.sh script, and that container is automatically destroyed after completion. The image can be destroyed as well, if you want, but it's only about 700mb fully configured, and will be reused if you run the script again.

Tutorial:

1. Install Docker
2. Put your keymap(s) in the keymaps folder
3. Run start.sh
4. Your firmware is now in the firmware folder.
