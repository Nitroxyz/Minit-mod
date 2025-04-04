animate_actor()
sprite_index = spr_robofish_dash
image_speed = 0.4
charge_spd = approach(charge_spd, charge_max, charge_acc)
hspd = image_xscale * charge_spd
vspd = 0
timer++
if ((timer % 2) == 0)
    instance_create((x - image_xscale * 8), y, obj_water_bubble_catbreath)
if place_meeting((x + hspd), y, obj_wall)
{
    while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
        x += sign(hspd)
    sprite_index = spr_robofish_turnaround
    iindex = 0
    image_speed = 0.4
    image_xscale = (-image_xscale)
    hspd = image_xscale
    state = 336
    process_play_swim_sound()
    if audio_is_playing(chargesound)
        audio_stop_sound(chargesound)
    chargesound = -1
    return;
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    process_play_swim_sound()
    state = 333
    vspd = 0
    if audio_is_playing(chargesound)
        audio_stop_sound(chargesound)
    chargesound = -1
}
y += vspd
