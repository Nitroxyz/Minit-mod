if enemy_tick_stun_timer()
{
    if (previous_state == 404)
    {
        state = 403
        iindex = 0
    }
    else
        state = previous_state
    if (hp <= 0 && donotdestroy == 0)
        script_execute(death_event)
}
