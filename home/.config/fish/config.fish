if status is-interactive
    set fish_greeting

    abbr -a l eza -Alh --group-directories-first
    abbr -a dark brightnessctl s 1

    # 
    # A function for configuring different components of gcdemv
    #
    function gcdemv
        set -l system_to_config $argv[1]

        switch $system_to_config
            case fish
                set -f system_directory $HOME/.config/fish/
            case hypr
                set -f system_directory $HOME/.config/hypr/
            case waybar
                set -f system_directory $HOME/.config/waybar/
            case maidiyi
                set -f system_directory $HOME/.config/nvim/
            case gcdemv
                set -f system_directory $HOME
            case dotconfig
                set -f system_directory $HOME/.config/
            case '*'
                echo Unrecognised gcdemv component: $system_to_config
                return
        end

        cd $system_directory
        $VISUAL .
        echo Done configuring $system_directory
        cd -
    end

    set -gx NVM_DIR $HOME/.nvm
    [ -s $NVM_DIR/nvm.sh ]; and bass source $NVM_DIR/nvm.sh # ';' nvm use default &>/dev/null # TODO, fix so default version is always loaded
    [ -s $NVM_DIR/completions/nvm.fish ]; and source $NVM_DIR/completions/nvm.fish
end
