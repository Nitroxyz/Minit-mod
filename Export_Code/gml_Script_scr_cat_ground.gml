if (air == 1)
{
    air = 0
    if (!audio_is_playing(CatLand))
    {
        var t = audio_play_sound(CatLand, 1, false)
        audio_sound_pitch(t, random_range(0.9, 1.1))
    }
    create_particles(x, bbox_bottom, particle_dust_land, random_range(2, 4))
}
if key_jump
{
    grounded = 0
    move_state = 70
    sprite_index = spr_cat_walk
    audio_play_sound(CatJump, 1, false)
    audio_sound_pitch(CatJump, random_range(0.7, 0.99))
    vspd = (-jumpspeed)
    plat_id = -1
    p_type = -1
    p_x = -1
}
if key_shoot_pressed
{
    var seffect = choose(97)
    var s = audio_play_sound(seffect, 5, false)
    audio_sound_pitch(s, random_range(0.9, 1.2))
}
if (vspd < 0 && (!key_jump_held))
    vspd = max(vspd, ((-jumpspeed) / 4))
if (!dashing)
{
    vspd += grav
    vspd = median(-4, vspd, 30)
}
else
    vspd = 0
xaxis = key_right - key_left
if (xaxis != 0)
{
    facing = xaxis
    image_xscale = xaxis
    hspd = approach(hspd, (cat_movespd * xaxis), cat_accel)
    if place_meeting(x, (y + 1), obj_treadmill_locker)
    {
        var treadmill = instance_place(x, (y + 1), obj_treadmill_locker)
        if (treadmill.locked == 0)
        {
            hspd = 0
            image_speed = 0.25
            sprite_index = spr_cat_walk
            x = approach(x, treadmill.x, 1)
            treadmill.energy_previous = treadmill.energy
            treadmill.energy += image_xscale
            on_treadmill = 1
        }
        else
            on_treadmill = 0
    }
    else
        on_treadmill = 0
}
else if grounded
    hspd = lerp(hspd, 0, 0.4)
else
    hspd = lerp(hspd, 0, 0.2)
if (abs(hspd) > 0.1)
{
    sprite_index = spr_cat_walk
    image_speed = max(0.1, (abs(hspd) * 0.12))
    if (floor(image_index) == 0)
        step = 1
    else if (floor(image_index) == 1)
    {
        if step
        {
            if (abs(hspd) > 1)
                create_particles(x, bbox_bottom, particle_dust_walk, random_range(1, 2))
            var tits = audio_play_sound(choose(84, 85, 86, 87, 88), 1, false)
            audio_sound_pitch(tits, random_range(0.9, 1.2))
            step = 0
        }
    }
}
else if (!on_treadmill)
{
    if (key_right || key_left)
        image_index = 3
    else
    {
        hspd = 0
        sprite_index = spr_cat_idle
        image_speed = 0.1
    }
}
else if (key_right || key_left)
{
    sprite_index = spr_cat_walk
    image_speed = 0.25
}
else
{
    sprite_index = spr_cat_idle
    image_speed = 0.1
}
if (!(place_meeting(x, (y + 1), obj_wall)))
{
    grounded = 0
    move_state = 70
    sprite_index = spr_cat_walk
}
