// UI HANDLING SCRIPT

// Handles all kinds of ui button's code on being clicked
function ui_clicked(_id_button)
{
	// Play a sound effect
	show_debug_message("reminder to put sound for menu mouse clicking a button IN text_button_obj");
	
	// Runs code for whatever action should occur
	switch (_id_button.click_action)
	{
		case "go_title":
		if (UI_MANAGER.transition_awaiting)
		{
			room_goto(rm_title);
		}
		else
		{
			// Start transition
			UI_MANAGER.do_transition_in = false;
			UI_MANAGER.transition_timer = UI_MANAGER.transition_out_length;
			UI_MANAGER.transition_awaiting = true;
			UI_MANAGER.lock_inputs = true;
		}
		break;
		
		case "go_selection":
		if (UI_MANAGER.transition_awaiting)
		{
			room_goto(rm_selection);
		}
		else
		{
			// Start transition
			UI_MANAGER.do_transition_in = false;
			UI_MANAGER.transition_timer = UI_MANAGER.transition_out_length;
			UI_MANAGER.transition_awaiting = true;
			UI_MANAGER.lock_inputs = true;
		}
		break;
		
		case "go_credits":
		if (UI_MANAGER.transition_awaiting)
		{
			room_goto(rm_credits);
		}
		else
		{
			// Start transition
			UI_MANAGER.do_transition_in = false;
			UI_MANAGER.transition_timer = UI_MANAGER.transition_out_length;
			UI_MANAGER.transition_awaiting = true;
			UI_MANAGER.lock_inputs = true;
		}
		break;
		
		case "debug_start":
		if (UI_MANAGER.transition_awaiting)
		{
			room_goto(rm_level1);
		}
		else
		{
			// Start transition
			UI_MANAGER.do_transition_in = false;
			UI_MANAGER.transition_timer = UI_MANAGER.transition_out_length;
			UI_MANAGER.transition_awaiting = true;
			UI_MANAGER.lock_inputs = true;
		}
		break;
		
		case "game_end":
		if (UI_MANAGER.transition_awaiting)
		{
			game_end();
		}
		else
		{
			// Start transition
			UI_MANAGER.do_transition_in = false;
			UI_MANAGER.transition_timer = UI_MANAGER.transition_out_length;
			UI_MANAGER.transition_awaiting = true;
			UI_MANAGER.lock_inputs = true;
		}
		break;
		
		default:
		show_debug_message("invalid click_action");
		break;
	}
}