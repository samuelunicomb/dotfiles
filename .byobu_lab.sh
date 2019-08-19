#!/bin/bash

SESH="lab"
# this doesn't work in quotes ??????????
DIR=~/lab/redesign
CURDIR=$(pwd)

echo $CURDIR

# new session for basic development of lab
byobu new-session -d -s $SESH -c $DIR

# basic dev windows
for i in {1..5}; do byobu new-window -t $SESH -n "" -c $DIR; done

# server windows
for i in {6..7}; do byobu new-window -t $SESH -n "psmn" -c $DIR; done
