visible = true
image_blend = c_white
if (ceil(image_index) == image_number)
{
    state = 364
    sprite_index = spr_driller_chase
    image_index = 0
    hspd = dir
    audio_play_sound(DrillerDrilling, 100, true)
}
