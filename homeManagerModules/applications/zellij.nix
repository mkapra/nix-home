{ pkgs-unstable, ... }: {
  programs.zellij.package = pkgs-unstable.zellij;

  home.file.".config/zellij/config.kdl".source = ../files/zellij_config.kdl;

  home.file.".config/zellij/themes/everforest-light.kdl".text = ''
themes {
    everforest-light-custom {
        text_unselected {
            base 92 106 114
            background 239 235 212
            emphasis_0 245 125 38
            emphasis_1 53 167 124
            emphasis_2 141 161 1
            emphasis_3 223 105 186
        }
        text_selected {
            base 92 106 114
            background 239 235 212
            emphasis_0 245 125 38
            emphasis_1 53 167 124
            emphasis_2 141 161 1
            emphasis_3 223 105 186
        }
        ribbon_selected {
            base 239 235 212
            background 141 161 1
            emphasis_0 248 85 82
            emphasis_1 245 125 38
            emphasis_2 223 105 186
            emphasis_3 58 148 197
        }
        ribbon_unselected {
            base 239 235 212
            background 92 106 114
            emphasis_0 248 85 82
            emphasis_1 92 106 114
            emphasis_2 58 148 197
            emphasis_3 223 105 186
        }
        table_title {
            base 92 106 114
            background 253 246 227
            emphasis_0 245 125 38
            emphasis_1 53 167 124
            emphasis_2 141 161 1
            emphasis_3 223 105 186
        }
        table_cell_selected {
            base 92 106 114
            background 239 235 212
            emphasis_0 245 125 38
            emphasis_1 53 167 124
            emphasis_2 141 161 1
            emphasis_3 223 105 186
        }
        table_cell_unselected {
            base 92 106 114
            background 239 235 212
            emphasis_0 245 125 38
            emphasis_1 53 167 124
            emphasis_2 141 161 1
            emphasis_3 223 105 186
        }
        list_selected {
            base 92 106 114
            background 239 235 212
            emphasis_0 245 125 38
            emphasis_1 53 167 124
            emphasis_2 141 161 1
            emphasis_3 223 105 186
        }
        list_unselected {
            base 92 106 114
            background 239 235 212
            emphasis_0 245 125 38
            emphasis_1 53 167 124
            emphasis_2 141 161 1
            emphasis_3 223 105 186
        }
        frame_selected {
            base 141 161 1
            background 0
            emphasis_0 245 125 38
            emphasis_1 53 167 124
            emphasis_2 223 105 186
            emphasis_3 0
        }
        frame_highlight {
            base 245 125 38
            background 0
            emphasis_0 245 125 38
            emphasis_1 245 125 38
            emphasis_2 245 125 38
            emphasis_3 245 125 38
        }
        exit_code_success {
            base 141 161 1
            background 0
            emphasis_0 53 167 124
            emphasis_1 239 235 212
            emphasis_2 223 105 186
            emphasis_3 58 148 197
        }
        exit_code_error {
            base 248 85 82
            background 0
            emphasis_0 223 160 0
            emphasis_1 0
            emphasis_2 0
            emphasis_3 0
        }
        multiplayer_user_colors {
            player_1 223 105 186
            player_2 58 148 197
            player_3 0
            player_4 223 160 0
            player_5 53 167 124
            player_6 0
            player_7 248 85 82
            player_8 0
            player_9 0
            player_10 0
        }
    }
}
  '';
}
