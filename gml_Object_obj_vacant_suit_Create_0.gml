image_speed = 0.25
depth = -5
iindex = 0
gunplat = -1
state = 0
vspd = 0
gunplatblocked = 0
if instance_exists(obj_player)
{
    if (obj_player.move_state == 75)
    {
        obj_player.visible = false
        obj_player.sprite_index = spr_cat_walk
        obj_player.mask_index = spr_cat_idle
        obj_gun.visible = false
    }
    else
    {
        iindex = image_number - 1
        image_speed = 0
    }
}
