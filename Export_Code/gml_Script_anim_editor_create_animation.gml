anim_editor_reset_all()
timeline_length = 16
timeline_layer_sound[0] = -1
timeline_layer_effect[0] = -1
anim_editor_add_layer(0)
anim_editor_add_layer(1)
anim_editor_add_layer(1)
anim_editor_add_layer(2)
anim_editor_add_layer(2)
anim_editor_add_layer(3)
anim_editor_add_layer(3)
anim_editor_add_layer(4)
anim_editor_add_layer(4)
anim_editor_add_layer(4)
anim_editor_add_layer(4)
anim_editor_add_layer(5)
anim_editor_add_layer(5)
anim_editor_add_layer(5)
anim_editor_add_layer(5)
anim_editor_add_layer(6)
anim_editor_add_layer(6)
anim_editor_add_layer(6)
anim_editor_add_layer(6)
while (array_height_2d(timeline_layer_iindex) < timeline_length)
    anim_editor_copy_layer_forward(array_height_2d(timeline_layer_iindex) - 1)
anim_editor_save_animation(argument0)
