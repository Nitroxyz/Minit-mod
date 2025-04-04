if (!has_set_motion)
{
    hspd = lengthdir_x(4, dir)
    vspd = (lengthdir_y(4, dir)) - 2
    has_set_motion = 1
}
if (spin_timer > 0)
    spin_timer--
else
{
    spin_timer = 15
    image_angle += 90
}
if (!(place_meeting(x, (y + 1), obj_wall)))
{
    vspd += grav
    grounded = 0
}
else
    grounded = 1
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = (-hspd)
    bounces--
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = (-vspd) * 0.5
    bounces--
}
y += vspd
if (bounces <= 0 && grounded)
{
    instance_destroy()
    var ztz = instance_create(x, (y + 16), obj_grenade_explosion)
    ztz.y -= 6
    var tsound = audio_play_sound(snd_rocket_explosion, 100, false)
    audio_sound_pitch(tsound, 0.6)
    audio_sound_gain(tsound, 0.8, 70)
    shake_screen(15)
    var _obj = instance_create(x, y, obj_bombflame)
    _obj.hspd = -1
    _obj = instance_create(x, y, obj_bombflame)
    _obj.hspd = 1
}
