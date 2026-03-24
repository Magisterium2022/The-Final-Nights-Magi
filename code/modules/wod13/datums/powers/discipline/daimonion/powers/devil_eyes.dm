/datum/discipline/infernalist/devil_eyes
	name = "Devil Eyes"
	desc = "Grants you a third eye, able to see the unknown when open."
	icon_state = "protean"
	power_type = /datum/discipline_power/infernalist/devil_eyes

//Replaces eyes with special EEEEEEEVIL eyes.
/datum/discipline/infernalist/devil_eyes/post_gain()
	. = ..()

/datum/action/devil_eyes
	name = "Open or Close the Devil Eye"
	desc = "Open or Close the Devil Eye."
	button_icon_state = "auspex"
	button_icon = 'code/modules/wod13/UI/actions.dmi'
	background_icon_state = "discipline"
	icon_icon = 'code/modules/wod13/UI/actions.dmi'
	check_flags = AB_CHECK_CONSCIOUS

/datum/action/devil_eyes/Trigger(trigger_flags)
	if(!iskindred(owner))
		return
	var/obj/item/organ/eyes/devil_eyes/devil = owner.getorganslot(ORGAN_SLOT_EYES)
	if(!devil)
		return

	if(HAS_TRAIT(owner, TRAIT_DEVIL_EYE_OPEN))
		devil.eye_icon_state = "eyes"
		owner.update_body()
		owner.visible_message(span_danger("[owner]'s Third Eye sinks back into their head"), span_userdanger("You close your third eye!")) //Same text as Salubri.
		REMOVE_TRAIT(owner, TRAIT_DEVIL_EYE_OPEN, DEVIL_EYE_TRAIT)
	else
		devil.eye_icon_state = "devil_eyes"
		owner.update_body()
		owner.visible_message(span_danger("[owner] sprouts a Third Eye on their Forehead!"), span_userdanger("Your third eye forcibly awakens!"))
		ADD_TRAIT(owner, TRAIT_DEVIL_EYE_OPEN, DEVIL_EYE_TRAIT)
