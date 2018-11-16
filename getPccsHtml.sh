#! /bin/sh
#
# Ref1: http://www.wsj21.net/ghp/ghp0c_03.html
# Ref2: https://farm6.staticflickr.com/5486/9924819306_84fec9c3dd_o.jpg
# Test: https://www.w3schools.com/html/tryit.asp?filename=tryhtml_default

tone_list="$@"
tone_num="$#"

usage () {
	cat <<EOF

`basename $0` <toneFile1 toneFile2 toneFile3 ...>

Ex: ./getPccsHtml.sh v b lt p s sf ltg dp d g dk dkg

EOF
}

do_init () {
	if [ "$tone_num" -lt 1 ]; then
		usage
		exit 1
	fi
}

gen_td () {
	local tone="$1"
	if [ -f $tone ]; then
		for i in `cat $tone`; do
			echo "			<td bgcolor=\"$i\">&nbsp</td>"
		done
	else
		echo "no $tone exists"
		exit 1
	fi
}

gen_header () {
	cat <<EOF
<html>
<head>
<style type="text/css">
	body {
		padding: 0;
		margin: 0;
	}

	#page {
		font-size: 8px;
	}

	#page tr th {
		padding: 0;
		margin: 0;
	}

	#page td {
		padding: 0;
		margin: 0;
		min-width:27px;
	}

	#page {
		border-spacing: 4px;
	}
</style>
</head>
EOF
}

gen_body_table () {
	cat <<EOF
<body>
	<table id="page">
EOF
}

gen_table_tr_td () {
	for t in $tone_list; do
		echo "		<tr>"
		echo "			<th>`basename $t`</th>"
		gen_td $t
		echo "		</tr>"
	done
}

gen_footer () {
	cat <<EOF
	</table>
</body>
</html>
EOF
}

gen_html () {
	gen_header
	gen_body_table
	gen_table_tr_td
	gen_footer
}

do_main () {
	do_init
	gen_html
}

do_main
