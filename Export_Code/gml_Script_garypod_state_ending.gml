garypod_enginesound_mod()
var flag = 0
with (obj_boss_gary_pod)
{
    x += hspd
    y += vspd
    hspd = approach(hspd, 2, 0.05)
    vspd = approach(vspd, 1, 0.05)
    image_angle = -2 * hspd
    gary.image_angle = image_angle
    gary.x = x - 16 * sin(degtorad(image_angle))
    gary.y = y - 20 + 16 * sin(degtorad(image_angle))
    if (x > 368)
        flag = 1
}
if flag
{
    instance_destroy()
    with (obj_boss_gary_pod)
        instance_destroy()
    with (obj_gary_in_tube)
        instance_destroy()
    music_xfade(MUSIC_MANAGER.current_main_theme, 0)
    music_duck(1, 1000)
}
