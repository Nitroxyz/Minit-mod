if (!active)
    return;
drift = sin(angle)
angle += drift_speed
if (timer_front > 0)
    timer_front--
else
{
    timer_front = timer_front_max
    var t = instance_create((8 + 16 * (counter % 38)), 0, obj_snow_particle)
    t.iindex = choose(0, 1, 2)
    t.front = 1
    counter += choose(3, 4)
}
if (timer_back > 0)
    timer_back--
else
{
    timer_back = timer_back_max
    instance_create((8 + 16 * (counter % 38)), 0, obj_snow_particle)
    counter += choose(3, 4)
}
