if instance_exists(obj_player)
{
    obj_player.a_double_jump = get_bitwise_flag(global.abilities, 2)
    obj_player.a_rocket_count = 1
    obj_player.rocketstam = 16 * obj_player.a_rocket_count
    obj_player.a_dash = get_bitwise_flag(global.abilities, 4)
    obj_player.hopper = get_bitwise_flag(global.abilities, 16)
    obj_player.max_hp = global.max_hp
    obj_player.hp = obj_player.max_hp
    obj_player.equippedGun = global.gunEquip
    if get_bitwise_flag(global.gunEquip, 1)
    {
        obj_player.bullet_object = 28
        obj_player.muzzle_obj = 30
    }
    else
    {
        obj_player.bullet_object = 20
        obj_player.muzzle_obj = 65
    }
    if get_bitwise_flag(global.gunEquip, 8)
        obj_player.repeater = 1
    else
        obj_player.repeater = 0
    catmood_update(2, 40)
}
if instance_exists(obj_gun)
{
    if get_bitwise_flag(global.gunEquip, 1)
        obj_gun.mySprite = 616
    else
        obj_gun.mySprite = 613
}
