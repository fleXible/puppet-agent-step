#!/usr/bin/env bash
#
#/ usage: puppet_agent sudo loglevel arguments

set -u ; # fail fast.

if (( $# < 3 )); then
    grep '^#/ usage:' <"$0" | cut -c4- >&2; exit 2
fi

SUDO=$1;     shift
LOGLEVEL=$1; shift;
ARGUMENTS="$@";

if [[ "${LOGLEVEL}" == 'DEBUG' ]]; then
    set -x
fi

if [[ "${SUDO}" == true ]]; then
    PUPPET_CMD="sudo puppet agent"
else
    PUPPET_CMD="puppet agent"
fi

printf >&2 "Executing command=\"${PUPPET_CMD} ${ARGUMENTS}\"\n"

$PUPPET_CMD $ARGUMENTS
EXIT_CODE=$?

if ( [ "${EXIT_CODE}" == 0 ] || [ "${EXIT_CODE}" == 2 ] );
then
    FINAL_EXIT_CODE=0
else
    FINAL_EXIT_CODE=$EXIT_CODE
fi

printf >&2 "Exit code=${FINAL_EXIT_CODE} (original=${EXIT_CODE})\n"
exit ${FINAL_EXIT_CODE}
# Done.
