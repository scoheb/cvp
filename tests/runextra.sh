#!/bin/bash

echo "- start: check http output."
# debug
oc exec $1 -- rpm -q httpd
oc exec $1 -- ps aux

out=$(oc exec $1 -- curl localhost)
if [[ "out" != "Hello World!" ]]; then
	echo "- error: unexpected output is $out" >&2
	exit 1
fi
echo "- pass: check http output."
exit 0
