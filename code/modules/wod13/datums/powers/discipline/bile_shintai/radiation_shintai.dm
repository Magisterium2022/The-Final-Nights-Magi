/datum/discipline/radiation_shintai
	name = "Radiation Shintai"
	desc = "Showcase the eroding nature of life."
	icon_state = "healer"
	power_type = /datum/discipline_power/radiation_shintai

/datum/discipline_power/radiation_shintai
	name = "Radiation Shintai power name"
	desc = "Radiation Shintai power description"

	activate_sound = 'code/modules/wod13/sounds/valeren.ogg'

//TREACHEROUS EARTH
/datum/discipline_power/radiation_shintai/treacherous_earth
	name = "Treacherous Earth"
	desc = "Root one's enemies to a spot."

	level = 1
	cost_tainted = 1
	check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE | DISC_CHECK_IMMOBILE | DISC_CHECK_FREE_HAND
	target_type = TARGET_HUMAN
	range = 7

	cooldown_length = 5 SECONDS

/datum/discipline_power/radiation_shintai/treacherous_earth/activate(mob/living/carbon/human/target)
	. = ..()
	if(HAS_TRAIT(target, LYING_DOWN_TRAIT)
		target.Paralyze(50) //Five seconds
	else
		ADD_TRAIT(target, TRAIT_IMMOBILIZED, MAGIC_TRAIT) //Add a callback to remove this.
