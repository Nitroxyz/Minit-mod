sprite_index = spr_dilla_walk
if place_meeting(x, (y + 1), obj_wall)
{
    grounded = 1
    vspd = 0
}
else
    grounded = 0
if grounded
{
    hspd = sign(image_xscale) * walk_spd
    image_speed = 0.2
}
else
{
    state = 369
    start_slowing = 1
    return;
}
if instance_exists(obj_player)
{
    var hit = 0
    var scandist = 1
    var col_line = 0
    while (scandist < 96 && (!col_line))
    {
        col_line = collision_line(x, y, (x + sign(image_xscale) * scandist), y, ACTOR, false, true)
        if (col_line == instance_nearest(x, y, obj_player))
            hit = 1
        else
        {
            scandist += 4
            continue
        }
    }
    if hit
    {
        state = 368
        hspd = 0
        vspd = 0
        iindex = 0
        return;
    }
}
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = 0
    image_xscale = (-image_xscale)
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = 0
}
y += vspd
var iindex_old = floor(iindex)
animate_actor()
if (iindex_old != floor(iindex) && iindex_old == 0)
    audio_play_sound(snd_dilla_walk, 100, false)
