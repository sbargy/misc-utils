#!/usr/bin/env python3

# system imports
import argparse
import sys, os

################################################################################
def main():
    parser = argparse.ArgumentParser(description="Call system exe caffeinate \
            with appropriate args, take hours args and convert to seconds")
    parser.add_argument("hours",
                        type = int,
                        help="Numbers of hours to stay awake",
                        action="store")

    args = parser.parse_args()

    callCaffeinate(args.hours)


################################################################################
def callCaffeinate(hours):
    seconds = hours * 3600 # 60 mins * 60 secs to get seconds
    flags = "-disu" # all the things to set to stay awake

    # Mac OSX specific
    # assumes caffeinate is installed on the system and is in your path
    time = "date '+Starting at %H:%M'"
    os.system(time)
    cmd = "caffeinate {} -t {}".format(flags, seconds) # -t is time in seconds
    print(cmd)
    os.system(cmd)

################################################################################
if __name__ == '__main__':
    main()
