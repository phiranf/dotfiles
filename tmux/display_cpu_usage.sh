#!/bin/bash
# current CPU usage from two /proc/stat samples
read -r _ a1 a2 a3 i1 w1 x1 y1 z1 _ < /proc/stat
sleep 0.5
read -r _ b1 b2 b3 i2 w2 x2 y2 z2 _ < /proc/stat
idle=$(( (i2 + w2) - (i1 + w1) ))
total=$(( (b1+b2+b3+i2+w2+x2+y2+z2) - (a1+a2+a3+i1+w1+x1+y1+z1) ))
echo "$(( total ? 100 * (total - idle) / total : 0 ))%"
