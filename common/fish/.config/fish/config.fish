# fish shell configuration -- executed upon session start

# (~/.config/fish/conf.d/*.fish is automatically sourced before this file)

set fish_greeting # blank greeting

# set up fundle plugins
if functions -q fundle
  set -l init_output (fundle init)
  if not test -z $init_output
    fundle install
  end
end

# launch X server
# if test (tty) = '/dev/tty1'
#   exec startx
# end