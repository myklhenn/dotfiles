# install oh-my-fish and initial plugins on first run
set -l OMF_INST "$HOME/.install-omf"
set -l OMF_LOCK "$OMF_INST.lock"
if not functions -q omf; and not test -e $OMF_LOCK
  if not test (which curl)
    echo "Startup script \"omf_common.fish\" requires \"curl\" to run."
    echo "Please install before next shell startup."
  else
    echo "Oh My Fish not found. Installing..."
    touch $OMF_LOCK # lockfile prevents infinite loop when installing omf
    curl -L https://git.io/JvHzw > $OMF_INST
    fish $OMF_INST --channel=dev
  end
end
# clean up after installation
if functions -q omf
  test -e $OMF_INST; and rm $OMF_INST
  test -e $OMF_LOCK; and rm $OMF_LOCK
end