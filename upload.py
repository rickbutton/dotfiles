#!/usr/bin/env python
import os, sys

# cmd parsing
if len(sys.argv)>3 and os.path.isfile(sys.argv[3]): file=sys.argv[3]
else: print "Usage: upload.py user@host <remote-folder> <file>"; sys.exit()

# can be overridden by environment variables
mode='scp'
server=sys.argv[1]
remote_root=sys.argv[2]
local_root=os.getcwd()


# add other modes here
if mode=='scp':
  ext_path=os.path.join(os.getcwd().replace(local_root, remote_root), file)
  cmd = 'scp %s %s:%s'%(file, server, ext_path)
  failure = os.system(cmd)
  if failure: 
    sys.stdout.write("Running %s failed..."%cmd)
  else:
    sys.stdout.write("Uploaded %s"%file)
