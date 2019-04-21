if (entering) {
	draw_set_alpha(fadeOutFrame / fadeOutFrames);
	draw_set_color(c_black);
	draw_rectangle(0, 0, 512, 288, false);
	draw_set_alpha(1);
}