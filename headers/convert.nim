
import os, strutils

proc exec(cmd: string) =
  if os.execShellCmd(cmd) != 0:
    echo "FAILURE ", cmd
  else:
    echo "SUCCESS ", cmd

proc main(dir: string) =
  for kind, file in walkDir(dir):
    case kind
    of pcDir:
      main(file)
    of pcFile:
      if file.endswith(".h"): exec("c2nim common.c2nim " & file)
    else: discard

main(getCurrentDir())
