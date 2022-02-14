# Contract Deployment 
A simple contract deployment using dapp.tools.

## Execution
build the contract
```
dapp install ds-test
dapp build
```

test the contract
```
dapp test
```

to run local testnet
```
dapp testnet
# this will output local testnet details
# the ip:port and one demo account
```

add env vars
```
cp .env.sample .env
# update the vars
# ETH_FROM is your metamask account address
# ETH_RPC_URL can be localhost net or alchemy api url
# DEPLOYED_CONTRACT can be empty until hosted
```

add your owner acc into keystore
```
ethsign import
# add private key from metamask and password
```

deployment
```
source .env
dapp create Counter
```

copy the contract address into env var

generate an abi file 
```
chmod +xr scripts/*.sh
./scripts/abi.sh Counter > ./src/interact/Counter.abi.json
```

run the script 
```
npm run install
npm run index
# this should print out counter = 0
```

to update the counter with seth cli
- send : used when a function is state changing
- call : used when a function doesn't involve state changing (read only)
         no gas is required for call function
```
source .env
seth send $DEPLOYED_CONTRACT "updateCounter()"

# to read counter in cli
seth call $DEPLOYED_CONTRACT "getCounter()"
# now counter should be 1
```

