image_speed = 0.2
sprite_index = spr_trashcan_open
animate_actor()
if (iindex > 3)
    stun_state = 315
if ((iindex + image_speed) >= image_number)
{
    state = 392
    sprite_index = spr_trashcan_shoot
    iindex = 0
}
