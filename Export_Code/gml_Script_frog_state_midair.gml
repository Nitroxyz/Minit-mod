sprite_index = spr_frog_hop_up
if (vspd < -0.5)
    iindex = 0
else if (vspd > -0.5 && vspd < 0.5)
    iindex = 1
else
    iindex = 2
vspd += grav
vspd = clamp(vspd, -5, 5)
if place_meeting((x + hspd), (y + vspd), obj_frog)
{
    var _other = instance_place((x + hspd), (y + vspd), obj_frog)
    var _dir = point_direction(_other.x, _other.y, x, y)
    hspd = lengthdir_x(abs(hspd), _dir)
    vspd = lengthdir_y(abs(vspd), _dir)
    image_xscale = (hspd != 0 ? sign(hspd) : image_xscale)
}
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    hspd = (-hspd)
    image_xscale *= -1
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = 0
}
y += vspd
if place_meeting(x, (y + 1), obj_wall)
{
    state = 321
    iindex = 0
    sprite_index = spr_frog_land
    image_speed = 0.1
    hspd = 0
    vspd = 0
}
if place_meeting(x, y, WATER)
{
    state = 323
    iindex = 0
    idle_timer = 60
    vspd *= 0.25
    var water = instance_nearest(x, y, WATER)
    instance_create(x, water.y, obj_splash)
    var sfx = audio_play_sound(Splash, 5, false)
    audio_sound_pitch(sfx, 0.8)
    instance_create(x, (bbox_bottom + 2), obj_water_bubble_catbreath)
    instance_create((x - 4), (bbox_bottom + 2), obj_water_bubble_catbreath)
    instance_create((x + 4), (bbox_bottom + 2), obj_water_bubble_catbreath)
}
