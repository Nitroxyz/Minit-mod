if gettable
{
    ability_update()
    scr_flash(0.5, 4)
    ds_list_add(global.getlist, string(uid))
    qu_set(getquest)
    audio_play_sound(ItemFanfare, 100, false)
    gettable = 0
    visible = false
    global.items_collected++
}
