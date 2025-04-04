if keyboard_check(vk_shift)
{
    if file_exists("anim" + string(anim_cur))
        file_delete("anim" + string(anim_cur))
    for (var i = 0; i < 20; i++)
    {
        anim_cur--
        if file_exists("anim" + string(anim_cur))
        {
            anim_editor_load_animation("anim" + string(anim_cur))
            return;
        }
    }
    for (i = 0; i < 20; i++)
    {
        anim_cur++
        if file_exists("anim" + string(anim_cur))
        {
            anim_editor_load_animation("anim" + string(anim_cur))
            return;
        }
    }
    event_perform(ev_keyrelease, vk_f1)
}
