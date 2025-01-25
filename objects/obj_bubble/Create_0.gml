hspd = 0;
vspd = 0;

min_speed = 10;
initial_speed = 50;

bounce_buffer = 64;

dir = 1;

collision_tile_layer = layer_tilemap_get_id("Tiles_1");

function launch(_hdir)
{
	dir = _hdir;
	hspd = _hdir * initial_speed;
}

function bounce_bubble(_other_inst)
{
	var _dir = sign(x - _other_inst.x);
	launch(_dir);
	x += dir * bounce_buffer;
	
	var _other_dir = sign(_other_inst.x - x);
	_other_inst.launch(_other_dir);
	
}