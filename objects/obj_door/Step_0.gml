if(finished_setup == false)
{
	image_index = is_open;
	target_is_open = is_open;
	
	finished_setup = true;
}

if(target_is_open != is_open)
{
	if(!place_meeting(x, y, obj_player) && !place_meeting(x, y, obj_bubble))
	{
		is_open = target_is_open
		image_index = is_open
	}
}