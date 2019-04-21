var i = 1;
var line = 0;
var lineCharCount = 0;

while(i <= maxCharsToDraw) {
	if(string_char_at(message, i) == " ") {
		for(var j = 1; j < string_length(message); j++) {
			if(string_char_at(message, i + j) == " " || i + j >= string_length(message)) {
				// Wrap if the next word is greater than the amount of space left on the line
				if((lineCharCount + j) * charWidth > lineLength) {
					// line break
					i++ // skip the space we're on so it doesn't draw at the start of the new line
					lineCharCount = 0;
					line++;
				}
				break;
			}
		}
	}
	// Draw the text up to the current point
	var currentLetter = string_char_at(message, i++);
	draw_set_color(col_neon_blue);
	draw_set_font(font_skullboy);
	draw_text(x + lineCharCount*charWidth, y + line * lineHeight, currentLetter);

	lineCharCount++;	
}

if (maxCharsToDraw <= string_length(message)) {
	maxCharsToDraw += 1;
}