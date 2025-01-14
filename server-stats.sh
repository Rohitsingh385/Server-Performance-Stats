./server-stats.sh: line 39: lsb_release: command not found
 OS Version:
 Uptime: up 40 minutes
awk: cmd. line:2: -
awk: cmd. line:2:  ^ unexpected newline or end of string
 Load Average:
 Logged-in Users: 3

==========================================
        End of Stats
==========================================
[root@ip-172-31-26-178 ec2-user]# vim server-stats.sh
[root@ip-172-31-26-178 ec2-user]# nano server-stats.sh
  GNU nano 5.8                                                                server-stats.sh                                                                 Modified
echo ""

# total Memory usage

echo "2. Total Memory Usage (Free vs Used):"
free -h | awk 'NR==2 {printf " Used: %s Free: %s (%.2f%% Used)\n", $3, $4, $3*100/($3+$4)}'
echo ""

# Total Disk usage

echo "3. Total Disk Usage (Free vs Used):"
df -h --total | awk '/total/ {printf "  Used: %s Free: %s (%.2f%% Used)\n", $3, $4, $5}'
echo ""

#top 5 processes by CPU usage

echo "4. Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 | awk 'NR==1 {print "  PID Command CPU%"} NR>1 {printf "   %-5s %-10s %.2f%%\n", $1, $2, $3}'
echo ""

# Top 5 processes by Memory usage
echo "5. Top 5 processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6 | awk 'NR==1 {print "  PID Command MEM%"} NR>1 {printf "  %-5s %-10s %.2f%%\n", $1, $2, $3}'
echo ""

# Stretch Goals

echo "6. Additional Information:"
echo " OS Version: $(lsb_release -d | awk -F '\t' '{print $2}')"
echo " Uptime: $(uptime -p)"
echo " Load Average: $(uptime | awk - F'load average:' '{print $2}')"
echo " Logged-in Users: $(who | wc -l)"
echo ""

echo "=========================================="
echo "        End of Stats                      "
echo "=========================================="

