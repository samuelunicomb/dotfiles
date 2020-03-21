#!/bin/bash

# simple script for opening a new byobu session in a desired directory layout

# note : paths can't be defined in quotes??? eg DIR1="~/lab/redesign" not found

SESH="defence"
DIR1=~/thesis/defence

# new session for basic development of lab
byobu new-session -d -s $SESH -c $DIR1

# basic dev windows
for i in {1..4}; do byobu new-window -t $SESH -n "ch${i}" -c $DIR1; done

for i in {1..2}; do byobu new-window -t $SESH -n "misc${i}" -c $DIR1; done
