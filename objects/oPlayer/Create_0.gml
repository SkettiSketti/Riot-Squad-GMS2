event_inherited();
hp = 200 //override
maxHp = 200

dashBar = instance_create_layer(x,y-16,"HealthBar",oStaminaBarMini)
dashBar.owner = id;

instance_create_layer(x,y-16,"HealthBar",oPlayerPortrait)

window_set_cursor(cr_none);