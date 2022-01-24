#!/bin/bash

# to run
# $ abi.sh <contract name>
# make sure env vars are set
abi() {
	NAME=$1
	ARGS=${@:2}

	# find file path
	CONTRACT_PATH=$(find . -name $NAME.sol)
	CONTRACT_PATH=${CONTRACT_PATH:2}

	# select the filename and the contract in it
	PATTERN=".contracts[\"$CONTRACT_PATH\"].$NAME"

    echo $PATTERN;
	# get the constructor's signature
	ABI=$(jq -r "$PATTERN.abi" out/dapp.sol.json)
	echo "$ABI";
}

abi $1