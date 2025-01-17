#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Start two background processes that write to the files concurrently
(echo "Process 1" > file1.txt) &
(echo "Process 2" > file2.txt) &

# Wait for the processes to finish
wait

# Check if the file content is expected
if [ "$(cat file1.txt)" = "Process 1" ] && [ "$(cat file2.txt)" = "Process 2" ]; then
  echo "Files written correctly"
else
  echo "Race condition occurred"
fi