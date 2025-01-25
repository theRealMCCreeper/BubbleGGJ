if(follow_inst != noone)
{
	x = follow_inst.x;
	y = follow_inst.y;
}else
{
	y = start_y + sin(tick * 0.1) * 50;
}

tick += 1;