audio_play_sound(FrogJump, 100, false)
hspd = argument0
vspd = max(argument1, -6)
sprite_index = spr_froggo_jump
state = 349
if (hspd != 0)
    image_xscale = sign(hspd)
image_index = 0
image_speed = 0
