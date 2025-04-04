event_inherited()
cat_is_touching = 0
cat_can_enter = 1
hp = global.sub_hp_max
hide_duplicates = 0
grounded = 0
vspd = 0
angle = 0
angle_speed = 0.025
mag = 4
ycenter = y
if instance_exists(obj_player)
{
    if (obj_player.vehicle == 2)
        instance_destroy()
}
