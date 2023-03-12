#!/usr/bin/env bash

. "$(dirname $(readlink -f "$0"))/runlib"

unset LD_LIBRARY_PATH

export LAUNCH_GAME="   LAUNCH  GAME"
export CREATE_SHORTCUT="   CREATE  SHORTCUT"
export WINEFILE="   FILE  EXPLORER"
export WINECFG="   WINE  SETTINGS"
export CLEAR_PFX="   CLEAR  PREFIX"
export WINETRICKS="   WINETRICKS"
export STOP="   STOP"
export SETTINGS="   SETTINGS"
export ICON="${WINE_PATH}/data/img/w.png"

xsd=`zenity --title "$NW_VER" --text "" --window-icon="$ICON" --list --hide-header --width=270 \
--height=320 --column "" "${LAUNCH_GAME}" "${CREATE_SHORTCUT}" "${WINEFILE}" "${WINECFG}" "${CLEAR_PFX}" "${WINETRICKS}" "${STOP}" "${SETTINGS}" `

if [ $? -eq 1 ]; then
    exit 1
fi

case $xsd in
    "${LAUNCH_GAME}")
    LAUNCH_GAME "$@" ;;

    "${CREATE_SHORTCUT}")
    CREATE_SHORTCUT "$@" ;;

    "${WINEFILE}")
    WINEFILE "$@" ;;

    "${WINECFG}")
    WINECFG "$@" ;;

    "${CLEAR_PFX}")
    CLEAR_PFX "$@" ;;

    "${WINETRICKS}")
    WINETRICKS "$@" ;;

    "${STOP}")
    STOP "$@" ;;

    "${SETTINGS}")
    SETTINGS "$@" ;;
esac
