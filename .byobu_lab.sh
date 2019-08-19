#!/bin/bash

# simple script for opening a new byobu session in a desired directory layout

# note : paths can't be defined in quotes??? eg DIR1="~/lab/redesign" not found

SESH="lab"
DIR1=~/lab/redesign
DIR2=~/lab/redesign/src

# new session for basic development of lab
byobu new-session -d -s $SESH -c $DIR1

# basic dev windows
for i in {1..4}; do byobu new-window -t $SESH -n "" -c $DIR2; done

# server windows
for i in {6..7}; do byobu new-window -t $SESH -n "psmn" -c $DIR1; done
