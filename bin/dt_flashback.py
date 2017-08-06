#!/usr/bin/python
import os
import sys
import shutil

dirs = [".local", ".cache", ".config"]

for ldir in dirs:

  my_dir= os.getenv('HOME') + "/" +  ldir
#  shutil.copytree(ldir, my_dir)

## try to delete file ##
  try:
    print("removing [%s] . . ." % (my_dir), end="")
    shutil.rmtree(my_dir)
    print("[SUCCESS]")
  except OSError as e:  ## if failed, report it back to the user ##
    print("[FAILURE]")
    print("ERROR: [%s] : [%s]" % (e.filename,e.strerror))
