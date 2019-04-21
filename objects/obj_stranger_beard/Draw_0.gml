draw_self();

if (distance_to_object(obj_player) < 40) {
	draw_sprite(spr_text_box, 0, x + 30, y - 90);
	if (text == noone) {
		text = instance_create_depth(x + 40, y - 82, obj_player.depth - 1, obj_text_draw);
		if (obj_gamemgr.ownRespawnBracelet) {
			text.message = "There's rogue bots past here. Be careful, don't wanna end up in debt";
		} else {
			text.message = "I can't let you past here in good conscience without a respawn bracelet!";
		}
	}
} else if (distance_to_object(obj_cyberghost) < 40) {
	draw_sprite(spr_text_box, 0, x + 30, y - 90);
	if (text == noone) {
		text = instance_create_depth(x + 40, y - 82, obj_player.depth - 1, obj_text_draw);
		text.message = "What did I say?!";
	}
} else {
	if (text != noone) {
		instance_destroy(text);
		text = noone;
	}
}