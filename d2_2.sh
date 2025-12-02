
checkvalid() {
    res=""
    cur=0
    len=$1
    rep=$2
    v1=$3
    v2=$4
    #echo "rep $rep"
    #echo "len $len"
    tmp=$(for i in $(seq 1 $(($len-1))) ; do echo -n "0" ; done)
    cur="1$tmp"
    cur=$(($cur - 1))
    while (( 1 == 1)); do
        cur=$(($cur + 1))
        new=$(for i in $(seq 1 $rep) ; do echo -n $cur ; done)

        #echo "cup $cur"
        #echo "nep $new"

        if [[ ${#cur} -gt $len ]]; then
            break;  
        fi
        if [[ $new -lt $v1 ]]; then
            continue;
        fi
        if [[ $new -gt $v2 ]]; then
            break;
        else
            res="$res\n$new"
            #echo "new $new"
        fi
    done
    echo $res
}
lines=$(cat input.txt | sed 's/,/\n/g')
result=""
count=0
while IFS= read -r line ; do
    v1=$(echo $line | sed 's/-.*$//g')
    v2=$(echo $line | sed 's/^.*-//g')

    l1=${#v1}
    l2=${#v2}

    #echo ""
    #echo "-----"
    $count=$(($count+1))
    echo "count: $count, v1 $v1, v2 $v2"

    for i in $(seq 1 $(($l1/2))); do
        if [[ $(($l1 % $i)) -eq 0 ]]; then
            result="$result$(checkvalid $i $(($l1/$i)) $v1 $v2)"
        fi
    done
    #echo "--*-*-*"
    if [[ $l1 != $l2 ]]; then
        tmp=$(for i in $(seq 1 $(($l2-1))) ; do echo -n "0" ; done)
        tmp="1$tmp"
        #echo "tmp $tmp"
        for i in $(seq 1 $(($l2/2))); do
            if [[ $(($l2 % $i)) -eq 0 ]]; then
                result="$result$(checkvalid $i $(($l2/$i)) $v1 $v2)"
            fi
        done
    fi

    #echo "res $result"

    #remove duplic and add result
done <<< "$lines"



echo "*--------*"
printf $result > tst.txt
cat tst.txt | uniq
