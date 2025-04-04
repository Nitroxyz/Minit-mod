if (palette_obj_selected == 11 || palette_obj_selected == 163 || palette_obj_selected == 164 || palette_obj_selected == 155 || palette_obj_selected == 156)
    grid_layer = "foreground"
else
    grid_layer = "player"
cursor_change("brush")
scr_cout("paintbrush tool. #fill an area with selected tile")
