{ ... }: {
  home.file = {
    ".config/git/message".source = ../files/gitmessage;
  };

  programs.git = {
    enable = true;
    userName = "Maximilian Kapra";
    aliases = {
      a = "add";
      c = "commit -v";
      ca = "commit -v --amend";
      co = "checkout";
      d = "diff";
      ds = "diff --staged";
      nuke = "!f() { git clean -dfxf; git reset HEAD --hard; }; f";
      p = "push";
      rc = "rebase --continue";
      s = "status";
   };
    difftastic.enable = true;
    extraConfig = {
      diff = {
        tool = "difftastic";
      };
      difftool = {
        prompt = false;
        "difftastic" = {
          cmd = "difft \"\$LOCAL\" \"\$REMOTE\"";
        };
      };
      pager = {
        difftool = true;
      };
      commit = {
        template = "~/.config/git/message";
      };
    };
  };
}
