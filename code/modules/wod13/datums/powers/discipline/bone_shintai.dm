/datum/discipline/bone_shintai
	name = "Bone Shintai"
	desc = "Channel the power of Metal."
	icon_state = 
	power_type = /datum/discipline_power/bone_shintai

/datum/discipline_power/bone_shintai
	name = "Bone Shintai power name"
	desc = "Bone Shintai power description"

	effect_sound = 'code/modules/wod13/sounds/boneshintai_activate.ogg'

//CORPSE SKIN	
/datum/discipline_power/bone_shintai/corpse_skin
	name = "Corpse Skin"
	desc = "Place a chosen target, including yourself, into a corpse-like state."

	level = 1
	check_flags = DISC_CHECK_CONSCIOUS
	yin_cost = 1

	toggled = TRUE
	duration_length = 2 TURNS

	hostile = TRUE
	violates_masquerade = TRUE

/datum/discipline_power/bone_shintai/corpse_skin/activate(mob/living/target)
	. = ..()
	caster.visible_message(span_danger("[target]'s body seizes with rigor mortis."), span_danger("Your senses dull to pain and everything else."))
	caster.dna.species.brutemod = max(0.2, caster.dna.species.brutemod-0.3) //equivalent of the existing artifact
	ADD_TRAIT(caster, TRAIT_NOSOFTCRIT, MAGIC_TRAIT)
	ADD_TRAIT(caster, TRAIT_NOHARDCRIT, MAGIC_TRAIT)
	ADD_TRAIT(caster, TRAIT_IGNOREDAMAGESLOWDOWN, MAGIC_TRAIT)
	caster.physiology.armor.melee += 25
	caster.physiology.armor.bullet += 25
	var/initial_limbs_id = caster.dna.species.limbs_id
	caster.set_body_sprite("rotten1")
	caster.update_body()
	ADD_TRAIT(caster, TRAIT_UNMASQUERADE, TRAUMA_TRAIT)

/datum/discipline_power/bone_shintai/corpse_skin/deactivate()
	. = ..()
	caster.visible_message(span_danger("[target]'s suddenly loses its unnatural pallor."), span_danger("Your senses flare back!"))
	REMOVE_TRAIT(caster, TRAIT_NOSOFTCRIT, MAGIC_TRAIT)
	REMOVE_TRAIT(caster, TRAIT_NOHARDCRIT, MAGIC_TRAIT)
	REMOVE_TRAIT(caster, TRAIT_IGNOREDAMAGESLOWDOWN, MAGIC_TRAIT)
	caster.physiology.armor.melee -= 25
	caster.physiology.armor.bullet -= 25
	caster.remove_movespeed_modifier(/datum/movespeed_modifier/necroing)
	caster.dna.species.limbs_id = initial_limbs_id
	caster.update_body()
	REMOVE_TRAIT(caster, TRAIT_UNMASQUERADE, TRAUMA_TRAIT)
