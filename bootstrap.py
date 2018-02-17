#! /usr/bin/env python3

import argparse
import os
import shutil
import time

VIMRC = ".vimrc"
USER_VIMRC = os.path.expanduser(os.path.join("~", VIMRC))

def get_date_str():
    return time.strftime("%m%d-%I.%M%p")

def bootstrap_vim():
    copy_ops = []
    if os.path.exists(USER_VIMRC):
        copy_ops.append((USER_VIMRC, VIMRC + ".backup." + get_date_str()))
    copy_ops.append((VIMRC, USER_VIMRC))
    return copy_ops

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--do_it", action='store_true')
    args = parser.parse_args()
    copy_ops = bootstrap_vim()
    if not args.do_it:
        print(copy_ops)
    else:
        print("performing the following copies")
        print(copy_ops)
        for source, dest in copy_ops:
            shutil.copy(source, dest)

if __name__ == "__main__":
    main()
