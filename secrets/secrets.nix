let
  matrix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK1XBOME5dPVVV9cKJT5ugL0EnThD6S93EVGaNxN27TP root@Matrix";
  atriwMatrix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMnhBKwRkPnYVaHsOstweFudd3bsgRZQbsTl4PE4drt5 atriw@Matrix";

  allKeys = [matrix atriwMatrix];
in {
  "atriw.age".publicKeys = allKeys;
  "git-wsl.age".publicKeys = allKeys;
}
