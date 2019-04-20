x += (targetX - x + xBaseOffset + xOffset)/xDamping;
y += (targetY - y + yBaseOffset + yOffset)/yDamping;

x = clamp(x, 0+(width/2), room_width-(width/2));
y = round(clamp(y, 0+(height/2), room_height-(height/2)));

if (followTarget != noone) {
	targetX = followTarget.x;
	targetY = followTarget.y;
}

var viewMatrix = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera, viewMatrix);