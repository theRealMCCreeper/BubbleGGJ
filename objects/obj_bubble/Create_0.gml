hspd = 0;
vspd = 0;

min_speed = 10;
initial_speed = 50;
vertical_initial_speed = 10;

//bounce_buffer = 64;

invince_time = game_get_speed(gamespeed_fps) * 0.5;
invince_tick = invince_time;

collision_tile_layer = layer_tilemap_get_id("Tiles_1");

function launch(_hdir)
{
	dir = _hdir;
	hspd = _hdir * initial_speed;
}

function bounce_bubble(_other_inst)
{
	#region beta
	/*
	_dir = sign(x - _other_inst.x);
	launch(_dir);
	x += dir * bounce_buffer;
	
	var _other_dir = sign(_other_inst.x - x);
	_other_inst.launch(_other_dir);*/
	#endregion
	
	#region beta 2
	/*
	if(_h_axis)
	{
		hspd = -hspd;
		
		_other_inst.hspd = -_other_inst.hspd;
	}*/
	#endregion
	
	hspd = sign(x - _other_inst.x) * initial_speed;
	_other_inst.hspd = sign(_other_inst.x - x) * initial_speed;
	
	vspd = sign(y - _other_inst.y) * vertical_initial_speed;
	_other_inst.vspd = sign(_other_inst.y - y) * vertical_initial_speed;
}

function pop()
{
	audio_play_sound(sfx_pop, 10, false);
	instance_destroy();
}