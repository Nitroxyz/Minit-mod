var anim_cur_old = anim_cur
for (var i = 0; i < 20; i++)
{
    anim_cur++
    if file_exists("anim" + string(anim_cur))
    {
        anim_editor_load_animation("anim" + string(anim_cur))
        return;
    }
}
anim_cur = anim_cur_old
