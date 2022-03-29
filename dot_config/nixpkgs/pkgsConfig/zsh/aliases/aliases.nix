{ ... };
{
  programs.zsh = {
    shellAliases = {
      # Allow sudo to use aliases http://www.shellperson.net/using-sudo-with-an-alias/
      sudo = "sudo ";
      please = "sudo ";

      # Nav
      "~~" = "cd ~";
      ".." = "cd ..";

      # Fix typos
      cds = "cd";
      gitty = "git";
    };
  };
}
