if instance_exists(obj_player)
    x = approach(x, obj_player.x, 0.5)
if (stopped_timer > 0)
    stopped_timer--
else
{
    state = 618
    stopped_timer = stopped_timer_max
    spin_speed = 5
}
boss_vent_spin_shields()
