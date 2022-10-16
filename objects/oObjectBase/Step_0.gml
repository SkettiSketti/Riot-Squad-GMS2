var onTheGround = place_meeting(x,y + 1, oWall);

processGroundCollision(onTheGround);
applyVelocity();
limitSpeed();
applyFriction(onTheGround);
applyThreshold();
preventLeavingTheScreen()