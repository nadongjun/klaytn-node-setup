#Root PATH : ~/klaytn 
 
installBinary() {

    mkdir -p ~/klaytn/bins 
    wget -P ~/klaytn/bins -d https://packages.klaytn.net/klaytn/v1.7.3/homi-v1.7.3-0-darwin-10.10-amd64.tar.gz # 1.5s
    wget -P ~/klaytn/bins -d https://packages.klaytn.net/klaytn/v1.7.3/kscn-v1.7.3-0-darwin-10.10-amd64.tar.gz # 1.5s
    sleep 4s
    tar zxvf ~/klaytn/bins/homi-v1.7.3-0-darwin-10.10-amd64.tar.gz -C ~/klaytn/bins
    tar zxvf ~/klaytn/bins/kscn-v1.7.3-0-darwin-10.10-amd64.tar.gz -C ~/klaytn/bins
}

generateNodeKeyAndGenesisBlock() {

    ~/klaytn/bins/homi-darwin-10.10-amd64/bin/homi setup local --cn-num 1 --test-num 1 --servicechain --p2p-port 30000 -o ~/klaytn/homi-output
    ~/klaytn/bins/kscn-darwin-10.10-amd64/bin/kscn --datadir ~/klaytn/data init ~/klaytn/homi-output/scripts/genesis.json
    
    cp ~/klaytn/homi-output/scripts/static-nodes.json ~/klaytn/data/
    cp ~/klaytn/homi-output/keys/nodekey1 ~/klaytn/data/klay/nodekey
    cp ~/klaytn/homi-output/keys/passwd1 ~/klaytn/data/klay/passwd
 
}

configuration() {
    cp ~/klaytn/homi-output/scripts/static-nodes.json ~/klaytn/data/

    sed -i '' 's/PORT=22323/PORT=30000/' ~/klaytn/bins/kscn-darwin-10.10-amd64/conf/kscnd.conf
    sed -i '' 's@DATA_DIR=@DATA_DIR=~/klaytn/data@' ~/klaytn/bins/kscn-darwin-10.10-amd64/conf/kscnd.conf
}

runningServiceChainNode() {
    ~/klaytn/bins/kscn-darwin-10.10-amd64/bin/kscnd stop
    sleep 3
    ~/klaytn/bins/kscn-darwin-10.10-amd64/bin/kscnd start
    sleep 1s
    ~/klaytn/bins/kscn-darwin-10.10-amd64/bin/kscn attach --datadir ~/klaytn/data/
}

installBinary
sleep 1s
generateNodeKeyAndGenesisBlock
sleep 1s
configuration
sleep 1s
runningServiceChainNode