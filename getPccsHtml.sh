#! /bin/sh
#
# Ref1: http://www.wsj21.net/ghp/ghp0c_03.html
# Ref2: https://farm6.staticflickr.com/5486/9924819306_84fec9c3dd_o.jpg
# Test: https://www.w3schools.com/html/tryit.asp?filename=tryhtml_default

tone_list="$@"
tone_num="$#"

tone_b="#f15d69 #f7774d #fba52f #f2d324 #b7bf19 #00b275 #00a39b #008fb3 #1979ba #716bb6 #9c5da0 #cc5c87"
tone_d="#9d5456 #a9634c #a9783f #a18e40 #85863c #418261 #1c7570 #1f6578 #345474 #514d72 #664768 #854c60"
tone_dk="#642a2e #6f3826 #704b1a #6b5e1b #535617 #185138 #004542 #004252 #14344e #312e4d #422944 #5d2d3f"
tone_dkg="#3d2f2f #3d2f2b #463b30 #423c2d #3e3d2d #27362e #253634 #273439 #242931 #292830 #2e272e #3c2f33"
tone_dp="#9f1b34 #a53b1b #aa6600 #a48f00 #717d00 #006f3e #00625c #00526f #004075 #343472 #5a265f #811f4c"
tone_g="#6f5858 #6f5951 #776656 #716951 #6c6a51 #576e61 #536e6c #4c6068 #4a525e #52505e #5a4e5a #6c585e"
tone_lt="#f59fa0 #ffb195 #ffc887 #f9e08a #d9d784 #8dd3ad #71c5be #71b1c7 #7e9dc3 #9c95c1 #b48fb5 #d995ac"
tone_ltg="#bda2a2 #bda39a #c7b3a0 #c0b69b #bab89b #95afa0 #90aeab #95acb5 #929caa #9c99a9 #a497a4 #b9a3aa"
tone_p="#e8cbcb #e8ccc3 #f3ddc9 #ebe0c4 #e5e2c4 #bdd9c9 #b9d8d5 #bed6df #bac4d3 #c5c2d3 #cebfce #e4ccd3"
tone_s="#c13547 #c7512c #db8b08 #d2b700 #9aa400 #008a52 #007b75 #006a8b #005692 #4b488e #753a7a #a03663"
tone_sf="#c8787a #d5896f #d59f62 #ccb664 #aead5f #66a986 #499b95 #498a9e #58779a #756f99 #8b698d #ae6f85"
tone_v="#cd1f42 #e55125 #f29500 #e2c500 #a4b300 #009a55 #007e77 #006b93 #00569c #474798 #793580 #ab2664"

get_tone () {
	local tmp
	tmp="tone_$1"
	printf %s "${!tmp}"
}

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
	local tone="$@"
	if [ -n "$tone" ]; then
		for i in $tone; do
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
		gen_td `get_tone $t`
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
