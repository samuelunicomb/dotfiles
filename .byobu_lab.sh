#!/bin/bash

# simple script for opening a new byobu session in a desired directory layout

# note : paths can't be defined in quotes??? eg DIR1="~/lab/redesign" not found

SESH="lab"
DIR1=~/lab
DIR2=~/lab/src
DIR3="~/lab/experiment-27/run08"

# new session for basic development of lab
byobu new-session -d -s $SESH -c $DIR1

# basic dev windows
for i in {1..6}; do byobu new-window -t $SESH -n "src$i" -c $DIR2; done

# server windows
for i in {6..7}; do byobu new-window -t $SESH -n "psmn" -c $DIR1; done
