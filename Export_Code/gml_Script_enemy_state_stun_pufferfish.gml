if enemy_tick_stun_timer()
{
    state = previous_state
    if (hp <= 0 && donotdestroy == 0)
        script_execute(death_event)
}
else
{
    script_execute(previous_state)
    if (state != 339)
    {
        if (hp <= 0 && donotdestroy == 0)
            script_execute(death_event)
    }
}
