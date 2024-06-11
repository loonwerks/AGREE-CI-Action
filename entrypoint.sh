#!/bin/sh -l

agreeOutput=$GITHUB_WORKSPACE/AGREE_output.json
ls -la $GITHUB_WORKSPACE

echo "workspace-location: $1"
echo "project-name: $2"
echo "component-to-analyze: $3"
echo "analysis-strategy: $4"
echo "optional-flags: $5"
echo "agreeOutput: $agreeOutput"

xvfb-run -e /dev/stdout -s "-screen 0 1280x1024x24 -ac -nolisten tcp -nolisten unix" /fmide/osate -application com.rockwellcollins.atc.agree.cli.Agree -noSplash -data $GITHUB_WORKSPACE/$1 -p $2 -c $3 -strategy $4 -o $agreeOutput $5

echo "timestamp=$(jq .date $agreeOutput)" >> $GITHUB_OUTPUT
echo "status=$(jq .status $agreeOutput)" >> $GITHUB_OUTPUT
echo "status-messages=$(jq .statusMessages $agreeOutput)" >> $GITHUB_OUTPUT

exitStatus=1
analysisStatus=$(jq .status $agreeOutput)
echo "analysisStatus: $analysisStatus"
if [ "XX $analysisStatus" = 'XX "No Counterexamples Found"' ]; then
	exitStatus=0
fi
echo "exitStatus: $exitStatus"
exit $exitStatus

