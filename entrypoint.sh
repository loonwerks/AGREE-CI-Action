#!/bin/sh -l

echo "workspace-location: $1"
echo "project-name: $2"
echo "component-to-analyze: $3"
echo "analysis-strategy: $4"
echo "optional-flags: $5"
ls /github/workspace
ls -la .
xvfb-run -e /dev/stdout -s "-screen 0 1280x1024x24 -ac -nolisten tcp -nolisten unix" /fmide/osate -application com.rockwellcollins.atc.agree.cli.Agree -noSplash -data $GITHUB_WORKSPACE/$1 -p $2 -c $3 -strategy $4 -o /github/workspace/AGREE_output.json $5
exitStatus=$?
cat /github/workspace/AGREE_output.json >> $GITHUB_OUTPUT
exit $exitStatus

