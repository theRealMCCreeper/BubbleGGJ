// UI MANAGER BEGIN STEP

// Set key data
for (var _i = 0; _i < KEY.LENGTH; ++_i)
{
	if (GET_KEYS[@_i].is_mouse)
	{
		GET_KEYS[@_i].prev_down = GET_KEYS[@_i].down;
		GET_KEYS[@_i].down = (mouse_button == GET_KEYS[@_i].check); 
		GET_KEYS[@_i].pressed = (!GET_KEYS[@_i].prev_down && GET_KEYS[@_i].down);
	}
	else
	{
		GET_KEYS[@_i].prev_down = GET_KEYS[@_i].down;
		GET_KEYS[@_i].down = keyboard_check(GET_KEYS[@_i].check); 
		GET_KEYS[@_i].pressed = (!GET_KEYS[@_i].prev_down && GET_KEYS[@_i].down);
	}
}
