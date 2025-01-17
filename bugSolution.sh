#!/bin/bash

# This script demonstrates a solution to the race condition using flock.

# Create two files
touch file1.txt
touch file2.txt

# Use flock to acquire a lock on each file before writing
flock -n -x file1.txt || exit 1
echo "Process 1" > file1.txt
flock -u file1.txt

flock -n -x file2.txt || exit 1
echo "Process 2" > file2.txt
flock -u file2.txt

# Check if the file content is expected
if [ "$(cat file1.txt)" = "Process 1" ] && [ "$(cat file2.txt)" = "Process 2" ]; then
  echo "Files written correctly"
else
  echo "Error occurred"
fi