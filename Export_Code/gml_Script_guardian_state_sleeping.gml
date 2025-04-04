if instance_exists(obj_door_auto_U)
{
    if (timer > 30)
        timer--
    else
    {
        timer = 45
        if (irandom(2) == 1)
            instance_create((x - 4 + irandom(8)), (y + 12), obj_drip)
    }
}
else if (timer > 0)
{
    if instance_exists(obj_player)
    {
        if (obj_player.control_state == 87)
            player_auto()
    }
    if ((timer % 15) == 0 && irandom(4) == 1)
        instance_create((x - 4 + irandom(8)), (y + 12), obj_drip)
    timer--
}
else
{
    state = 458
    sprite_index = spr_guardian_turning_on
    stun_sprite = 298
    audio_play_sound(snd_guardian_power_on, 5, false)
    iindex = 0
    image_speed = 0.16666666666666666
}
