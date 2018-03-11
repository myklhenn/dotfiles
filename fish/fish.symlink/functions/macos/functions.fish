# fish shell functions sourced when running macOS

# reveal given directory in finder
NAME "finder"; function finder
  open -R $argv
end

# retrieve a file from WWU Linux server and copy to current directory
NAME "from-wwu"; function from-wwu
  echo "(retrieved file will be placed in current directory)"
  echo -n -s "file name: "; read filename;
  echo -n -s "remote file path (NOT file name): ~/"; read src
  set_color yellow; echo -n -s "scp:"; set_color normal
  scp -P 922 henninm3@linux.cs.wwu.edu:~/$src$filename $filename
end

# send a file from current directory to WWU Linux server
NAME "to-wwu"; function to-wwu
  echo "(file will be retrieved from current directory)"
  echo -n -s "file name:"; read filename
  echo -n -s "destination file path (NOT file name):"; read dest
  set_color yellow; echo -n -s "scp:"; set_color normal
  scp -P 922 $filename henninm3@linux.cs.wwu.edu:~/$dest$filename
end

NAME "abbred-macos"; function abbred-macos
  eval $EDITOR ~/.config/fish/functions/macos/abbreviations.fish
end

NAME "funced-macos"; function funced-macos
  eval $EDITOR ~/.config/fish/functions/macos/functions.fish
end

# WINTER 2018 COURSE FOLDER ALIASES:
NAME "405"; function 405
  cd ~/OneDrive/School/Western\ Washington\ University/2017-18\ Q2\ \(Winter\)/\[1000\]\ CSCI\ 405/
end

NAME "493"; function 493
  cd ~/OneDrive/School/Western\ Washington\ University/2017-18\ Q2\ \(Winter\)/\[1500\]\ CSCI\ 493/
end

NAME "495"; function 495
  cd ~/OneDrive/School/Western\ Washington\ University/2017-18\ Q2\ \(Winter\)/\[1600\]\ CSCI\ 495/
end

