#!/bin/bash
function install_and_shorten {
    echo "#!/usr/bin/env python3" > ./bin/$1
    cat ./src/$1.py >> ./bin/$1
    cd bin
    chmod +x $1
    ln -s $1 $2
    cd ..
}

# Copy, add bang and make short links
if [ -d ./bin ]; then rm -Rf ./bin; fi
mkdir ./bin
install_and_shorten browse b
install_and_shorten google g
install_and_shorten svace-issue svi
# Add toolname here ^

echo Installation completed. To use tools from anywhere, please add \"$(pwd)/bin\" to the PATH.

# Auto-add to the $PATH
if [[ $SHELL =~ "bash" ]] || [[ $SHELL =~ "zsh" ]] || [[ $SHELL =~ "fish" ]]; then
    read -p "$SHELL has been detected as your primary shell. Do you want auto-include $(pwd)/bin in the PATH? [Y/n] " yn
    if [[ $yn == Y ]] || [[ $yn == y ]] ; then
        if [[ $SHELL =~ "bash" ]]; then
            echo "export PATH=$(pwd)/bin:\$PATH" >> ~/.bashrc
            source ~/.bashrc
        elif [[ $SHELL =~ "zsh" ]]; then 
            echo "export PATH=$(pwd)/bin:\$PATH" >> ~/.zshrc
            source ~/.zshrc
        else 
            echo "fish_add_path $(pwd)/bin" >> ~/.config/fish/config.fish
            source ~/.config/fish/config.fish
        fi 
    fi
fi

echo Done!

