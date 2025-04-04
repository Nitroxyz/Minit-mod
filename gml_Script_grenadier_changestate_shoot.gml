if (state == 2)
    grenade_state_timer += 10
else
{
    state = 359
    sprite_index = spr_grenadier_shoot
    image_speed = 0.1
    image_index = 0
    shoot_count = 2
    alert_ready = 0
}
