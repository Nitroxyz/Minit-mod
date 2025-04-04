if enemy_tick_stun_timer()
{
    state = previous_state
    if (hp <= 0 && donotdestroy == 0)
        script_execute(death_event)
}
else
{
    if (previous_state != gary_state_spin)
        script_execute(previous_state)
    if (state != 652)
    {
        if (hp <= 0 && donotdestroy == 0)
            script_execute(death_event)
    }
}
