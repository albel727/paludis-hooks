#!/bin/sh
#
# Plugin to implement a `symlink` command of the config file
#

# @param cd  -- directory to change to before making a symlink
# @param src -- source name
# @param dst -- destination name
#
function cmd_symlink()
{
    local cd="$1"
    local src="$2"
    local dst="$3"

    if [ -d "${D}/$cd" ]; then
        ebegin "Making the symlink $src --> $dst"
        cd "${D}/$cd" \
          && ln -s $src $dst \
          && fsmh_warn_before \
          && cd - >/dev/null
        eend $?
    fi
}
