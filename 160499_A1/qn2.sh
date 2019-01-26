#!/bin/bash

function count_lines(){
  a1=`grep -rE '[\.|\?|\!]' -o "$1" | wc -l`
  a2=`grep -rE '[0-9]\.[0-9]' -o "$1" | wc -l`

  echo $((a1-a2))
}

function count_integers(){
  a1=`grep -rE '[0-9]*' -o "$1" | wc -l`
  a2=`grep -rE '[0-9]\.[0-9]' -o "$1" | wc -l`

  echo $((a1-2*a2))
}

function walk(){
        indent="$2"
	integers=`count_integers $1`
	sentences=`count_lines $1`
	path=`echo -n $1 | tr "/" "\n" | tail -n1`
	printf "%*s%s\n" $indent '' "(D)$path-$sentences-$integers"
        for entry in "$1"/*; do
		if [[ -d "$entry" ]]
		then
			walk "$entry" $((indent+4))
		elif [[ -f "$entry" ]]
		then	
			integers=`count_integers $entry`
			sentences=`count_lines $entry`
			path=`echo -n $entry | tr "/" "\n" | tail -n1`
			printf "%*s%s\n" $((indent+4)) '' "(F)$path-$sentences-$integers"
		fi
	done
}
walk "$1" 0
