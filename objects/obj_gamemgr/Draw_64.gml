draw_sprite(spr_hud_credits, 0, 0, 0);
draw_set_color(col_neon_blue);
draw_set_font(font_vector);

var creditsCount = string_replace_all(string_format(credits, 3, 0), " ", "0");
draw_text(10, 5, creditsCount);