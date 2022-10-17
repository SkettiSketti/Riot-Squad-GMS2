event_inherited()
//Add health to player
var bonusHp = 10
if(other.hp + bonusHp <= other.maxHp) 
	other.hp += bonusHp
else 
	other.hp = other.maxHp

hurtNumber = instance_create_layer(x,y,"HurtNumber",oHurtNumber);
hurtNumber.xPos = x - 16
hurtNumber.yPos = y 
hurtNumber.num = bonusHp;
hurtNumber.isHealth = true
		