var hdir = 1
if(hspd != 0)
	hdir = sign(hspd);
	
var vdir = 1
if(vspd != 0)
	vdir = sign(vspd);

//Drag
hspd = lerp(hspd, (min_speed / 2) * hdir, 0.05);
if(abs(hspd) <= abs(min_speed))
{
	hspd = min_speed * hdir;
}
//vspd = lerp(vspd, 0, 0.1);

//Collisions
//wall
if(place_meeting(x+hspd,y,collision_tile_layer))
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

if(place_meeting(x,y+vspd,collision_tile_layer))
{
	pop();
}
//bubble
var _bubble_inst = instance_place(x,y+vspd,obj_bubble);
if(_bubble_inst != noone)
{
	bounce_bubble(_bubble_inst);
}
y += vspd;