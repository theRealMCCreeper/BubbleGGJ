// UI MANAGER STEP

if (GET_KEYS[@KEY.T].pressed)
{
	DEBUG_ACTIVE = !DEBUG_ACTIVE;
}

// Transition Timer Handling
if (transition_timer > 0)
{
	transition_timer--;
	transition_frame = 
			(do_transition_in)
			? floor(
				transition_in_frames
				* ((transition_in_length - transition_timer) / transition_in_length))
			: floor(
				transition_out_frames 
				* ((transition_out_length - transition_timer) / transition_out_length));
	if (transition_timer == 0 && transition_awaiting) menu_buttons.list[|menu_keyboard_target].on_click();
}

// Get all buttons and organize them to user's liking
if (set_buttons_current < set_buttons_total)
{
	set_buttons_current++
	if (set_buttons_current == set_buttons_total)
	{
		// Get all buttons from the scene
		var _current_room = asset_get_index(room_get_name(room));
		var _instances = room_get_info(_current_room, false, true).instances;
		
		for (var _i = 0; _i < array_length(_instances); ++_i)
		{				
			if (_instances[@_i].object_index == "text_button_obj" || 
				_instances[@_i].object_index == "image_button_obj")
			{
				if (_instances[@_i].id.button_number == noone || 
					menu_buttons.size == 0)
				{
					// button order wasn't set, so place it at end
					ds_list_add(menu_buttons.list, _instances[@_i].id);
					menu_buttons.size++;
				}
				else if (menu_buttons.size == 1)
				{
					// Singular value
					if (_instances[@_i].id.button_number > menu_buttons.list[|0].id.button_number)
					{
						ds_list_add(menu_buttons.list, _instances[@_i].id);
						menu_buttons.size++;
					}
					else
					{
						ds_list_insert(menu_buttons.list, 0, _instances[@_i].id);
						menu_buttons.size++;
					}
				}
				else if (_instances[@_i].id.button_number == 0 && menu_buttons.list[|0].id.button_number != 0)
				{
					ds_list_insert(menu_buttons.list, 0, _instances[@_i].id);
					menu_buttons.size++;
				}
				else
				{
					// sort buttons by their designated order
					for (var _j = 0; _j < menu_buttons.size; ++_j)
					{
						if (menu_buttons.list[|_j].id.button_number == noone)
						{
							// Add to end of all sortable items when encountering unsorted
							ds_list_insert(menu_buttons.list, _j, _instances[@_i].id);
							menu_buttons.size++;
							break;
						}
						else if (_j + 1 == menu_buttons.size)
						{
							// Add to end of list
							ds_list_add(menu_buttons.list, _instances[@_i].id);
							menu_buttons.size++;
							break;
						}
						else
						{
							// Add inbetween other buttons
							if (_instances[@_i].id.button_number
								> menu_buttons.list[|_j].id.button_number &&
								_instances[@_i].id.button_number
								< menu_buttons.list[|_j + 1].id.button_number)
							{
								ds_list_insert(menu_buttons.list, _j + 1, _instances[_i].id);
								menu_buttons.size++;
								break;
							}
						}			
					}
				}
			}
		}
	}
}
else
{	
	// Only allow menu actions if the game is paused
	// Note: title sceens count as paused!
	if (!is_paused || lock_inputs) exit;

	// Check to see if the mouse is currently in contact with any buttons
	menu_mouse_target = noone;
	for (var _i = 0; _i < menu_buttons.size; ++_i)
	{
		// Detects the button is being hovered over by the mouse
		if menu_buttons.list[|_i].mouse_over_button()
		{
			if (menu_buttons.list[|_i].ui_type == UI.TEXT)
			{
				menu_buttons.list[|_i].text_color_true = menu_buttons.list[|_i].text_color_hover;
				menu_buttons.list[|_i].backing_color_true = menu_buttons.list[|_i].backing_color_hover;
				menu_buttons.list[|_i].debug_color = c_fuchsia;
			}
			else
			{
				menu_buttons.list[|_i].image_color_true = menu_buttons.list[|_i].image_color_hover;
				menu_buttons.list[|_i].debug_color = c_lime;
			}
			menu_mouse_target = _i;
		}
		else
		{
			if (menu_buttons.list[|_i].ui_type == UI.TEXT)
			{
				menu_buttons.list[|_i].text_color_true = menu_buttons.list[|_i].text_color;
				menu_buttons.list[|_i].backing_color_true = menu_buttons.list[|_i].backing_color;
				menu_buttons.list[|_i].debug_color = c_purple;
			}
			else
			{
				menu_buttons.list[|_i].image_color_true = menu_buttons.list[|_i].image_color;
				menu_buttons.list[|_i].debug_color = c_green;
			}
		}
	}
	
	
	
	if (menu_mouse_target != noone)
	{
		// Set the keyboard variant to the button selected by the mouse
		menu_keyboard_target = menu_mouse_target;
		
		// Click the selected button
		if (GET_KEYS[@KEY.L_MOUSE].pressed || GET_KEYS[@KEY.SPACE].pressed || 
			GET_KEYS[@KEY.Z].pressed || GET_KEYS[@KEY.ENTER].pressed)
		{
			menu_buttons.list[|menu_keyboard_target].on_click();
		}
	}
	else
	{
		// Set the button to visibly be selected
		with (menu_buttons.list[|menu_keyboard_target])
		{
			if (ui_type == UI.TEXT)
			{
				text_color_true = text_color_hover;
				backing_color_true = backing_color_hover;
				debug_color = c_fuchsia;
			}
			else
			{
				image_color_true = image_color_hover;
				debug_color = c_lime;
			}
		}
		
		// Menu move left with keyboard
		if (GET_KEYS[@KEY.LEFT].pressed || GET_KEYS[@KEY.A].pressed)
		{
			// Play a sound effect
			print("reminder to put sound for menu keyboard down");
			
			// Go to designated key
			if (menu_buttons.list[|menu_keyboard_target].button_left != noone)
			{
				menu_keyboard_target = menu_buttons.list[|menu_keyboard_target].button_left;
			}
		}
		
		// Menu move up with keyboard
		if (GET_KEYS[@KEY.UP].pressed || GET_KEYS[@KEY.W].pressed)
		{
			// Play a sound effect
			print("reminder to put sound for menu keyboard up");
			
			// Go to designated key
			if (menu_buttons.list[|menu_keyboard_target].button_up != noone)
			{
				menu_keyboard_target = menu_buttons.list[|menu_keyboard_target].button_up;
			}
		}
		
		// Menu move right with keyboard
		if (GET_KEYS[@KEY.RIGHT].pressed || GET_KEYS[@KEY.D].pressed)
		{
			// Play a sound effect
			print("reminder to put sound for menu keyboard down");
			
			// Go to designated key
			if (menu_buttons.list[|menu_keyboard_target].button_right != noone)
			{
				menu_keyboard_target = menu_buttons.list[|menu_keyboard_target].button_right;
			}
		}
		
		// Menu move down with keyboard
		if (GET_KEYS[@KEY.DOWN].pressed || GET_KEYS[@KEY.S].pressed)
		{
			// Play a sound effect
			print("reminder to put sound for menu keyboard down");
			
			// Go to designated key
			if (menu_buttons.list[|menu_keyboard_target].button_down != noone)
			{
				menu_keyboard_target = menu_buttons.list[|menu_keyboard_target].button_down;
			}
		}
	
		// Click the selected button
		if (GET_KEYS[@KEY.SPACE].pressed || GET_KEYS[@KEY.Z].pressed || GET_KEYS[@KEY.ENTER].pressed) 
		{
			menu_buttons.list[|menu_keyboard_target].on_click();
		}
	}
}