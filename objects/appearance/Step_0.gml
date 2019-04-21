var _cam_x = obj_camera.x - obj_camera.width/2;
var _cam_y = obj_camera.y - obj_camera.height/2;

layer_x("BG_Sky", (_cam_x));
layer_y("BG_Sky", (_cam_y));

layer_x("BG_Buildings", (_cam_x * 0.9));
layer_y("BG_Buildings", (_cam_y * 0.9) - 100);

layer_x("BG_Buildings2", (_cam_x * 0.7) + 150);
layer_y("BG_Buildings2", (_cam_y * 0.7) - 50);