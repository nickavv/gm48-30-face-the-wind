if (credits >= 0) {
	draw_sprite(spr_hud_credits, 0, 0, 0);
	draw_set_color(col_neon_blue);
	draw_set_font(font_vector);

	var creditsCount = string_replace_all(string_format(credits, 3, 0), " ", "0");
	draw_text(10, 5, creditsCount);
} else {
	draw_sprite(spr_hud_debt, 0, 0, 0);
	draw_set_color(col_orange);
	draw_set_font(font_vector);

	var creditsCount = string_replace_all(string_format(abs(credits), 3, 0), " ", "0");
	draw_text(10, 5, creditsCount);
}

if (ownRespawnBracelet && obj_player.state == playerState.dead) {
	draw_sprite(spr_hud_respawn, 0, 0, 23);
}

if (fadingIn) {
	draw_set_alpha(1 - (fadeInFrame / fadeInFrames));
	draw_set_color(c_black);
	draw_rectangle(0, 0, 512, 288, false);
	draw_set_alpha(1);
}