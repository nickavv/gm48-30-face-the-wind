draw_self();

if (distance_to_object(obj_player) < 40) {
	//draw_sprite(spr_text_box, 0, x + 30, y - 90);
	
} else if (distance_to_object(obj_cyberghost) < 40) {
	draw_sprite(spr_text_box, 0, x + 30, y - 90);
	if (text == noone) {
		text = instance_create_depth(x + 40, y - 82, obj_player.depth - 1, obj_text_draw);
		text.message = "Had an accident hm? I can help, for a price. 12 credits seems fair";
	}
	draw_sprite(spr_credit_requirement, 0, x + 50, y - 50);
	draw_set_color(col_neon_blue);
	draw_set_font(font_vector);
	draw_text(x + 55, y - 46, "12");
} else {
	if (text != noone) {
		instance_destroy(text);
		text = noone;
	}
}