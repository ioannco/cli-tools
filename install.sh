function install_and_shorten {
echo "#!/usr/bin/env python3" > ./bin/$1
cat ./src/$1.py >> ./bin/$1
cd bin
chmod +x $1
ln -s $1 $2
cd ..
}

if [ -d ./bin ]; then rm -Rf ./bin; fi
mkdir ./bin
install_and_shorten browse b
install_and_shorten google g
install_and_shorten svace-issue svi

echo Installation completed. To use tools from anywhere, please add \"$(pwd)\" to the PATH.
