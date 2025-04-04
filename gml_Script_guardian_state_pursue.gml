if instance_exists(obj_player)
{
    if (x < obj_player.x)
        hspd += acc
    else if (x > obj_player.x)
        hspd += (-acc)
}
else
    return;
hspd = clamp(hspd, (-max_hspd), max_hspd)
if place_meeting((x + hspd + sign(hspd) * 2), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd) + sign(hspd) * 2), y, obj_wall)))
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
}
x += hspd
if (hp_lost_since_last_rocket >= 20)
{
    if (sprite_index != spr_guardian_firing_rocket)
    {
        audio_play_sound(snd_guardian_transform_rocket, 5, false)
        stun_state = 317
        state = 461
        sprite_index = spr_guardian_transform_rocket
        iindex = 0
        timer = 10
        image_speed = 0.2
    }
    else
    {
        timer = 10
        bulletcount = 5
        state = 464
        sprite_index = spr_guardian_firing_rocket
        iindex = 4
        image_speed = 0.4
    }
    return;
}
if (abs(obj_player.x - x) < 24)
{
    if (timer == -1)
    {
        if (sprite_index != spr_guardian_firing_machine_gun)
        {
            audio_play_sound(snd_guardian_transform_machinegun, 5, false)
            stun_state = 317
            state = 459
            sprite_index = spr_guardian_transform_machine
            image_speed = (1/3)
            iindex = 0
        }
        else
        {
            timer = 10
            bulletcount = bulletamount
            reloadcount = reloadamount
            state = 463
            sprite_index = spr_guardian_firing_machine_gun
            iindex = 8
            image_speed = 0.8
        }
        return;
    }
}
if (timer > 0)
    timer--
else
    timer = -1
