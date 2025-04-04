if (!(place_meeting(x, y, WATER)))
{
    if initialized
    {
        state = 322
        if (vspd < 0)
            vspd = -3
        idle_timer = idle_timer_max
        if instance_exists(WATER)
        {
            var water = instance_nearest(x, y, WATER)
            instance_create(x, water.y, obj_splash)
            var sfx = audio_play_sound(Splash, 5, false)
            audio_sound_pitch(sfx, 1)
        }
    }
    else
    {
        state = 322
        idle_timer = idle_timer_max
        initialized = 1
    }
    return;
}
sprite_index = spr_frog_swim
image_speed = 0.2
if (iindex == 0)
{
    hspd = approach(hspd, 0, 0.05)
    if (idle_timer > 0)
        idle_timer--
    else
    {
        iindex++
        instance_create(x, y, obj_water_bubble_catbreath)
        idle_timer = 10
        hspd = sign(image_xscale) * 2
        vspd = -1
    }
}
else if (iindex == 4)
{
    if (idle_timer > 0)
        idle_timer--
    else
    {
        idle_timer = 20
        iindex++
        instance_create(x, y, obj_water_bubble_catbreath)
    }
}
else
{
    animate_actor()
    hspd = approach(hspd, 0, 0.05)
}
vspd = approach(vspd, 1, 0.025)
if place_meeting((x + hspd), y, obj_wall)
{
    hspd = (-hspd)
    image_xscale *= -1
}
x += hspd
if place_meeting(x, (y + vspd), obj_wall)
{
    while (!(place_meeting(x, (y + sign(vspd)), obj_wall)))
        y += sign(vspd)
    vspd = 0
}
y += vspd
if (!initialized)
    initialized = 1
