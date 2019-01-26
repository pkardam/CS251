#!/bin/bash
digits=("zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine" "ten" "eleven" "twelve" "thirteen" "fourteen" "fifteen" "sixteen" "seventeen" "eighteen" "nineteen" "twenty" "twenty one" "twenty two" "twenty three" "twenty four" "twenty five" "twenty six" "twenty seven" "twenty eight" "twenty nine" "thirty" "thirty one" "thirty two" "thirty three" "thirty four" "thirty five" "thirty six" "thirty seven" "thirty eight" "thirty nine" "forty" "forty one" "forty two" "forty three" "forty four" "forty five" "forty six" "forty seven" "forty eight" "forty nine" "fifty" "fifty one" "fifty two" "fifty three" "fifty four" "fifty five" "fifty six" "fifty seven" "fifty eight" "fifty nine" "sixty" "sixty one" "sixty two" "sixty three" "sixty four" "sixty five" "sixty six" "sixty seven" "sixty eight" "sixty nine" "seventy" "seventy one" "seventy two" "seventy three" "seventy four" "seventy five" "seventy six" "seventy seven" "seventy eight" "seventy nine" "eighty" "eighty one" "eighty two" "eighty three" "eighty four" "eighty five" "eighty six" "eighty seven" "eighty eight" "eighty nine" "ninety" "ninety one" "ninety two" "ninety three" "ninety four" "ninety five" "ninety six" "ninety seven" "ninety eight" "ninety nine")

hundred () {
  num=$1
  #printf "%s\n" $num
  if [ $num -eq 0 ]
  then
    echo -n "0"
  elif [ $num -ge 100 ]
  then
    a=$((num/100))
    num=$((num%100))
    ans="${digits[$a]} hundred"
    if [ $num -ne 0 ]
    then
      ans+=" ${digits[$num]}"
    fi
    echo -n $ans
  else
    echo -n ${digits[$1]}
  fi
}


if [ $# -ne 1 ]
then
    echo "Invalid"
    exit -1
fi

num=$1
reg='[^0-9]+'
if [[ $num =~ $reg ]]
then
      echo "invalid input"
      exit -1
fi

num=`echo -n $num | sed 's/^0*//g'`
if [ -z $num ]
then
  num="0"
fi

if [[ ${#num} -gt 11 ]]
then
      echo "invalid input"
      exit -1
fi
answer=""
zero="0"
if [ "$num" == "$zero" ]
then
  answer=${digits[$num]}
else
  a=$((num%1000))
  answer=`hundred $a`

  num=$((num/1000))
  a=$((num%100))
  ans=`hundred $a`
  if [ "$ans" != "$zero" ]
  then
    answer="${ans} thousand ${answer}"
  fi

  num=$((num/100))
  a=$((num%100))
  ans=`hundred $a`
  if [ "$ans" != "$zero" ]
  then
    answer="${ans} lakh ${answer}"
  fi

  num=$((num/100))
  a=$((num%1000))
  ans=`hundred $a`
  if [ "$ans" != "$zero" ]
  then
    answer="${ans} crore ${answer}"
  fi

  num=$((num/1000))
  a=$((num%100))
  ans=`hundred $a`
  if [ "$ans" != "$zero" ]
  then
    answer="${ans} thousand ${answer}"
  fi
fi
echo $answer
