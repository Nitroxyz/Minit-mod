animate_actor()
if place_meeting((x + hspd), y, obj_wall)
{
    var _w = instance_place((x + hspd), y, obj_wall)
    if (_w.visible && _w.object_index != obj_demo_end_elevator_big)
    {
        while (!(place_meeting((x + sign(hspd)), y, obj_wall)))
            x += sign(hspd)
        hspd = 0
        instance_destroy()
        shake_screen(6)
        instance_create(x, (y + 8), obj_grenade_explosion)
        return;
    }
}
x += hspd
if (x < obj_camera.xmin || x > (obj_camera.xmax + 304))
    instance_destroy()
