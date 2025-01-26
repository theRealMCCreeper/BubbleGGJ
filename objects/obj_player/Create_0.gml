spd = 40;
hspd = 0; //h velocity
vspd = 0; //v velocity
grav = 4; //gravity
jump_force = -96; //jump forcgrounded = false;

bubble_jump_force = -96;
bubble_shoot_offset = 600;
is_jump_variable = false; //Variable means variable jump height.
climb_water_speed = -32;
water_grav = 2;

grav_max = 100;
water_grav_max = 25;

dir = 1;

//walking sound
walk_sound_time = game_get_speed(gamespeed_fps) * 0.5;
walk_sound_tick = 0;

//shooting
shoot_cooldown_tick = 0;
shoot_cooldown_time = game_get_speed(gamespeed_fps);

//coyote time
//gives players a buffer to jump slightly off the edge
can_jump = 0;
coyote_time = 8;

collision_tile_layer = layer_tilemap_get_id("Tiles_1");

enum PS //player state
{
	ACTIVE,
	VICTORY,
	ENUM_COUNT
}

state = PS.ACTIVE;

// ---- functions ---- //
function change_state(new_state)
{
	//exit state code
	switch(state)
	{
		case PS.ACTIVE:
			break;
	}
	
	state = new_state;
	
	//enter state code
	switch(state)
	{
		case PS.ACTIVE:
			break;
			
		case PS.VICTORY:
			sprite_index = spr_player_victory;
			image_index = 0;
			audio_play_sound(sfx_tada, 10, false);
			break;
	}
}

function move_with_collisions()
{
	//horizontal
	if(place_meeting(x+hspd, y, collision_tile_layer))
	{
		while(!place_meeting(x+sign(hspd),y,collision_tile_layer))
			x += sign(hspd);
		hspd = 0;
	}
	x += hspd;
	
	//vertical
	if(place_meeting(x,y+vspd,collision_tile_layer))
	{
		while(!place_meeting(x,y+sign(vspd),collision_tile_layer))
			y += sign(vspd);
		vspd = 0;
	}
	y += vspd;
}

function shooting()
{
	//shooting
	if(GET_KEYS[@KEY.J].pressed && shoot_cooldown_tick <= 0)
	{
		var _bubble_inst = instance_create_depth(x + dir * bubble_shoot_offset, y, depth + 10, obj_bubble);
		with(_bubble_inst)
		{
			if(place_meeting(x,y,obj_bubble))
			{
				instance_destroy();
				return false;
			}
		}
		
		shoot_cooldown_tick = shoot_cooldown_time;
		_bubble_inst.launch(dir);
		instance_create_depth(x, y, depth - 10, obj_muzzle_flash).image_xscale = image_xscale;
	}else shoot_cooldown_tick -= 1;
}

function bubble_bouncing()
{
	var _bubble_inst = instance_place(x,y+vspd,obj_bubble);
	if(_bubble_inst != noone && vspd > 0)
	{
		//vspd = bubble_jump_force;
		//is_jump_variable = false;
		jump(false, bubble_jump_force);
		with(_bubble_inst)
		{
			pop();
		}
	}
}

function jump(_is_jump_variable, _force)
{
	vspd = _force;
	is_jump_variable = _is_jump_variable;	
	audio_play_sound(sfx_jump, 11, false);
}

function update_grounded()
{
	//grounded = place_meeting(x,y+1,collision_tile_layer);
	set_grounded(place_meeting(x,y+1,collision_tile_layer));
}

function set_grounded(new_grounded)
{
	grounded = new_grounded;
	
	if(grounded)
	{
		can_jump = coyote_time;
	}
}

function gravity_and_jumping()
{
	if(!grounded)
	{	
		vspd += grav;
		vspd = min(grav_max, vspd);
		
		can_jump -= 1;
		
		bubble_bouncing();
	}
	else
	{	
		can_jump = coyote_time;
	}
	
	if(can_jump > 0 && GET_KEYS[@KEY.SPACE].pressed)
	{
		//vspd = jump_force;
		//is_jump_variable = true;
		jump(true, jump_force);
	}
	
	//Variable jump
	if(is_jump_variable && vspd < 0 && !GET_KEYS[@KEY.SPACE].down)
		vspd = max(vspd,jump_force / 4);
}




// ---- states ----//
function active()
{
	//inputs
	var _h_axis = GET_KEYS[@KEY.RIGHT].down - GET_KEYS[@KEY.LEFT].down;
	
	var _i_jump_pressed = GET_KEYS[@KEY.SPACE].pressed;
	var _i_jump = GET_KEYS[@KEY.SPACE].down;
	
	//Victory
	if(place_meeting(x,y,obj_oil_door) && obj_oil_door.sprite_index == spr_oil_door_opened)
	{
		change_state(PS.VICTORY);
	}
	
	shooting();
	
	//walking
	hspd = _h_axis * spd;
	if(sign(hspd) != 0)
		dir = sign(hspd);
	
	if(place_meeting(x,y,obj_water_source))
	{
		set_grounded(true);
		
		if(_i_jump)
		{
			vspd = climb_water_speed;
		}else
		{
			vspd += water_grav;
			vspd = min(water_grav_max, vspd);
		}
		bubble_bouncing();
	}else
	{
		//Update grounded.
		update_grounded();

		//Gravity + Jumping
		gravity_and_jumping();
	}
	
	//collision + movement
	move_with_collisions();
}