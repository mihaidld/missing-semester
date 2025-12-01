pidwait(){
    keep=1 #to control loop
    while [ $keep -ne 0 ]
    do
        #get non zero exit status if pid doesn't exist
        #redirect STDOUT and STDERR from kill to /dev/null
        if ! kill -0 "$1" > /dev/null 2> /dev/null; then
            keep=0 #kill received nonzero exit code so pid stopped
        fi
        sleep 1 #sleep 1s before next iteration try to avoid wasting CPU
    done
}
