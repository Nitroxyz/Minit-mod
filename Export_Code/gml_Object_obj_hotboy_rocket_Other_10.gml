animate_actor()
if instance_exists(obj_player)
{
    var t_targetdir = point_direction(x, y, obj_player.x, obj_player.y)
    if (abs(t_targetdir - image_angle) > 180)
    {
        if (t_targetdir < 180)
            t_targetdir += 360
        else
            t_targetdir -= 360
    }
    targetdir = approach(targetdir, t_targetdir, 2)
    targetdir %= 360
}
actualdir = mround(targetdir, 45)
image_angle = actualdir
hspd = approach(hspd, lengthdir_x(1.2, targetdir), 0.05)
vspd = approach(vspd, lengthdir_y(1.2, targetdir), 0.05)
if (place_meeting(x, y, obj_wall) || place_meeting(x, y, obj_bullet_sm))
{
    if (!(place_meeting(x, y, obj_hotboy1.bottom)))
    {
        instance_destroy()
        instance_create(x, y, obj_rocketboom)
    }
}
x += hspd
y += vspd
if (cloud_timer > 0)
    cloud_timer--
else
{
    cloud_timer = 10
    var t = instance_create((x - 8 * cos(degtorad(image_angle))), (y - 8 * sin(degtorad(image_angle))), obj_dust_cloud_jump)
    t.depth = depth + 1
}
if (alarm[0] >= 0)
{
    alarm[0]--
    if (alarm[0] == -1)
    {
        instance_create(x, y, obj_splosion)
        instance_create(x, y, obj_bubble)
        instance_create(x, y, obj_shakesmall2)
        instance_destroy()
        var t0 = audio_play_sound(GrenadeExplode, 100, false)
        var t1 = audio_play_sound(GrenadeBlowup_Layer2, 100, false)
        audio_sound_pitch(t0, random_range(0.5, 0.6))
        audio_sound_pitch(t1, random_range(0.4, 0.6))
        audio_sound_gain(t1, random_range(0.5, 0.6), 3)
    }
}
if (flametimer > 0)
    flametimer--
else
{
    var flamm = instance_create((x + (lengthdir_x(8, degtorad(image_angle + 180)))), (y + (lengthdir_y(8, degtorad(image_angle + 180)))), obj_flamebot_flame)
    flamm.movedir = image_angle + 180
    flametimer = flametimer_max
}
