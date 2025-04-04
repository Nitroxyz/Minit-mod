animate_actor()
if place_meeting(x, y, WATER)
{
    hspd = lengthdir_x(spd, image_angle)
    vspd += (((lengthdir_y(spd, image_angle)) - vspd) * 0.1)
    spd = approach(spd, target_spd, 1)
    if (timer > 0)
        timer--
    else
    {
        var temp = instance_create(x, y, obj_bulimp_sm)
        temp.image_angle = image_angle
        instance_destroy()
        return;
    }
}
else
{
    hspd = lengthdir_x(spd, image_angle)
    vspd += 0.2
    spd = approach(spd, 2, 0.5)
}
y += vspd
x += hspd
if (init == 1)
    init = 0
else if ((timer % 3) == 0)
    temp = instance_create(x, y, trail_particle)
var wall = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_wall, 0, 0)
if wall
{
    if (wall.open_hp != -1)
        wall.open_hp -= 1
    audio_play_sound(wall.hitsound, 1, false)
    audio_sound_pitch(wall.hitsound, random_range(0.9, 1.3))
    instance_create((x + hspd), (y + vspd), obj_bulimp_sm)
    instance_destroy()
    var s = audio_play_sound(snd_torpedo_explode, 5, false)
    audio_sound_pitch(s, random_range(0.9, 1))
    audio_stop_sound(sfx)
    return;
}
var enemy = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_enemy, 0, 0)
if enemy
{
    instance_create((x + hspd), (y + vspd), obj_bulimp_sm)
    flag = 1
    with (enemy)
    {
        hurt_hspd = other.hspd
        hurt_vspd = other.vspd
        hurt = other.atk
        enemy_take_damage(other.atk, sign(other.hspd), sign(other.vspd))
    }
    instance_destroy()
    s = audio_play_sound(snd_torpedo_explode, 5, false)
    audio_sound_pitch(s, random_range(0.9, 1))
    audio_stop_sound(sfx)
}
