#!/bin/bash

# simple script for opening a new byobu session in a desired directory layout

# note : paths can't be defined in quotes??? eg DIR1="~/lab/redesign" not found

SESH="graph"
DIR1=~/lab
DIR2=~/lab/src/graph/graphc
DIR3=~/lab/data/dynamic

# new session for basic development of lab
byobu new-session -d -s $SESH -c $DIR1

# basic dev windows
for i in {1..6}; do byobu new-window -t $SESH -n "grph" -c $DIR2; done

# gnuplot data windows
for i in {6..8}; do byobu new-window -t $SESH -n "dat" -c $DIR3; done
