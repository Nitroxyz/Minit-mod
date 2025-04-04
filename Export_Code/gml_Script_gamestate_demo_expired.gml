get_input()
if (demo_expired_timer > 30)
{
    if (j_a_pressed || j_b_pressed || j_x_pressed || j_y_pressed || j_start)
        event_perform(ev_keyrelease, vk_escape)
}
else
    demo_expired_timer++
