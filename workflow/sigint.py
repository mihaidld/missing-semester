#!/usr/bin/env python
import signal, time

# what the program should do when receiving a SIGINT: will not stop
# useful to save intermediate state of a program before exit altough user hits ^C
# to stop we need to send SIGQUIT with ^\ since program doesn't have a way of
# dealing with SIGQUIT
def handler(signum, time):
    print("\nI got a SIGINT, but I am not stopping")

# we tell the program when it gets a SIGINT (^C) to call handler
signal.signal(signal.SIGINT, handler)

# just count
i = 0
while True:
    time.sleep(.1)
    #go to start of line \r then print number ending with empty string
    #so stay on same line, just go back to start when printing each number
    print("\r{}".format(i), end="")
    i += 1
