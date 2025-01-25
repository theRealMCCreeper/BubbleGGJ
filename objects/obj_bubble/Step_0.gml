hspd = lerp(hspd, (min_speed / 2) * dir, 0.05);
if(hspd <= min_speed * dir)
{
	hspd = min_speed * dir;
}

//Collisions
if(place_meeting(x+hspd,y,collision_tile_layer))
{
	instance_destroy();
}
x += hspd;

if(place_meeting(x,y+vspd,collision_tile_layer))
{
	instance_destroy();
}
y += vspd;