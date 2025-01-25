hspd = lerp(hspd, (min_speed / 2) * dir, 0.05);
if(abs(hspd) <= abs(min_speed))
{
	hspd = min_speed * dir;
}

//Collisions
//wall
if(place_meeting(x+hspd,y,collision_tile_layer))
{
	instance_destroy();
}
//bubble
var _bubble_inst = instance_place(x+hspd,y,obj_bubble);
if(_bubble_inst != noone)
{
	bounce_bubble(_bubble_inst);
}

x += hspd;

if(place_meeting(x,y+vspd,collision_tile_layer))
{
	instance_destroy();
}
y += vspd;