for (var i = 6; i > 1; i--) {
	var size = 64/i;
	var offset = 18 - (size/2);
	draw_sprite_ext(spr_cyberghost, 0, x - (i * xspeed * 1.3) + offset,
					y - (i * yspeed * 1.3) + offset,
					size/36,
					size/36,
					0, c_white,
					(i + 2) / 10);
	//draw_sprite_stretched(spr_cyberghost, 0, x - i * (xspeed * 1.2) + offset, y - i * (yspeed * 1.2) + offset, size, size);
}
draw_self();