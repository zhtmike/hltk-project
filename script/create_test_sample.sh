# move 20% data to ../test directory
let n=$(ls | wc -l)/100*20 && ls | sort -R | tail -$n | xargs mv -t ../test
