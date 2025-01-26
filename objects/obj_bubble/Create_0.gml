hspd = 0;
vspd = 0;

min_speed = 10;
initial_speed = 50;
vertical_initial_speed = 10;

water_fall_speed = 5;//5;

//bounce_buffer = 64;

invince_time = game_get_speed(gamespeed_fps) * 0.5;
invince_tick = invince_time;

//properties
enum ET //element type
{
	NONE,
	WATER,
	GAS,
	FIRE,
	ENUM_COUNT
}
element = ET.NONE;

oil_inst = noone;

is_touching_source = false;

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
	if(oil_inst != noone)
	{
		oil_inst.follow_inst = noone;
		oil_inst.return_to_start();
		oil_inst = noone;
	}
	instance_destroy();
}

function pop_with_oil()
{
	instance_destroy(oil_inst);
	audio_play_sound(sfx_pop, 10, false);
	instance_destroy();
}

function collect_oil(_other)
{
	_other.follow_inst = self;
	oil_inst = _other;
}

function change_element(_element)
{
	//previous element
	switch(element)
	{
		case ET.WATER:
			vspd = 0;
			break;
			
		case ET.GAS:
			vspd = 0;
			break;
	}
	
	//current element
	switch(_element)
	{
		case ET.NONE:
			sprite_index = spr_bubble;
			break;
			
		case ET.WATER:
			sprite_index = spr_bubble_water;
			//vspd = water_fall_speed;
			break;
			
		case ET.FIRE:
			sprite_index = spr_bubble_fire;
			var hdir = 1
			if(hspd != 0)
				hdir = sign(hspd);
	
			hspd = initial_speed * hdir;
			break;
	}
	
	element = _element;
}

function touch_source(_source_type)
{
	if(is_touching_source)
		return false;
	
	switch(_source_type)
	{
		case ET.WATER:
			switch(element)
			{
				case ET.NONE: change_element(ET.WATER);
				case ET.FIRE: change_element(ET.NONE);
			}
			break;
			
		case ET.FIRE:
			switch(element)
			{
				case ET.NONE: change_element(ET.FIRE);
			}
			break;
	}
	
	is_touching_source = true;
	
	return true;
}

//--States--//
function wall_bubble_collisions()
{
	//horizontal
	//wall
	if(place_meeting(x+hspd,y,collision_tile_layer) || place_meeting(x+hspd,y,obj_wall))
	{
		pop();
	}
	//bubble
	var _bubble_inst = instance_place(x+hspd,y,obj_bubble);
	if(_bubble_inst != noone)
	{
		bounce_bubble(_bubble_inst);
	}
	x += hspd;
	
	
	//vertical
	var _water_fall = 0;
	if(element == ET.WATER)
		_water_fall = 0;//water_fall_speed;
		
	if(place_meeting(x,y+vspd+_water_fall,collision_tile_layer) || place_meeting(x,y+vspd+_water_fall,obj_wall))
	{
		pop();
	}
	//bubble
	var _bubble_inst = instance_place(x,y+vspd+_water_fall,obj_bubble);
	if(_bubble_inst != noone)
	{
		bounce_bubble(_bubble_inst);
	}
	y += vspd + _water_fall;
}