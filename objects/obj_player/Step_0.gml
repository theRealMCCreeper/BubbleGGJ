switch(state)
{
	case PS.ACTIVE:
		active();
		
		//Animation
		image_xscale = dir;
		
		if(!grounded)
		{
			if(vspd > 0)
				sprite_index = spr_player_fall_test;
			else
				sprite_index = spr_player_jumping_test;
		}else if(hspd != 0)
		{
			sprite_index = spr_player_walking;
		}else
		{
			sprite_index = spr_player_idle;
		}
		
		break;
}