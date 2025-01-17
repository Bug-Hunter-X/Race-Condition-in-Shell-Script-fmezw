This repository demonstrates a race condition bug in a shell script.  The `bug.sh` script shows the bug, and `bugSolution.sh` provides a solution using locks to prevent the race condition.  The bug arises because two processes write to files concurrently without synchronization, leading to unpredictable results.