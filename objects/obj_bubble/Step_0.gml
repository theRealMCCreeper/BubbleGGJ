//Get horizontal and vertical dir
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

//water
if(element == ET.WATER)
{
	vspd = lerp(vspd, water_fall_speed, 0.1);
}

//gas
if(element == ET.GAS)
{
	vspd = lerp(vspd, gas_rise_speed, 0.1);
}


//vspd = lerp(vspd, 0, 0.1);

//Collisions
wall_bubble_collisions();

//Oil supply
var _oil_source_inst = instance_place(x,y,obj_oil)
if(_oil_source_inst != noone)
{
	collect_oil(_oil_source_inst);	
}

//Touch source
//water
if(place_meeting(x,y,obj_water_source))
	touch_source(ET.WATER);
else if(place_meeting(x,y,obj_fire_source))
	touch_source(ET.FIRE);
else if(place_meeting(x,y,obj_gas_source))
	touch_source(ET.GAS);
else
	is_touching_source = false;
	
	

invince_tick -= 1;

//Animation
image_xscale = hdir;