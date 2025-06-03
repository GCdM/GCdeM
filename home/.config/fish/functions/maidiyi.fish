function maidiyi
  set -f maidiyi_config_path $HOME/.config/nvim
  cd $maidiyi_config_path
  $VISUAL .
  echo  Configured $maidiyi_config_path
  cd -
end
