sprite_index = spr_frog_start_hop
image_speed = 0.1
animate_actor()
if (iindex == (image_number - 1))
{
    iindex = 0
    sprite_index = spr_frog_hop_up
    image_speed = 0
    vspd = (-jumpheight[current_hop])
    hspd = jumpdist[current_hop] * image_xscale
    var _sfx = audio_play_sound(jumpsfx[current_hop], 10, false)
    audio_sound_pitch(_sfx, random_range(0.9, 1.1))
    if (current_hop == 0)
        current_hop = 1
    else
        current_hop = 0
    state = 322
}
if (!(place_meeting(x, (y + 1), obj_wall)))
    state = 322
