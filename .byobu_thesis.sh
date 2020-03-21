#!/bin/bash

# simple script for opening a new byobu session in a desired directory layout

# note : paths can't be defined in quotes??? eg DIR1="~/lab/redesign" not found

SESH="thesis"
DIR1=~/thesis
DIR2=~/thesis/Chapters
DIR3=~/thesis/article/
DIR4=~/thesis/gfx/Chapter5/article/

# new session for basic development of lab
byobu new-session -d -s $SESH -c $DIR1

# basic dev windows
for i in {1..5}; 
do 
  byobu new-window -t $SESH -n "ch${i}" -c $DIR2; 
done

for i in D; 
do 
  byobu new-window -t $SESH -n "app${i}" -c $DIR2; 
done

for i in {1..2}; 
do 
  byobu new-window -t $SESH -n "art${i}" -c $DIR1; 
done

byobu new-window -t $SESH -n "fig${i}" -c $DIR4; 
