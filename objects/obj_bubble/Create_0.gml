hspd = 0;
vspd = 0;

min_speed = 10;
initial_speed = 50;

dir = 1;

collision_tile_layer = layer_tilemap_get_id("Tiles_1");

function launch(hdir)
{
	dir = hdir;
	hspd = hdir * initial_speed;
}