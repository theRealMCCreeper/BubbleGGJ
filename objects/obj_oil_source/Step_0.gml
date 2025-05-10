if(sprite_index == spr_oil_source_empty)
{
	var _bubble_inst = instance_place(x, y, obj_bubble);
	if(_bubble_inst != noone)
	{
		if(_bubble_inst.oil_inst != noone)
		{
			_bubble_inst.pop_with_oil();
			sprite_index = spr_oil_source_full;
			
			//open oil door
			obj_oil_door.open();
		}
	}
}