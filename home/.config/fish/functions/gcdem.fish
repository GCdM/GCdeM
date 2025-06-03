# A function for configuring different components of gcdem

function gcdem
  set -l system_to_config $argv[1]

  set -q GCDEM_PATH; or set -f GCDEM_PATH "$HOME/GCdeM"

  switch $system_to_config
    case ''
      set -f system_directory $GCDEM_PATH
    case maidiyi
      set -f system_directory $HOME/.config/nvim
    case fish
      set -f system_directory $GCDEM_PATH/home/.config/fish
    case hypr
      set -f system_directory $GCDEM_PATH/home/.config/hypr
    case eww
      set -f system_directory $GCDEM_PATH/home/.config/eww
    case .config
      set -f system_directory $GCDEM_PATH/home/.config 
    case '*'
      echo Unrecognised gcdemv component: $system_to_config
      return
  end

  cd $system_directory
  $VISUAL .
  echo  Done configuring $system_directory
  cd -
end
