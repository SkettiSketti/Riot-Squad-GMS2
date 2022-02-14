//draw_text(xPos,yPos, num);
if (crit) //critical hit!
{
	draw_text_colour(xPos,yPos, num,c_red,c_red,c_red,c_white,alpha)
}
else if (num < 1)
{
	draw_text_colour(xPos,yPos, "Resisted!",c_blue,c_blue,c_blue,c_white,alpha)
}
else 
{
	draw_text_colour(xPos,yPos, num,c_red,c_orange,c_white,c_white,alpha)
}