//draw_text(xPos,yPos, num);
if (crit) //critical hit!
{
	draw_text_colour(xPos,yPos, num,c_red,c_red,c_red,c_red,alpha)
}
else if (num < 1)
{
	draw_text_colour(xPos,yPos, "Resisted!",c_blue,c_blue,c_blue,c_red,alpha)
}
else 
{
	draw_text_colour(xPos,yPos, num,c_red,c_red,c_red,c_red,alpha)
}