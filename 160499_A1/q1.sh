#!/bin/bash
declare -a single
single[1]=one
single[2]=two
single[3]=three
single[4]=four
single[5]=five
single[6]=six
single[7]=seven
single[8]=eight
single[9]=nine
declare -a double
double[1]=eleven
double[2]=twelve
double[3]=thirteen
double[4]=fourteen
double[5]=fifteen
double[6]=sixteen
double[7]=seventeen
double[8]=eighteen
double[9]=nineteen
declare -a doublen
doublen[1]=ten
doublen[2]=twenty
doublen[3]=thirty
doublen[4]=forty
doublen[5]=fifty
doublen[6]=sixty
doublen[7]=seventy
doublen[8]=eighty
doublen[9]=ninety
declare -a triple
triple[1]="one hundred"
triple[2]="two hundred"
triple[3]="three hundred"
triple[4]="four hundred"
triple[5]="five hundred"
triple[6]="six hundred"
triple[7]="seven hundred"
triple[8]="eight hundred"
triple[9]="nine hundred"
declare -a four
four[1]="one thousand"
four[2]="two thousand"
four[3]="three thousand"
four[4]="four thousand"
four[5]="five thousand"
four[6]="six thousand"
four[7]="seven thousand"
four[8]="eight thousand"
four[9]="nine thousand"

onedigit () {
  echo -n $single[$1]
  echo -n " "
}

twodigit () {
  echo -n $double[$1]
}

threedigit () {
  echo -n $triple[$1]
}

fourdigit () {
  echo -n $four[$1]
}

read new
new=`echo $new | sed -r 's/^0*//'`
len=${#new}
if [ $len -eq 1 ]; then
  echo ${single[$new]}

elif [ $len -eq 2 ]; then
  if [ $new -ge 10 ]&&[ $new -le 19 ]; then
    echo $new
    a=$((new-10))
    echo ${double[$a]}
  else
    echo $new
    b=$((new%10))
    a=$((new/10))
    echo $new
    echo $a $b
    echo "${doublen[$a]} ${single[$b]} "
  fi

elif [ $len -eq 3 ]; then
  c=${new:0:1}
  d=${new:1:2}
  echo -n ${triple[$c]}
  echo -n " "
  if [ $d -ge 10 ]&&[ $d -le 19 ]; then
    a=$((d-10))
    echo ${double[$a]}
  else
    b=$((new%10))
    a=$((new/10))
    a=$((a%10))
    echo "${doublen[$a]} ${single[$b]} "
  fi

elif [ $len -eq 4 ]; then
  e=${new:0:1}
  f=${new:1:3}
  echo -n ${four[$e]}
  echo -n " "
  c=${f:0:1}
  d=${f:1:2}
  echo -n ${triple[$c]}
  echo -n " "
  if [ $d -ge 10 ]&&[ $d -le 19 ]; then
    a=$((d-10))
    echo ${double[$a]}
  else
    b=$((new%10))
    a=$((new/10))
    a=$((a%10))
    echo "${doublen[$a]} ${single[$b]} "
  fi

elif [ $len -eq 5 ]; then
  g=${new:0:2}
  h=${new:2:3}
  if [ $g -ge 10 ]&&[ $g -le 19 ]; then
    a=$((g-10))
    echo ${double[$a]}
  else
    b=$((new%10))
    a=$((new/10))
    a=$((a%10))
    echo "${doublen[$a]} ${single[$b]} "
  fi

  echo -n " "
  echo -n "thousand"
  echo -n " "
  c=${h:0:1}
  d=${h:1:2}
  echo -n ${triple[$c]}
  echo -n " "
  if [ $d -ge 10 ]&&[ $d -le 19 ]; then
    a=$((d-10))
    echo ${double[$a]}
  else
    b=$((new%10))
    a=$((new/10))
    a=$((a%10))
    echo "${doublen[$a]} ${single[$b]} "
  fi

elif [ $len -eq 6 ]; then
  i=${new:0:1}
  j=${new:1:5}
    echo ${single[$i]}
  echo -n "lakh"
  echo -n " "
  g=${j:0:2}
  h=${new:3:3}
  if [ $g -ge 10 ]&&[ $g -le 19 ]; then
    a=$((g-10))
    echo ${double[$a]}
  else
    b=$((new%10))
    a=$((new/10))
    a=$((a%10))
    echo "${doublen[$a]} ${single[$b]} "
  fi
  echo -n " "
  echo -n "thousand"
  echo -n " "
  c=${h:0:1}
  d=${h:1:2}
  echo -n ${triple[$c]}
  echo -n " "
  if [ $d -ge 10 ]&&[ $d -le 19 ]; then
    a=$((d-10))
    echo ${double[$a]}
  else
    b=$((new%10))
    a=$((new/10))
    a=$((a%10))
    echo "${doublen[$a]} ${single[$b]} "
  fi
  fi
first () {

}
