scr_plr_manual()
if (key_shoot2 || key_shoot3 || key_jump || key_dash || GAME_MANAGER.j_skip)
{
    if ((!instance_exists(obj_hud)) || (obj_hud.dialog_mode == 1 && obj_hud.dialog == obj_hud.dialogtemp) || obj_hud.dialog_mode == 0)
    {
        var at = audio_play_sound(UImove, 100, false)
        audio_sound_pitch(at, random_range(1.1, 1.2))
    }
    if (obj_hud.dialogtemp != obj_hud.dialog)
        obj_hud.dialogtemp = obj_hud.dialog
    else
        return 1;
}
else
    return 0;
