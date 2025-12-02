

lines=$(cat input.txt | sed 's/,/\n/g')
result=0
while IFS= read -r line ; do
    v1=$(echo $line | sed 's/-.*$//g')
    v2=$(echo $line | sed 's/^.*-//g')

    l1=${#v1}
    l2=${#v2}

    #echo ""
    #echo "-----"
    echo "v1 $v1, v2 $v2"
    if [[ $(($l1 % 2 )) -eq 0 || $(($l2 % 2 )) -eq 0 ]]; then
        if [[ $(($l1 % 2 )) != 0 ]]; then
            tmp=$(for i in $(seq 1 $l1) ; do echo -n "0" ; done)
            cur="1$tmp"
            cur=$(echo $cur | head -c $((l2 / 2)))
        else
            cur=$(echo $v1 | head -c $((l1 / 2)))
        fi
        cur=$(($cur - 1))
        while (( 1 == 1)); do
            cur=$(($cur + 1))
            new=$cur$cur
            if [[ $new -lt $v1 ]]; then
                continue;
            fi
            if [[ $new -gt $v2 ]]; then
                break;
            else
                result=$((result + $new))
                #echo $new
            fi
        done
    fi
done <<< "$lines"

echo "*--------*"
echo $result
