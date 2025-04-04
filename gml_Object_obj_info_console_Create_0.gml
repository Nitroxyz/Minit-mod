event_inherited()
visible = true
play_item_music = 0
other_music = 276
state = 0
powered_on = 0
button_id = -1
image_speed = 0.1
if instance_exists(MAP_MANAGER)
{
    switch MAP_MANAGER.map_current
    {
        case "map0":
            console_event = 221
            break
        case "map2":
            console_event = 224
            break
        case "map1":
            console_event = 225
            break
        case "map3":
            console_event = 219
            break
        case "map4":
            console_event = 220
            break
        case "map5":
            console_event = 222
            break
        default:
            console_event = 225
            break
    }

}
else
    console_event = 225
