var xCam = clamp(oPlayer.x - wCam / 2,0,room_width - wCam);
var yCam = clamp(oPlayer.y - (hCam / 2)  + yOffset,0,room_height - hCam);

var curX = camera_get_view_x(view_camera[0]);
var curY = camera_get_view_y(view_camera[0]);

var newX = lerp(curX, xCam, lerpIntensity);
var newY = lerp(curY, yCam, lerpIntensity);

//var newX = xCam;
//var newY = yCam;

camera_set_view_pos(view_camera[0],newX,newY)

//layer_x(layer_get_id("Background"), newX * backgroundLerp);
//layer_y(layer_get_id("Background"), newY * backgroundLerp);