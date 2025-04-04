if enemy_tick_stun_timer()
{
    state = previous_state
    if (hp <= 0 && donotdestroy == 0)
        script_execute(death_event)
}
