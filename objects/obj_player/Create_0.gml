spd = 4;
hspd = 0; //h velocity
vspd = 0; //v velocity
grav = 0.4; //gravity
jump_force = -7; //jump force
grounded = false;

enum PS //player state
{
	ACTIVE,
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
	}
}

function move_with_collisions()
{
	//horizontal
	if(place_meeting(x+hspd, y, obj_wall))
	{
		while(!place_meeting(x+sign(hspd),y,obj_wall))
			x += sign(hspd);
		hspd = 0;
	}
	x += hspd;
	
	//vertical
	if(place_meeting(x,y+vspd,obj_wall))
	{
		while(!place_meeting(x,y+sign(vspd),obj_wall))
			y += sign(vspd);
		vspd = 0;
	}
	y += vspd;
}

// ---- states ----//
function active()
{
	//inputs
	var h_axis = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	
	var i_jump_pressed = keyboard_check_pressed(vk_space);
	
	//walking
	hspd = h_axis * spd;
	
	//Update grounded.
	grounded = place_meeting(x,y+1,obj_wall);

	//Gravity + Jumping
	if(!grounded)
	{	
		vspd += grav;
	}
	else if(i_jump_pressed)
	{
		vspd = jump_force;
	}
	
	//collision + movement
	move_with_collisions();
}