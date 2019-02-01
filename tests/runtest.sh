#!/bin/bash

echo "- start: check sigatures."
sig=$(oc exec $1 -- bash -c "rpm -qia | grep ^Signature | cut -f3 -d, | sort |
      uniq")

if [[ "$sig" != ' Key ID 199e2f91fd431d51' ]]; then
	echo "- error: unexpected signatures are $sig" >&2
	exit 1
fi

echo "- pass: check sigatures."
exit 0
