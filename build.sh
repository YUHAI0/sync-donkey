#!/usr/bin/env bash

echo -n "Enter target director name [sync]:"
read target
if [ -z $target ]; then target="sync"; fi

echo -n "Enter ssh user name []: "
read user

echo -n "Enter sudo password for $user []:"
read password

echo -n "Enter ssh port [22]:"
read port
if [ -z $port ]; then port=22; fi

if [ ! -d $target ]; then
    mkdir -p $target
else
    for file in $target/*; do
        rm -rf $file
    done
fi

for file in template/*.sh; do
    name=${file##*/}
    sed 's/{{USERNAME}}/'$user'/g' $file | sed 's/{{PASSWORD}}/'$password'/g' | sed 's/{{SSHPORT}}/'$port'/g' | sed 's/{{TARGET}}/'$target'/g' > $target/$name
    chmod +x $target/$name
done

echo "Execute script build succeed."
echo "Enter server nodes to finish"
cat > $target/nodes

if ! which expect >> /dev/null; then
    echo "Install expect..."
    sudo apt-get install expect -y
fi

