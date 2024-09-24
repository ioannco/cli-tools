function install_and_shorten {
echo "#!/usr/bin/env python" > bin/$2
cat src/$1.py >> bin/$1
chmod +x bin/$1
ln -s bin/$1 bin/$2
}

if [ -d bin ]; then rm -Rf bin; fi

install_and_shorten browse b
install_and_shorten google g
install_and_shorten svace-issue svi

echo Installation completed. To use tools from anywhere, please add \"$(pwd)\" to the PATH.
