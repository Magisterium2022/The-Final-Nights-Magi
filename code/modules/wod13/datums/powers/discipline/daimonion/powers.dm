/datum/discipline/infernalist //Copied from Paths code.
	var/action_type = /datum/action/discipline/infernalist
	var/action_replaced = FALSE
	selectable = FALSE //cant buy it as a ghoul

// Override post_gain to replace the action after the base system is done
/datum/discipline/infernalist/post_gain()
	. = ..()

	if(action_replaced || !owner)
		return

	addtimer(CALLBACK(src, PROC_REF(replace_base_action)), 1 SECONDS)

// so a 'base action' was being created for this, bugging out the UI, solved this by just replacing this 'base action' upon creation
/datum/discipline/infernalist/proc/replace_base_action()
	if(!owner)
		return

	var/datum/action/discipline/base_action = null
	for(var/datum/action/discipline/action in owner.actions)
		if(action.discipline == src && action.type == /datum/action/discipline)
			base_action = action
			break

	if(base_action)
		// Create the infernalist action
		var/datum/action/discipline/infernalist/infernalist_action = new /datum/action/discipline/infernalist(src)

		// Grant the infernalist action
		infernalist_action.Grant(owner)

		// Remove the base action
		base_action.Remove(owner)
		qdel(base_action)

		action_replaced = TRUE

/datum/action/discipline/infernalist
	check_flags = NONE
	button_icon = '' //Todo - Find good icons
	background_icon_state = "default"
	icon_icon = '' //Todo - Find good icons
	button_icon_state = "default"

/datum/action/discipline/infernalist/New(datum/discipline/discipline)
	. = ..()

/datum/action/discipline/infernalist/ApplyIcon(atom/movable/screen/movable/action_button/current_button, force = FALSE)
	button_icon = '' //Todo - Find good icons
	icon_icon = '' //Todo - Find good icons
	background_icon_state = "default"
	button_icon_state = "default"

	current_button.icon = '' //Todo - Find good icons
	current_button.icon_state = "default"

	if(icon_icon && button_icon_state && ((current_button.button_icon_state != button_icon_state) || force))
		current_button.cut_overlays(TRUE)

		if(discipline)
			current_button.name = discipline.current_power.name
			current_button.desc = discipline.current_power.desc

			var/discipline_icon_state = discipline.icon_state || "default"
			current_button.add_overlay(mutable_appearance('' //Todo - Find good icons, discipline_icon_state))
			current_button.button_icon_state = discipline_icon_state

			if(discipline.level_casting)
				current_button.add_overlay(mutable_appearance('' //Todo - Find good icons, "[discipline.level_casting]"))
		else
			current_button.add_overlay(mutable_appearance('' //Todo - Find good icons, "default"))
			current_button.button_icon_state = "default"
	return FALSE
