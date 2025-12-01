file="input.txt"

cur=50

total=0

while read line; do
    dir=${line:0:1}
    amo=$(echo $line | cut -c 2-)

    if [[ $dir = "R" ]]; then
        cur=$(($cur + $amo))
    else
        cur=$(($cur - $amo))
    fi

    if [[ $cur -lt 0 ]]; then
        cur=$(($cur * -1))
        cur=$((100 - $cur))
    fi

    div=$(( $cur / 100 ))
    if [[ $cur -ne 0 ]]; then
        div=$(( $div * 100 ))
        cur=$(($cur - div))
    fi

    if [[ $cur -eq 0 ]]; then
        total=$(($total + 1))
    fi

    progres=$(($progres + 1))

    if [[ $(( $progres % 100 )) -eq 0 ]]; then
        echo $progres
    fi
done < $file

echo ""
echo $total
echo "done"
