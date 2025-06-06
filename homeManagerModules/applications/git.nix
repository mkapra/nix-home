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
    diff-so-fancy.enable = true;
    extraConfig = {
      rerere.enabled = true;
      color.ui = "always";
      commit.template = "~/.config/git/message";
      branch.sort = "-committerdate";
      maintenance = {
        auto = false;
        strategy = "incremental";
      };
      core = {
        untrackedCache = true;
        fsmonitor = true;
      };
      "tig \"color\"" = {
	cursor = "red default underline";
	title-blur = "cyan default";
	title-focus = "cyan default bold";
      };
    };
  };
}
