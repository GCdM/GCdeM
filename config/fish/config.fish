if status is-interactive
    set fish_greeting

    alias l="eza -Alh --group-directories-first"
    abbr -a dark brightnessctl s 1

    # 
    # A function for configuring different components of gcdemv
    #
    function gcdem
        set -q GCDEM_PATH; or set -f GCDEM_PATH "$HOME/GCdeM"

        set -l system_to_config $argv[1]

        switch $system_to_config
            case ''
                set -f system_directory $GCDEM_PATH
            case maidiyi
                set -f system_directory $HOME/.config/nvim
            case fish
                set -f system_directory $GCDEM_PATH/home/.config/fish
            case hypr
                set -f system_directory $GCDEM_PATH/.config/hypr
            case eww
                set -f system_directory $GCDEM_PATH/.config/eww
            case .config
                set -f system_directory $GCDEM_PATH/.config
            case '*'
                echo Unrecognised gcdemv component: $system_to_config
                return
        end

        cd $system_directory
        $VISUAL .
        echo  Done configuring $system_directory
        cd -
    end

    set -gx NVM_DIR $HOME/.nvm
    [ -s $NVM_DIR/nvm.sh ]; and bass source $NVM_DIR/nvm.sh # ';' nvm use default &>/dev/null # TODO, fix so default version is always loaded
    [ -s $NVM_DIR/completions/nvm.fish ]; and source $NVM_DIR/completions/nvm.fish
end
