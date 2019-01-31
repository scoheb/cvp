#!/bin/bash

sig=$(oc exec $1 -- for i in $(rpm -qa | grep -v gpg-pubkey); do rpm -qi $i |
	grep ^Signature; done | cut -f3 -d"","" | sed 's/Key ID//' | tr -s ' ' |
	cut -b10- | sort | uniq -c)

if [[ "$sig" != '443 fd431d51' ]]; then
	echo "- error: unexpected signatures are $sig" >&2
	exit 1
fi
echo "- pass: image sanity tests"
exit 0
