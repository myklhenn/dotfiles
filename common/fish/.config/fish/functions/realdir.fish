function realdir -d "Go to the real directory of a linked file"
  # show error and exit if required commands are missing
  set -l error_msg "Install \"%s\" on your system before using this function."
  if not test (which dirname)
    printf $error_msg "dirname"
  else if not test (which realpath)
    printf $error_msg "realpath"
  else
    if test -z $argv
      echo "realdir: missing operand"
      echo "usage: realdir path"
    else
      # go to directory of linked file
      cd (dirname (realpath $argv))
    end
  end
end