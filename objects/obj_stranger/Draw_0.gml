draw_self();

if (distance_to_object(obj_player) < 40) {
	draw_sprite(spr_text_box, 0, x + 40, y - 100);
	draw_set_color(col_neon_blue);
	draw_set_font(font_spaceloot);
	draw_text(x + 50, y - 90, message);
}