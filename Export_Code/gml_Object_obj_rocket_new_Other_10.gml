hspd = lengthdir_x(spd, image_angle)
vspd = lengthdir_y(spd, image_angle)
spd = approach(spd, target_spd, bullet_acceleration)
y += vspd
x += hspd
if (irandom(2) == 0)
{
    if (vspd == 0)
    {
        var wander_y = choose(1, -1)
        if (!(place_meeting(x, (y + wander_y), obj_wall)))
            y += wander_y
    }
    else
    {
        var wander_x = choose(1, -1)
        if (!(place_meeting((x + wander_x), y, obj_wall)))
            x += wander_x
    }
}
if (init == 1)
    init = 0
else
{
    if (trail_timer[0] > 0)
        trail_timer[0]--
    else if (trail_timer[0] == 0)
    {
        trail_timer[1] = 1
        trail_timer[0]--
        var temp = instance_create(x, y, obj_rocketrail)
        temp.image_angle = image_angle
        temp.depth = depth + 1
    }
    if (trail_timer[1] > 0)
        trail_timer[1]--
    else if (trail_timer[1] == 0)
    {
        trail_timer[2] = 2
        trail_timer[1]--
        temp = instance_create((x - (x - xprevious) * 4), (y - (y - yprevious) * 4), obj_rocketrail)
        temp.image_angle = image_angle
        image_index = 1
        temp.depth = depth + 1
        temp = instance_create(xprevious, yprevious, obj_rocketrail)
        temp.image_angle = image_angle
        image_index = 2
        temp.depth = depth + 2
    }
    if (trail_timer[2] > 0)
        trail_timer[2]--
    else if (trail_timer[2] == 0)
    {
        trail_timer[0] = 4
        trail_timer[2]--
        temp = instance_create(((x + xprevious) / 2), ((y + yprevious) / 2), obj_rocketrail)
        temp.image_angle = image_angle
        image_index = 1
        temp.depth = depth + 1
        temp = instance_create(xprevious, yprevious, obj_rocketrail)
        temp.image_angle = image_angle
        image_index = 2
        temp.depth = depth + 2
        temp = instance_create(x, y, obj_rocketrail)
        temp.image_angle = image_angle
        temp.depth = depth + 1
        hspd = sign(hspd) * (abs(hspd * 1.34))
        vspd = sign(vspd) * (abs(vspd * 1.34))
        repeat (3)
            temp = instance_create(xprevious, yprevious, obj_dust_cloud_walk)
    }
}
var wall = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_wall, 0, 0)
if wall
{
    var c_flag = 1
    if place_meeting(wall.x, wall.y, obj_bridgenode)
        c_flag = 0
    if c_flag
    {
        if (wall.open_hp != -1)
            wall.open_hp -= 5
        instance_create(x, y, obj_shakesmall)
        var t = instance_create(x, y, obj_rocketboom_wallhit)
        if instance_exists(obj_player)
        {
            if (abs(obj_player.x - obj_camera.xmin) > 16 && abs(obj_player.x - (obj_camera.xmax + 304)) > 16)
                t.pushplayer = 1
        }
        instance_destroy()
        return;
    }
}
var enemy = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_enemy, 0, 0)
if enemy
{
    t = instance_create(x, y, obj_rocketboom)
    t.pushplayer = 1
    t.atk = atk
    flag = 1
    instance_destroy()
    return;
}
var t_water = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_lavatop, 0, 0)
if t_water
{
    t = instance_create(x, y, obj_rocketboom)
    t.pushplayer = 1
    instance_create(x, y, obj_shakesmall)
    instance_destroy()
    return;
}
