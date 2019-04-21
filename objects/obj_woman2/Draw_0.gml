draw_self();

if (distance_to_object(obj_player) < 40) {
	draw_sprite(spr_text_box, 0, x - 150, y - 90);
	if (text == noone) {
		text = instance_create_depth(x - 140, y - 82, obj_player.depth - 1, obj_text_draw);
		text.message = "We have to ghost just to get into our home. How can we ever get out of debt?";
	}
} else if (distance_to_object(obj_cyberghost) < 40) {
	draw_sprite(spr_text_box, 0, x - 150, y - 90);
	if (text == noone) {
		text = instance_create_depth(x - 140, y - 82, obj_player.depth - 1, obj_text_draw);
		text.message = "We have to ghost just to get into our home. How can we ever get out of debt?";
	}
} else {
	if (text != noone) {
		instance_destroy(text);
		text = noone;
	}
}