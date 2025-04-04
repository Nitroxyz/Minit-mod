animate_actor()
sprite_index = spr_robofish_swim
image_speed = 0.2
timer += 2
if ((timer % 24) == 0)
    instance_create((x + image_xscale * 2), (y - 4), obj_water_bubble_catbreath)
hspd = image_xscale * 0.5
vspd = sin(degtorad(timer)) * 0.5
var player = collision_line((x + sign(hspd)), y, (x + sign(hspd) * 160), y, obj_player, false, false)
if player
{
    state = 334
    process_play_swim_sound()
    audio_play_sound(DrillerAlerted, 5, false)
    hspd = 0
    vspd = 0
    iindex = 0
}
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    process_play_swim_sound()
    image_xscale = (-image_xscale)
    hspd = 0
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = 0
}
y += vspd
if (!(place_meeting(x, y, WATER)))
{
    state = 337
    image_speed = 0.05
    iindex = 0
    sprite_index = spr_robofish_out_of_water
    vspd = 2 * abs(vspd)
    audio_play_sound(Splash, 5, false)
}
