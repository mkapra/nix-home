{ ... }: {
  programs.kitty.extraConfig = ''
    # Define the modifier key for default shortcuts
    kitty_mod ctrl+shift

    remember_window_size  no
    initial_window_width  1280
    initial_window_height 720

    map f1 new_window_with_cwd

    ## Window Management
    map cmd+enter new_window                                   # Create new window
    map cmd+n new_os_window                                   # Create new OS window
    map cmd+w close_window                                      # Close active window
    map cmd+r start_resizing_window                           # Resize window interactively
    map kitty_mod+] next_window                             # Focus next window
    map kitty_mod+[ previous_window                           # Focus previous window
    map kitty_mod+f move_window_forward                       # Move window forward
    map kitty_mod+b move_window_backward                      # Move window backward
    map kitty_mod+` move_window_to_top                         # Move window to top

    ## Miscellaneous
    map kitty_mod+escape kitty_shell window                   # Open kitty command shell
    map cmd+, edit_config_file                               # Open config file
    map cmd+. load_config_file                               # Reload config file
    map shift+cmd+/ show_kitty_doc overview                 # Show documentation
    map cmd+q quit                                             # Quit kitty
    map kitty_mod+delete clear_terminal reset active         # Reset terminal
    map kitty_mod+e open_url_with_hints                       # Open URL with hints
    map kitty_mod+f5 load_config_file                        # Reload config file

    # -------------------- Appearance
    include current-theme.conf

    confirm_os_window_close 0

    shell_integration no-cursor
    term xterm-256color

    # font settings
    # font_family       JetBrainsMono NF SemiBold
    # bold_font         JetBrainsMono NF Bold
    # italic_font       JetBrainsMono NF SemiBold Italic
    # bold_italic_font  JetBrainsMono NF Bold Italic

    font_size 10.0
    disable_ligatures cursor
    font_features +calt +liga

    cursor_blink_interval 0

    # window settings
    window_margin_width 5
    placement_strategy center

    # terminal bell settings
    visual_bell_duration 0
    enable_audio_bell no
    window_alert_on_bell no

    # -------------------- General
    scrollback_lines 2000
    strip_trailing_spaces smart

    # -------------------- Mouse Pointer
    default_pointer_shape arrow
    pointer_shape_when_dragging beam
    pointer_shape_when_grabbed hand

    update_check_interval 0
  '';

  home.file.".config/kitty/current-theme.conf".text = ''
    ## name: Everforest Light Medium
    ## author: Sainnhe Park
    ## license: MIT
    ## upstream: https://github.com/ewal/kitty-everforest/blob/master/themes/everforest_light_medium.conf
    ## blurb: A green based color scheme designed to be warm and soft

    foreground                      #5c6a72
    background                      #fdf6e3
    selection_foreground            #829181
    selection_background            #eaedc8

    cursor                          #5c6a72
    cursor_text_color               #f4f0d9

    url_color                       #3a94c5

    active_border_color             #8da101
    inactive_border_color           #bdc3af
    bell_border_color               #f57d26
    visual_bell_color               none

    wayland_titlebar_color          system
    macos_titlebar_color            system

    active_tab_background           #fdf6e3
    active_tab_foreground           #5c6a72
    inactive_tab_background         #fdf6e3
    inactive_tab_foreground         #939f91
    tab_bar_background              #fdf6e3
    tab_bar_margin_color            none

    mark1_foreground                #fdf6e3
    mark1_background                #3a94c5
    mark2_foreground                #fdf6e3
    mark2_background                #d3c6aa
    mark3_foreground                #fdf6e3
    mark3_background                #df69ba

    #: black
    color0                          #708089
    color8                          #829181

    #: red
    color1                          #f85552
    color9                          #e66868

    #: green
    color2                          #8da101
    color10                         #93b259

    #: yellow
    color3                          #dfa000
    color11                         #dfa000

    #: blue
    color4                          #3a94c5
    color12                         #3a94c5

    #: magenta
    color5                          #df69ba
    color13                         #df69ba

    #: cyan
    color6                          #35a77c
    color14                         #35a77c

    #: white
    color7                          #939f91
    color15                         #a6b0a0
  '';
}
