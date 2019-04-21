draw_self();
if (distance_to_object(obj_player) < 30) {
	draw_sprite(spr_text_box, 0, x - 100, y - 50);
	if (obj_gamemgr.ownRespawnBracelet == false) {
		if (text == noone) {
			text = instance_create_depth(x - 90, y - 42, obj_player.depth - 1, obj_text_draw);
			text.message = "Oh my! No respawn bracelet? Take it please, you never know when you'll need it";
		}
		draw_sprite(spr_take_it, 0, x - 90, y - 10);
		if (keyboard_check_pressed(ord("Q"))) {
			obj_gamemgr.ownRespawnBracelet = true;
			instance_destroy(obj_text_draw);
			text = noone;
		}
	} else {
		if (text == noone) {
			text = instance_create_depth(x - 90, y - 42, obj_player.depth - 1, obj_text_draw);
			text.message = "Now if you die press T to respawn. It costs credits, try to stay out of debt";
		}
	}
} else {
	if (text != noone) {
		instance_destroy(text);
		text = noone;
	}
}