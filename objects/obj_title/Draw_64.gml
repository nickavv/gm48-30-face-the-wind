var fadeInFrame = clamp((frames - 20)/120, 0, 1);
draw_set_alpha(fadeInFrame);
draw_set_font(font_classified);
draw_set_color(c_black);
draw_text(324, 36, "FACE\n  THE\n     WIND");
draw_set_color(c_white);
draw_text(322, 34, "FACE\n  THE\n     WIND");

var fadeSubHead = clamp((frames - 100)/160, 0, 1);
draw_set_alpha(fadeSubHead);
draw_set_font(font_skullboy);
draw_set_color(c_black);
draw_text(324, 142, "created by Nick Ver Voort\ngm48 game jam entry");
draw_set_color(c_white);
draw_text(322, 140, "created by Nick Ver Voort\ngm48 game jam entry");

draw_set_color(c_black);
draw_text(354, 180, "PRESS SPACE");
draw_set_color(c_white);
draw_text(352, 178, "PRESS SPACE");

draw_set_alpha(1);

if (fadingOut) {
	draw_set_alpha(fadeOutFrame / fadeOutFrames);
	draw_set_color(c_black);
	draw_rectangle(0, 0, 512, 288, false);
	draw_set_alpha(1);
}