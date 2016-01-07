#!/bin/bash
# Specific perequisites
# * Your display manager is configured to execute ~/.xinitrc at startup (default in most cases)

if [[ -f `pwd`/sharedfuncs ]]; then
  source sharedfuncs
else
  echo "missing file: sharedfuncs"
  exit 1
fi

setup_x11_keymap(){
  print_title "Add X11 layout to xinitrc"
  if [[ -f ~/.xinitrc ]]; then
    sed -i "/exec/isetxkbmap $X11_KEYMAP &" ~/.xinitrc
  else
    echo "~/.xinitrc cannot be found, creating it..."
cat << EOF > ~/.xinitrc 
#!/bin/sh
setxkbmap $X11_KEYMAP &
exec openbox-session
EOF
  fi
}

wifi(){
}

setup_autostart(){
  print_title "Configuring ~/.config/openbox/autostart"
  print "default keyboard layouts + switch command"
  
}
install_compton(){
  print_title "Compton - https://wiki.archlinux.org/index.php/Compton"
  print_info "Compton is a lightweight, standalone composite manager, suitable for use with window managers that do not natively provide compositing functionality."
  read_input_text "Install Compton"
  if [[ $OPTION == y ]]; then
  aur_package_install "compton"
  fi
}

setup_x11_keymap
