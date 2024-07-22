{ ... }: {
 programs.oh-my-posh = {
   enable = true;
   enableNushellIntegration = true;
   settings = {
     version = 2;
     final_space = true;
     console_title_template = "{{ .Shell }} in {{ .Folder }}";
     blocks = [
       {
         type = "prompt";
         alignment = "left";
         newline = true;
         segments = [
           {
             type = "path";
             style = "plain";
             background = "transparent";
             foreground = "blue";
             template = "{{ .Path }}";
             properties = {
               "style" = "full";
             };
           }
           {
             type = "git";
             style = "plain";
             foreground = "p:grey";
             background = "transparent";
             template = " {{ .HEAD }}{{ if or (.Working.Changed) (.Staging.Changed) }}*{{ end }} <cyan>{{ if gt .Behind 0 }}⇣{{ end }}{{ if gt .Ahead 0 }}⇡{{ end }}</>";
             properties = {
               branch_icon = "";
               commit_icon = "@";
               fetch_status = true;
             };
           }
           {
             type = "text";
             name = "IN_NIX_SHELL";
             template = "{{ if .Env.IN_NIX_SHELL }} ❆ {{ end }}";
             style = "plain";
             foreground = "#61afef";
             backgound = "transparent";
           }
         ];
       }
       {
         type = "rprompt";
         overflow = "hidden";
         segments = [
           {
             type = "executiontime";
             style = "plain";
             foreground = "yellow";
             background = "transparent";
             template = "{{ .FormattedMs }}";
             properties = {
               threshold = 5000;
             };
           }
         ];
       }
       {
         type = "prompt";
         alignment = "left";
         newline = true;
         segments = [
           {
             type = "text";
             style = "plain";
             foreground_templates = [
               "{{if gt .Code 0}}red{{end}}"
               "{{if eq .Code 0}}magenta{{end}}"
             ];
             background = "transparent";
             template = "❯";
           }
         ];
       }
     ];
     transient_prompt = {
       foreground_templates = [
         "{{if gt .Code 0}}red{{end}}"
         "{{if eq .Code 0}}magenta{{end}}"
       ];
       background = "transparent";
       template = "❯ ";
     };
     secondary_prompt = {
       foreground = "magenta";
       background = "transparent";
       template = "❯❯ ";
     };
     env = {
       IN_NIX_SHELL = ''
         if [ -n "$IN_NIX_SHELL" ]; then
           echo "true"
         elif [ -n "$NIX_CC_WRAPPER" ]; then
           echo "true"
         else
           echo ""
         fi
       '';
      };
    };
  };
}