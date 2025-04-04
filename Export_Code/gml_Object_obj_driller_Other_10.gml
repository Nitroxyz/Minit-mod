script_execute(state)
enemy_tick_stun_timer()
if (alarm[1] > 0)
    alarm[1]--
else if (alarm[1] == 0)
{
    state = 362
    sprite_index = spr_driller_patrol
    dir *= -1
    image_xscale = dir
    alert_ready = 0
    alarm[2] = 30
    alarm[1] = -1
}
if (alarm[2] > 0)
    alarm[2]--
else if (alarm[2] == 0)
{
    alert_ready = 1
    alarm[2] = -1
}
