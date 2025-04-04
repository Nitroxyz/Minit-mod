if ((iindex + image_speed) < sprite_get_number(sprite_index))
    animate_actor()
else if (timer > 0)
    timer--
else
{
    timer = 10
    bulletcount = bulletamount
    reloadcount = reloadamount
    stun_state = 312
    state = 463
    sprite_index = spr_guardian_firing_machine_gun
    stun_sprite = 299
    iindex = 8
    if (hp < 40)
    {
        image_speed = 0.6
        hspd_tar = 2.3
    }
    else
    {
        image_speed = 0.8
        hspd_tar = 2
    }
}
