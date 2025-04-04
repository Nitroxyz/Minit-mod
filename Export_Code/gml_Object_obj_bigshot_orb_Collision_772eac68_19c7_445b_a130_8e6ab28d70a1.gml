if gettable
{
    global.gunEquip = set_bitwise_flag(global.gunEquip, 1, 1)
    ability_update()
}
event_inherited()
