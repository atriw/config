{pkgs}:
with pkgs;
  writeScriptBin "chat" (builtins.readFile ../../bin/chat)
