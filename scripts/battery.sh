#!/usr/bin/env zsh
export PATH=$PATH:/home/robin/projects/hwinfo/bin


# CHARGE=$(printf "%.0f\n" $((100 * $(hwinfo battery energy_now) / $(hwinfo battery energy_full))))
CHARGE=$(printf "%.0f\n" $(hwinfo battery capacity))

LEVEL=$(((CHARGE-1)/20))
ICON="f$(( 244 - LEVEL ))"
echo -en " \u${ICON} ${CHARGE}%"

if [ "Charging" = $(hwinfo battery 0 status) ] 
then 
    echo -e " (Charging)"
elif [ "Charging" = $(hwinfo battery 1 status) ] 
then
    echo -e " (Charging)"
fi

# [[ "${LEVEL}" = "4" ]] && exit 33
# [[ "${LEVEL}" = "3" ]] && exit 33
# [[ "${LEVEL}" = "2" ]] && exit 33
# [[ "${LEVEL}" = "1" ]] && exit 33
[[ "${CHARGE}" -lt "25" ]] && exit 33


exit 0
