//draw_text(xPos,yPos, num);

if (isHealth)
{
	draw_text_colour(xPos,yPos, num,c_green,c_green,c_green,c_green,1/*alpha*/)
	return
}

if (crit) //critical hit!
{
	draw_text_colour(xPos,yPos, num,c_red,c_red,c_red,c_red,1/*alpha*/)
}
else if (num < 1)
{
	draw_text_colour(xPos,yPos, "Resisted!",c_blue,c_blue,c_blue,c_red,1/*alpha*/)
}
else 
{
	draw_text_colour(xPos,yPos, num,c_red,c_red,c_red,c_red,1/*alpha*/)
}