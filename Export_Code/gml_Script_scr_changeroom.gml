var target_room = argument0
var trig = argument1
var dir = trig.dir
var offx = argument3
var offy = argument4
var c_room = instance_create(0, 0, obj_changeroom)
c_room.old_room = argument2
c_room.old_room_id = global.current_room
c_room.sprite_index = argument2
c_room.dir = dir
switch dir
{
    case 180:
        c_room.x += 304
        break
    case 0:
        c_room.x -= 304
        break
    case 90:
        if instance_exists(obj_player)
        {
            with (obj_player)
            {
                if (!(place_meeting(x, y, obj_lavatop)))
                    vspd = (-jumpspeed)
                y += 192
            }
        }
        break
    case 270:
        c_room.y -= 192
        break
}

obj_player.x -= (offx * 304)
obj_player.y -= (offy * 192)
if (global.current_room != target_room)
{
    __view_set(0, 0, (c_room.x - 2))
    __view_set(1, 0, (c_room.y - 2))
}
with (obj_shake)
    instance_destroy()
global.shake = 0
qu_reset()
global.current_room = target_room
scr_room_goto(target_room)
get_room_state()
obj_camera.active = 0
