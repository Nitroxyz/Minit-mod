if ((iindex + image_speed) < sprite_get_number(sprite_index))
    animate_actor()
else if (timer > 0)
    timer--
else
{
    if (hp < 40)
    {
        timer = 70
        bulletcount = 5
        hspd_tar = 2.3
    }
    else
    {
        timer = 100
        bulletcount = 4
        hspd_tar = 2
    }
    stun_state = 312
    state = 464
    sprite_index = spr_guardian_firing_rocket
    stun_sprite = 298
    iindex = 4
    image_speed = 0.4
}
