#!/bin/sh
# This is some secure program that uses security.
#echo "Starting to copy the generated files to remote server for environment "
#Environment="QA2"
#Module="extraction"
echo "Running for Environment"$Environment
echo "Running for Module"$Module 
PRD=ec2-52-6-180-136.compute-1.amazonaws.com
QA2=ec2-52-6-180-136.compute-1.amazonaws.com
INIT=ec2-52-6-180-136.compute-1.amazonaws.com
if [ "$Environment" == "prd" ] && [ "$Module" == "classification" ]; then
	appServer=$PRD
	target=/opt/node-v0.12.5-linux-x64/bin/classification
	source1=/var/lib/jenkins/jobs/Project2/workspace/PRD/Classification/DP_classification_v1.js
	source2=/var/lib/jenkins/jobs/Project2/workspace/PRD/Classification/DP_classification_v1.properties
elif [ "$Environment" == "prd" ] && [ "$Module" == "extraction" ]; then
	appServer=$PRD
	target=/opt/node-v0.12.5-linux-x64/bin/extraction
	source1=/var/lib/jenkins/jobs/Project2/workspace/PRD/Extraction/DP_Extraction_V1.js
	source2=/var/lib/jenkins/jobs/Project2/workspace/PRD/Extraction/DP_Extraction.properties
fi
if [ "$Environment" == "QA2" ] && [ "$Module" == "classification" ]; then
	appServer=$QA2
	target=/opt/node-v0.12.5-linux-x64/bin/classification
	source1=/var/lib/jenkins/jobs/Project2/workspace/QA2/Classification/DP_classification_v1.js
	source2=/var/lib/jenkins/jobs/Project2/workspace/QA2/Classification/DP_classification_v1.properties
elif [ "$Environment" == "QA2" ] && [ "$Module" == "extraction" ]; then
	appServer=$QA2
	target=/opt/node-v0.12.5-linux-x64/bin/extraction
	source1=/var/lib/jenkins/jobs/Project2/workspace/QA2/Extraction/DP_Extraction_V1.js
	source2=/var/lib/jenkins/jobs/Project2/workspace/QA2/Extraction/DP_Extraction.properties
fi
if [ "$Environment" == "INIT" ] && [ "$Module" == "classification" ]; then
	appServer=$INIT
	target=/opt/node-v0.12.5-linux-x64/bin/classification
	source1=/var/lib/jenkins/jobs/Project2/workspace/INIT/Classification/DP_classification_v1.js
	source2=/var/lib/jenkins/jobs/Project2/workspace/INIT/Classification/DP_classification_v1.properties
elif [ "$Environment" == "INIT" ] && [ "$Module" == "extraction" ]; then
	appServer=$INIT
	target=/opt/node-v0.12.5-linux-x64/bin/extraction
	source1=/var/lib/jenkins/jobs/Project2/workspace/INIT/Extraction/DP_Extraction_V1.js
	source2=/var/lib/jenkins/jobs/Project2/workspace/INIT/Extraction/DP_Extraction.properties
fi
scp -i /var/lib/jenkins/jobs/Project2/workspace/RadianDataProfiler.pem $source1 ec2-user@${appServer}:${target}
scp -i /var/lib/jenkins/jobs/Project2/workspace/RadianDataProfiler.pem $source2 ec2-user@${appServer}:${target}