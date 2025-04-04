missilecopter_enginesound_mod()
sprite_index = spr_missilecopter_load
image_speed = 0.25
stun_state = 652
animate_actor()
hspd = 0
vspd = 0
if ((iindex + image_speed) >= image_number)
{
    sprite_index = spr_missilecopter_shoot
    image_speed = 0.2
    iindex = 0
    state = 399
}
