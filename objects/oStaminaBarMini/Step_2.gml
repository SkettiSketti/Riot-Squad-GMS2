var staminaPercent = ( (owner.dashCooldown - owner.alarm[2]) / owner.dashCooldown) * 32


image_xscale = staminaPercent
image_yscale = 3
x = oCamera.xPos + 25
y = oCamera.yPos + 225
if (owner.dead) instance_destroy();


if (owner.alarm[2])
{
	image_blend = make_color_rgb(255,0,0)
}
else
{
	image_blend = make_color_rgb(0,0,200)
	
}