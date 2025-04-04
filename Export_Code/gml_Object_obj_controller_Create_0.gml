if (instance_number(obj_controller) > 1)
{
    dupflag = 1
    instance_destroy()
    return;
}
else
    dupflag = 0
instance_create(0, 0, obj_hud)
global.shake = 0
state = "game"
state_step = 0
cur = 0
cur_max = 1
alarm[1] = -1
depth = -100
pause_scroll = 0
pause_scroll_spd = 0
pause_scroll_timer = 0
global.dump_tool = 0
sfx_menu_move_down = 72
sfx_menu_move_up = 72
sfx_menu_select = 71
sfx_menu_deselect = 73
sfx_menu_pause = 97
dialog_controller_frame = -1
dialog_controller_sprite = -1
dialog_controller_text = -1
dialog_variable = -1
