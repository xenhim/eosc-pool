#!/bin/sh

echo "Upgrading packages"

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

echo "Checking go & node version"

go version
node -v

echo "Upgrading EOS Classic"

cd go-eosclassic
git pull
make geth
sudo cp build/bin/geth /usr/local/bin/geth

echo "EOS Classic version"

geth version

echo "Upgrading EOS Classic Pool Software"

cd open-eosc-pool
git pull
make all
sudo cp build/bin/open-eosc-pool /usr/local/bin/open-eosc-pool

echo "Done Upgrading EOS Classic & EOS Classic Pool Software!"
