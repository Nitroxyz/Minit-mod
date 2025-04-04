sprite_index = spr_punchbot_alert
image_speed = 0.3
stun_state = 317
animate_actor()
if ((iindex + image_speed) >= image_number)
{
    sprite_index = spr_punchbot_walk
    state = 404
}
