// Handles all kinds of ui button's code on being clicked
function ui_clicked(_id_button)
{
	// Play a sound effect
	show_debug_message("reminder to put sound for menu mouse clicking a button IN text_button_obj");
	
	// Runs code for whatever action should occur
	switch (_id_button.click_action)
	{
		case "debug_start":
		room_goto(rm_level1);
		break;
		
		default:
		show_debug_message("invalid click_action");
		break;
	}
}