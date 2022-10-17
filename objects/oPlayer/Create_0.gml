event_inherited();

//New

magnetRange = 25
magnetStrength = 0.25

//Overides

hp = 200
maxHp = 200 
dashBar = instance_create_layer(x,y-16,"HealthBar",oStaminaBarMini)
dashBar.owner = id;

instance_create_layer(x,y-16,"HealthBar",oPlayerPortrait)

window_set_cursor(cr_none);