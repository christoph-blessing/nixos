{
  lib,
  writeShellScript,
  bluez,
  gnugrep,
  xorg,
}:

writeShellScript "configure_keyboard.sh" ''
  PATH=${
    lib.makeBinPath [
      bluez
      gnugrep
      xorg.xinput
      xorg.setxkbmap
    ]
  }

  configure_urchin () {
    xinput disable 'AT Translated Set 2 keyboard'
    setxkbmap us -option -option 'compose:menu'
  }

  configure_builtin () {
    xinput enable 'AT Translated Set 2 keyboard'
    setxkbmap mine -option -option 'compose:menu' -option 'caps:swapescape'
  }

  export DISPLAY=:0 XAUTHORITY=/home/chris/.Xauthority
  bluetoothctl devices Connected | grep urchin \
    && configure_urchin \
    || configure_builtin
''
