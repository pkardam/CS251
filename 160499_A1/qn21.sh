#1/bin/bash
function count_lines(){
  a1=`grep -E '[\.|\?|\!]' -o "$1" | wc -l`
  a2=`grep -E '[0-9]\.[0-9]' -o "$1" | wc -l`

  echo $((a1-a2))
}

function count_integers(){
  a1=`grep -E '[0-9]*' -o "$1" | wc -l`
  a2=`grep -E '[0-9]\.[0-9]' -o "$1" | wc -l`

  echo $((a1-2*a2))
}
function abc(){
  total_lines=0
  total_integers=0
  cd "$1"
  ls | while read -r file
  do
    if [[ -f $file ]]
    then
        lines=`count_lines $file`
        integers=`count_integers $file`
        total_lines=$((total_lines + lines))
        total_integers=$((total_integers + integers))
        i=0
        b=""
      	while [ $i -lt $[$2+4] ]
      	do
      		b+=" "
      		((i++))
      	done
        echo "$b(F)$file-$lines-$integers"
    else
        a=`abc "$file" $[$2+4]`
        array=(`echo -n $a | tr "-" "\n"`)
        #echo ${array[0]}
        echo $a
        #echo ${array[1]}
        #echo ${array[2]}
        total_lines=$((total_lines + array[1]))
        total_integers=$((total_integers + ${array[2]}))
        abc "$file" $[$2+4]
    fi
  done
  cd ..

  i=0
  b=""
	while [ $i -lt $2 ]
	do
    b+=" "
		((i++))
	done

  echo "$b(D)$1-$total_lines-$total_integers"
}

abc "$1" 0
