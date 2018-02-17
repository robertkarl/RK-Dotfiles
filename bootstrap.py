#! /usr/bin/env python3

import argparse
import os
import shutil
import time

VIMRC = ".vimrc"

def user_dotfile_path(dotfile):
    return os.path.expanduser(os.path.join("~", dotfile))


def get_date_str():
    return time.strftime("%m%d-%I.%M%p")


def bootstrap(dotfile):
    userpath = user_dotfile_path(dotfile)
    copy_ops = [(dotfile, userpath)]
    if os.path.exists(userpath):
        copy_ops.insert(0, (userpath, dotfile + ".backup." + get_date_str()))
    return copy_ops


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--do_it", action='store_true')
    args = parser.parse_args()
    copy_ops = bootstrap(VIMRC)
    if not args.do_it:
        for src, dst in copy_ops:
            print("would move {} --> {}".format(src, dst))
    else:
        for source, dest in copy_ops:
            print("{} --> {}".format(source, dest))
            shutil.copy(source, dest)


if __name__ == "__main__":
    main()
