var xbegin = obj_camera.xmin
var ybegin = obj_camera.ymin - 8
var i = 0
var j = 0
var tilew = (obj_camera.xmax - obj_camera.xmin) / 16 + 24
var tileh = (obj_camera.ymax - obj_camera.ymin) / 16 + 17
var seg = 0
var segold = 0
j = 0
while (j < tileh)
{
    for (i = 0; i < tilew; i++)
    {
        if (segold == seg && position_meeting((xbegin + i * 16), (ybegin + j * 16 + 16), obj_lavacen))
            seg++
        while position_meeting((xbegin + i * 16), (ybegin + j * 16), obj_lavatop)
        {
            with (instance_position((xbegin + i * 16), (ybegin + j * 16), obj_lavatop))
                instance_destroy()
        }
    }
    if (seg > global.water_level)
        break
    else
    {
        segold = seg
        j++
        continue
    }
}
with (obj_lavacen)
{
    if position_meeting(x, (y - 16), obj_lavatop)
        instance_change(obj_lavadeep, false)
}
with (obj_vacant_sub)
{
    if (!(place_meeting(x, y, obj_lavatop)))
        instance_destroy()
}
with (obj_water_enemy)
    event_perform(ev_other, ev_room_start)
