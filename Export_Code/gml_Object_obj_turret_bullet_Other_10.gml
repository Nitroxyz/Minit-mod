hspd = lengthdir_x(spd, image_angle)
vspd = lengthdir_y(spd, image_angle)
spd = approach(spd, target_spd, 1.5)
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
var wall = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_wall, 0, 0)
if wall
{
    var c_flag = 1
    with (wall)
    {
        if (place_meeting(x, y, obj_bridgenode) && place_meeting(other.xstart, other.ystart, other.id))
            c_flag = 0
    }
    if c_flag
    {
        if (wall.open_hp != -1)
            wall.open_hp -= 1
        audio_play_sound(wall.hitsound, 1, false)
        audio_sound_pitch(wall.hitsound, random_range(0.9, 1.3))
        instance_create(x, y, obj_bulimp_sm)
        var t = instance_create(x, y, obj_rocketboom)
        t.pushplayer = 1
        instance_destroy()
        return;
    }
}
var armor = instance_place(x, y, obj_boss_vent_shield)
if armor
{
    audio_play_sound(snd_driller_hitwall0, 5, false)
    instance_destroy()
    t = instance_create(x, y, obj_rocketboom_no_damage)
    armor.hp--
    with (obj_boss_vent)
    {
        spin_speed = approach(spin_speed, 0, 0.2)
        var ang = point_direction(other.x, other.y, x, y)
        hspd += lengthdir_x(other.spd, ang)
        vspd += lengthdir_y(other.spd, ang)
    }
    return;
}
var enemy = collision_circle(x, y, 7, obj_enemy, 0, 0)
if enemy
{
    instance_create(x, y, obj_bulimp_sm)
    flag = 1
    t = instance_create(x, y, obj_rocketboom)
    t.pushplayer = 1
    instance_destroy()
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
