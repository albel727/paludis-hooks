#!/bin/bash
#
# Plugin to implement the `pretend use` command
#

#
# Function to modify USE variable
#
# It accepts a variadic count of parameters each of which should be preceded
# w/ action flag '+' to add or '-' to remove the flag specified.
#
# Example:
#   pretend-use +doc -static
# will add 'doc' and remove 'static' for USE variable, so latter rules may
# act differently...
#
# The main reason to intruduce this is to avoid rules duplication.
#
# @param list of USE modifications
#
function cmd_pretend_use()
{
    for use in $*; do
        # Ok, need to add a given USE (if latter still not here)
        if [[ ${use} =~ \+(.*) ]]; then
            local -r pure_use=${BASH_REMATCH[1]}
            [[ $USE =~ ${pure_use} ]] || USE="${USE} ${pure_use}"
            einfo "Pretending USE=${use} for ${P}"
        fi
        # TODO Handle '-use'...
    done
}
