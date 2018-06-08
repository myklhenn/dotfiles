# fish shell configuration -- executed upon session start

set fish_greeting # blank greeting

# load all setup/configuration files
for FILE in ~/.config/fish/conf.d/*.fish
  builtin source $FILE
end

# launch X server
# if test (tty) = '/dev/tty1'
#   exec startx
# end