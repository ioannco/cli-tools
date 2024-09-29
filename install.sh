#!/bin/bash

function install_py {
    echo "#!/usr/bin/env python3" > ./bin/$1
    cat ./src/$1.py >> ./bin/$1
    cd bin
    chmod +x $1
    ln -s $1 $2
    cd ..
    echo "+ $1, $2"
}

function install_sh {
    cp ./src/$1 ./bin
    cd bin
    chmod +x $1
    cd ..
    echo "+ $1"
}

# Copy, add bang and make short links
if [ -d ./bin ]; then rm -Rf ./bin; fi
mkdir ./bin
echo "Unix universal tools:"
install_py browse b
install_py google g
install_py svace-issue svi
echo
# ^ Add unix universal toolname here

if [ "$(uname)" == "Darwin" ]; then
    echo "macOS tools:"
    install_sh code
    echo
    # ^ Add macos toolname here
fi

if [[ "$PATH" =~ "$(pwd)/bin" ]]; then
    echo "./bin is in the \$PATH!"
    echo
else
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
    else 
        echo "To use tools from anywhere, please manually add \"$(pwd)/bin\" to the PATH."
    fi
fi

echo Installation completed. 

