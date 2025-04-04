if ((iindex + image_speed) < sprite_get_number(sprite_index))
    animate_actor()
else if (timer > 0)
{
    timer--
    if (timer == 24 || timer == 5 || timer == 60)
        instance_create((x - 4 + irandom(8)), (y + 12), obj_drip)
}
else
{
    timer = 180
    state = 457
    stun_sprite = 298
    sprite_index = spr_guardian_firing_rocket
    iindex = 4
    music_duck(1, 0)
    music_xfade(mu_guardian, 0)
    player_auto_end()
}
