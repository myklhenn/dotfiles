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

# SUMMER 2017 COURSE FOLDER ALIASES:
NAME "460"; function 460
  cd ~/OneDrive/School/Western\ Washington\ University/2016-17\ Q4\ \(Summer\)/\[1200\]\ CSCI\ 460
end

