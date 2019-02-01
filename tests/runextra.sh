#!/bin/bash

echo "- start: check http output."
out=$(oc exec $1 -- curl localhost)
if [[ "out" != "Hello World!" ]]; then
	echo "- error: unexpected output is $out" >&2
	exit 1
fi
echo "- pass: check http output."
exit 0
