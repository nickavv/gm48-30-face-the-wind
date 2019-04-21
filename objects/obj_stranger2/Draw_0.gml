draw_self();

if (distance_to_object(obj_player) < 40) {
	draw_sprite(spr_text_box, 0, x + 30, y - 90);
	if (text == noone) {
		text = instance_create_depth(x + 40, y - 82, obj_player.depth - 1, obj_text_draw);
		text.message = "This shop can get you on your feet... or sink you. Careful what you wish for.";
	}
} else if (distance_to_object(obj_cyberghost) < 40) {
	draw_sprite(spr_text_box, 0, x + 30, y - 90);
	if (text == noone) {
		text = instance_create_depth(x + 40, y - 82, obj_player.depth - 1, obj_text_draw);
		text.message = "Sorry pal, maybe they've got jobs for you inside.";
	}
} else {
	if (text != noone) {
		instance_destroy(text);
		text = noone;
	}
}