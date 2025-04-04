vehicle = 2
hspd = approach(hspd, 0, (sub_drag / 2))
vspd += grav
if place_meeting(x, (y + 1), obj_wall)
    grounded = 1
else
    grounded = 0
if grounded
    hspd = approach(hspd, 0, sub_drag)
if (key_dismount && grounded)
{
    player_exit_sub()
    vspd = 0
}
