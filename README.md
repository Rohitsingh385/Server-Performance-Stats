Goal of this project is to write a script to analyse server performance stats.

###############       Requirements     ############

You are required to write a script server-stats.sh that can analyse basic server performance stats. You should be able to run the script on any Linux server and it should give you the following stats:

Total CPU usage
Total memory usage (Free vs Used including percentage)
Total disk usage (Free vs Used including percentage)
Top 5 processes by CPU usage
Top 5 processes by memory usage


        ENVIRONMENT AND TOOLS

Linux-based server
Tools required - sysstat, lsb-release, ps, free,  df


        HOW TO RUN THE PROJECT
if you using cloud server
  - Ensure SSH access to the server using putty etc.
  - update the packages
  - create a file (eg. server-stats.sh{make sure the extension is .sh})
  - make the script executable {chmod +x server-stats.sh}
  - run the script (./server-stats.sh)

