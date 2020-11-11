#!/usr/bin/env sh

source "$HOME/.config/rofi/rofiwal.sh"

function confirm {
	confres=$(echo -e "   Yes\n   No" | rofi "${walargs[@]}" -p "$1" -matching fuzzy -dmenu -i -width 14 -lines 2) 
	
	if [[ "$confres" =~ [*Yes] ]]; 
		then 
			return 0 
		else 
			return 1 
	fi
}

options=" Go back\n Lock\n Log out\n Reboot\n⏻ Power off"

chosen=$(echo -e "$options" | rofi "${walargs[@]}" -p "Power Options" -matching fuzzy -dmenu -i -width 14 -lines 5)

case $chosen in
	*Go\ back)
		;;
	
	*Lock)
		dm-tool switch-to-greeter
		;;

	*Log\ out)
		if $(confirm "Log out?") 
			then 
				i3-msg exit 
		fi
		;;

	*Reboot)
		if $(confirm "Reboot?") 
			then 
				reboot 
		fi
		;;

	*Power\ off)
		
		if $(confirm "Power off?") 
			then 
				poweroff 
		fi
		;;
esac
