image_speed = 0.25
sprite_index = spr_frog_idle
animate_actor()
if (!(is_within_view(x, y, 0, 16)))
    return;
if (idle_timer > 0)
    idle_timer--
else
{
    idle_timer = idle_timer_max
    state = 320
    iindex = 0
    sprite_index = spr_frog_start_hop
}
if (!(place_meeting(x, (y + 1), obj_wall)))
    state = 322
if (!initialized)
    initialized = 1
