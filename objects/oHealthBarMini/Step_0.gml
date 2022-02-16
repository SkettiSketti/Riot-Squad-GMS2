image_xscale = (owner.hp / owner.maxHp) * 16
image_yscale = 2
x = owner.x - 8
y = owner.y - 12
if (owner.dead) instance_destroy();

var healthPercent = (owner.hp / owner.maxHp) * 100

if (healthPercent < 30 )
{
	image_blend = make_color_rgb(255,0,0)
}
else if (healthPercent < 60)
{
	image_blend = make_color_rgb(255,255,0)
	
}
else
{
	image_blend = make_color_rgb(0,255,0)
	
}