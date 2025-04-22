if (global.minit_mode > 0 && global.minit_active == 1)
{
    var _time_left = minit_time_calc()
    draw_text_outline(33, (30 + global.ui_text_offset), _time_left)
}
