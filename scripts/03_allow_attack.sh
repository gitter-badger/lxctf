#!/usr/bin/env bash



# run when attacking begins

for i in {1..127}
do
   iptables -D FORWARD -s "10.41.$i.0/24" -d "10.40.$i.1" -j ACCEPT -m comment --comment "time for defense"
   iptables -D FORWARD -s "10.42.$i.0/24" -d "10.40.$i.1" -j ACCEPT -m comment --comment "time for defense"
   iptables -D FORWARD -s 10.40.0.0/16,10.41.0.0/17,10.42.0.0/17 -d "10.40.$i.1" -j DROP -m comment --comment "block ssh"
done