#!/bin/bash

# simple script for opening a new byobu session in a desired directory layout

# note : paths can't be defined in quotes??? eg DIR1="~/lab/redesign" not found

SESH="thesis"
DIR1=~/thesis
DIR2=~/thesis/Chapters

# new session for basic development of lab
byobu new-session -d -s $SESH -c $DIR1

# basic dev windows
for i in {1..6}; do byobu new-window -t $SESH -n "Ch${i}" -c $DIR2; done

for i in A B C; do byobu new-window -t $SESH -n "app${i}" -c $DIR2; done

for i in {1..3}; do byobu new-window -t $SESH -n "misc${i}" -c $DIR1; done
