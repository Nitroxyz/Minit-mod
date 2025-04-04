hspd = lengthdir_x(spd, image_angle)
vspd = lengthdir_y(spd, image_angle)
spd = approach(spd, target_spd, 2)
y += vspd
x += hspd
if (init == 1)
    init = 0
else
{
    var temp = instance_create(x, y, trail_particle)
    if instance_exists(temp)
    {
        temp.image_angle = image_angle
        temp.depth = depth + 1
    }
}
var enemy = collision_circle(x, y, 7, obj_enemy, 0, 0)
if enemy
{
    instance_create(x, y, obj_bulimp)
    var isfx = audio_play_sound(snd_bulimp_large, 5, false)
    audio_sound_pitch(isfx, random_range(0.9, 1.1))
    flag = 1
    with (enemy)
    {
        hurt_hspd = other.hspd
        hurt_vspd = other.vspd
        hurt = other.atk
        enemy_take_damage(other.atk, sign(other.hspd), sign(other.vspd))
    }
    instance_destroy()
}
var wall = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_wall, 0, 0)
if wall
{
    var c_flag = 1
    with (wall)
    {
        if place_meeting(x, y, obj_bridgenode)
            c_flag = 0
    }
    if c_flag
    {
        if (wall.open_hp != -1)
            wall.open_hp -= 1
        audio_play_sound(wall.hitsound, 1, false)
        audio_sound_pitch(wall.hitsound, random_range(0.9, 1.3))
        if (wall.object_index == obj_crate || wall.object_index == obj_lab_egg)
        {
            with (wall)
                instance_destroy()
        }
        instance_create(x, y, obj_bulimp)
        isfx = audio_play_sound(snd_bulimp_large, 5, false)
        audio_sound_pitch(isfx, random_range(0.9, 1.1))
        instance_destroy()
        return;
    }
}
if place_meeting(x, y, obj_lavatop)
{
    instance_destroy()
    instance_create(x, y, obj_bulimp)
}
if (timer > 0)
    timer--
else
{
    temp = instance_create(x, y, obj_bulimp)
    temp.image_angle = image_angle
    instance_destroy()
    return;
}
