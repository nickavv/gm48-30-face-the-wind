draw_self();

if (distance_to_object(obj_player) < 40) {
	draw_sprite(spr_text_box, 0, x - 150, y - 90);
	if (text == noone) {
		text = instance_create_depth(x - 140, y - 82, obj_player.depth - 1, obj_text_draw);
		text.message = "Be more careful next time, I won't help you again. Visit that store";
	}
} else if (distance_to_object(obj_cyberghost) < 40) {
	draw_sprite(spr_text_box, 0, x - 150, y - 90);
	if (obj_gamemgr.firstRespawn = false) {
		if (text == noone) {
			text = instance_create_depth(x - 140, y - 82, obj_player.depth - 1, obj_text_draw);
			text.message = "Had an accident hm? I can help, for a price. 12 credits seems fair";
		}
		if (obj_gamemgr.credits >= 12) {
			draw_sprite(spr_credit_requirement, 0, x - 140, y - 50);
			draw_set_color(col_neon_blue);
			if (keyboard_check_pressed(ord("Q"))) {
				obj_gamemgr.firstRespawn = true;
				obj_gamemgr.credits -= 12;
				obj_player.x = x - 16;
				obj_player.y = y;
				obj_player.state = playerState.idle;
				instance_destroy(obj_text_draw);
				text = noone;
			}
		} else {
			draw_sprite(spr_credit_requirement_insuff, 0, x - 140, y - 50);
			draw_set_color(col_orange);
		}
		draw_set_font(font_vector);
		draw_text(x - 135, y - 46, "12");
	}
} else {
	if (text != noone) {
		instance_destroy(text);
		text = noone;
	}
}