if instance_exists(sidewall_a)
{
    with (sidewall_a)
        instance_destroy()
}
if instance_exists(sidewall_b)
{
    with (sidewall_b)
        instance_destroy()
}
for (var i = 0; i < 6; i++)
{
    if instance_exists(water[i])
    {
        with (water[i])
        {
            instance_create(approach(x, (other.x + 8), 3), approach(y, (other.y + 24), 6), obj_glass_particle)
            instance_destroy()
        }
    }
}
audio_play_sound(snd_glass_shatter, 100, false)
iindex = 2
