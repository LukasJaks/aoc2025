file="input.txt"

cur=50

total=0

progres=0

while read line; do
    dir=${line:0:1}
    amo=$(echo $line | cut -c 2-)

    while [ $amo -ne 0 ]; do
        if [[ $dir = "R" ]]; then
            cur=$(($cur+1))
        else
            cur=$(($cur-1))
        fi
        amo=$(($amo-1))

        if [[ $cur -eq -1 ]]; then
            cur=99
        elif [[ $cur -eq 0 ]]; then
            total=$(($total + 1))
        elif [[ $cur -eq 100 ]]; then
            total=$(($total + 1))
            cur=0
        fi
    done
    progres=$(($progres + 1))

    if [[ $(( $progres % 100 )) -eq 0 ]]; then
        echo $progres
    fi
done < $file

echo ""
echo "------"
echo $total
echo "done"
