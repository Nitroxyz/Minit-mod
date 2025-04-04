if stopped
{
    if (shoottimer > 0)
    {
        shoottimer--
        image_speed = min(spinspeed, (spinspeed * (shoottimer / 90)))
        animate_actor()
    }
    else if (place_meeting(x, y, obj_bullet_sm) || place_meeting(x, y, obj_rocketboom))
        shoottimer = shoottimermax - irandom(10)
}
else
    animate_actor()
