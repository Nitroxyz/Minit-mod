if (!(is_within_view(x, y, 0, 16)))
    return;
if (swim_timer > 0)
    swim_timer--
else
{
    swim_timer = 120
    if instance_exists(obj_player)
    {
        move_dir = point_direction(x, y, obj_player.x, obj_player.y)
        move_dir = mround(move_dir, 45)
    }
    state = 345
    process_play_swim_sound()
}
hspd = approach(hspd, 0, decel)
vspd = approach(vspd, 0, decel)
if (point_distance(0, 0, hspd, vspd) > 0.5)
{
    bubble_ticker++
    if ((bubble_ticker % 7) == 0)
        instance_create(xprevious, yprevious, obj_water_bubble_catbreath)
}
else
    bubble_ticker = 0
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = (-hspd)
    move_dir = point_direction(0, 0, hspd, vspd)
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = -0.8 * vspd
    move_dir = point_direction(0, 0, hspd, vspd)
}
else
    y += vspd
if (point_distance(0, 0, hspd, vspd) < 0.05)
{
    if (iindex != 0)
        animate_actor()
}
draw_dir = (move_dir div 45) * 45
if ((draw_dir % 90) == 0)
{
    sprite_index = spr_squid_swim
    stun_sprite = 304
    image_angle = draw_dir
}
else
{
    sprite_index = spr_squid_swim_diag
    stun_sprite = 305
    image_angle = draw_dir - 45
}
if (!(place_meeting(x, y, WATER)))
{
    state = 346
    vspd *= 2
    audio_play_sound(Splash, 5, false)
}
