if status is-interactive
    set fish_greeting

    alias l="eza -Alh --group-directories-first"
    abbr -a dark brightnessctl s 1

    # ###
    # Load private variables
    # ###
    set -l private_variables_filepath "$HOME/.config/fish/fish_variables_private.fish"
    if [ -f $private_variables_filepath ]
        source $private_variables_filepath
    else
        set -f example_filepath (string join "" $private_variables_filepath ".example")

        echo " Missing private fish_variables: "
        echo "|__ $private_variables_filepath"
        echo " You can copy the exmaple file:"
        echo "|__ $example_filepath"
    end

    set -gx NVM_DIR $HOME/.nvm
    [ -s $NVM_DIR/nvm.sh ]; and bass source $NVM_DIR/nvm.sh # ';' nvm use default &>/dev/null # TODO, fix so default version is always loaded
    [ -s $NVM_DIR/completions/nvm.fish ]; and source $NVM_DIR/completions/nvm.fish
end
