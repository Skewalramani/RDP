#!/bin/bash
/usr/bin/scp -i RadianDataProfiler.pem  /var/lib/jenkins/jobs/Automation/workspace/mdm.sql ec2-user@ec2-52-6-180-136.compute-1.amazonaws.com:/home/ec2-user/
echo "Hello World"
