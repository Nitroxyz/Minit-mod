get_input()
if (j_start || keyboard_check_pressed(vk_escape))
{
    instance_destroy(PAUSE_MENU)
    game_changestate_play()
}
update_ui()
