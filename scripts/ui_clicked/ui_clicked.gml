// UI HANDLING SCRIPT

// Handles all kinds of ui button's code on being clicked
function ui_clicked(_id_button)
{	
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
			room_goto(rm_level1q);
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
		
		case "go_lvl1":
		if (UI_MANAGER.transition_awaiting)
		{
			room_goto(rm_level_1);
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
		
		case "go_lvl2":
		if (UI_MANAGER.transition_awaiting)
		{
			room_goto(rm_level_2);
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
		
		case "go_lvl3":
		if (UI_MANAGER.transition_awaiting)
		{
			room_goto(rm_level_3);
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
		
		case "go_lvl4":
		if (UI_MANAGER.transition_awaiting)
		{
			room_goto(rm_level_4);
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
		
		case "go_lvl5":
		if (UI_MANAGER.transition_awaiting)
		{
			room_goto(rm_level_5);
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
		
		case "go_lvl6":
		if (UI_MANAGER.transition_awaiting)
		{
			room_goto(rm_level_6);
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
		
		case "go_lvl7":
		if (UI_MANAGER.transition_awaiting)
		{
			room_goto(rm_level_7);
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
		
		case "go_lvl8":
		if (UI_MANAGER.transition_awaiting)
		{
			room_goto(rm_level_8);
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
		
		case "pause_game":
		UI_MANAGER.is_paused = !UI_MANAGER.is_paused;
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