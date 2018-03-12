#!/bin/bash

user="z5555555"
course=$1
asst=$2
shift 2

echo "CSE: mkdir -p ~/rgive/$course/$asst"
ssh $user@cse.unsw.edu.au "mkdir -p ~/rgive/$course/$asst"
echo "Copying files: $@"
scp -r "$@" $user@cse.unsw.edu.au:~/rgive/"$course"/"$asst"
echo "CSE: cd ~/rgive/$course/$asst"
echo "CSE: give $course $asst *"
ssh $user@cse.unsw.edu.au "cd ~/rgive/$course/$asst; give $course $asst *"
