/obj/item/investiture_tome/ui_data(mob/user)
	. = list()
	.["user"] = list()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		.["user"]["Pact Level"] = H.pact_rating
		.["user"]["name"] = "[H.name]"
		.["user"]["job"] = "[H.mind?.assigned_role]"
		.["user"]["has_daimonion"] = H.daimonion_knowledge
	else if(isliving(user))
		var/mob/living/L = user
		.["user"]["Pact Level"] = L.pact_rating
		.["user"]["name"] = "[L.name]"
		.["user"]["job"] = "Unknown"
		.["user"]["has_daimonion"] = FALSE
	else
		.["user"]["Pact Level"] = 0
		.["user"]["name"] = "Unknown"
		.["user"]["job"] = "Unknown"
		.["user"]["has_daimonion"] = FALSE

/obj/item/investiture_tome/ui_act(action, params)
	if(action != "purchase")
		return ..()

	if(!isliving(usr))
		return ..()

	// for now, there are no items in the prize list, but this is ready for future implementation
	to_chat(usr, span_notice("The tome whispers that its pages remain empty, awaiting dark knowledge..."))
	return TRUE
