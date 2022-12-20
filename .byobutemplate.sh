#!/bin/bash

# simple script for opening a new byobu session in a desired directory layout

SESH="thesis"
DIR1=~/thesis
DIR2=~/thesis/Chapters
DIR3=~/temporalnets

# new session for basic development of lab
byobu new-session -d -s $SESH -c $DIR1

# basic dev windows
for i in {1..3}; 
do 
  byobu new-window -t $SESH -n "ch${i}" -c $DIR2; 
done

byobu new-window -t $SESH -n "art" -c $DIR3; 
byobu new-window -t $SESH -n "man" -c $DIR3; 
byobu new-window -t $SESH -n "supp" -c $DIR3; 
