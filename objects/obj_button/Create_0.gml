held_tick = 0
held_time = game_get_speed(gamespeed_fps);
image_index = 1

function press()
{
	if(image_index == 0)
		return false;
		
	//is_on = !is_on;
	
	held_tick = held_time;
	image_index = 0;
	
	if(instance_exists(obj_door))
		obj_door.toggle_state();
	
	return true;
}