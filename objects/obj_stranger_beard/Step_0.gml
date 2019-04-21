event_inherited();

if (!obj_gamemgr.ownRespawnBracelet) {
	obj_player.x = clamp(obj_player.x, 0, x - 5);
	if (distance_to_object(obj_player) < 5) {
		sprite_index = spr_stranger_beard_stop;
	} else {
		sprite_index = spr_stranger_beard;
	}
}