if ((iindex + image_speed) < sprite_get_number(sprite_index))
{
    animate_actor()
    if instance_exists(obj_player)
    {
        if (x < obj_player.x)
            hspd += acc
        else if (x > obj_player.x)
            hspd += (-acc)
    }
    else
        return;
    hspd = clamp(hspd, ((-max_hspd) / 2), (max_hspd / 2))
    if place_meeting((x + hspd + sign(hspd) * 16), y, obj_wall)
    {
        while (!(place_meeting((x + sign(hspd) + sign(hspd) * 16), y, obj_wall)))
            x += sign(hspd)
        if (abs(hspd) > 3)
        {
            alarm[0] = stuntimer
            var ss = audio_play_sound(hitsound, 100, false)
            audio_sound_pitch(ss, (random(0.2) + 0.6))
            previous_state = state
            state = stun_state
        }
        repeat abs(hspd)
            instance_create((x + sign(hspd) * 24), (y - 4 + irandom(24)), obj_dust_cloud_land)
        hspd = (-hspd) * 0.5
        return;
    }
    x += hspd
}
else if (timer > 0)
    timer--
else
{
    timer = 10
    bulletcount = bulletamount
    state = 463
    sprite_index = spr_guardian_firing_machine_gun
    iindex = 8
    image_speed = 0.8
}
