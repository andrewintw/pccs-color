#! /bin/sh
# https://stackoverflow.com/questions/2634590/using-a-variable-to-refer-to-another-variable-in-bash
#

v1="stringA"
v2="stringB"
v3="stringC"

get_v() {
	local tmp

	tmp="v$1"

	printf %s "${!tmp}"
}

echo `get_v 1`
echo `get_v 2`
echo `get_v 3`
