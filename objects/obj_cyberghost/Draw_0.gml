for (var i = 6; i > 1; i--) {
	var size = 50/(i + 1) + 12;
	var offset = 18 - (size/2);
	draw_sprite_ext(spr_cyberghost, 0, x - (i * xspeed * 2) + offset,
					y - (i * yspeed * 2) + offset,
					size/36,
					size/36,
					0, c_white,
					8 / (i + 4) / 10);
	}
draw_self();