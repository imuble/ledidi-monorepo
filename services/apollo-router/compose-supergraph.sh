#!/bin/bash

if ! command -v rover &> /dev/null; then
    echo "Rover is not installed. Installing Rover..."
    curl -sSL https://rover.apollo.dev/nix/v0.26.2 | sh
    export PATH=$PATH:$HOME/.rover/bin
else
    echo "Rover is already installed."
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Compose supergraph
echo "Composing supergraph..."
rover supergraph compose --elv2-license accept --config ${SCRIPT_DIR}/supergraph.docker.yaml > ${SCRIPT_DIR}/supergraph.graphql