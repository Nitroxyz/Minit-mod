with (all)
{
    if (id != other.id)
        instance_destroy()
}
audio_stop_all()
window_set_size(1280, 720)
surface_resize(application_surface, 1280, 720)
global.shake = 0
room_speed = 60
custom_sprites = -1
var c_sprite_cur = 0
while (asset_get_index("spr_custom" + string(c_sprite_cur)) != -1)
{
    custom_sprites[c_sprite_cur] = asset_get_index("spr_custom" + string(c_sprite_cur))
    c_sprite_cur++
}
custom_objs = -1
var c_obj_cur = 0
while (asset_get_index("obj_custom" + string(c_obj_cur)) != -1)
{
    custom_sprites[c_obj_cur] = asset_get_index("spr_custom" + string(c_obj_cur))
    c_obj_cur++
}
stage_border_x = 0
stage_border_y = 0
stage_border_x_edge = 320
stage_border_y_edge = 320
stage_x = 160
stage_y = 160
transport_x = 0
transport_x_edge = 320
transport_y = 320
transport_y_edge = 360
transport_jump_back = instance_create(transport_x, transport_y, obj_anim_editor_button)
transport_jump_back.sprite_index = spr_anim_editor_transport_jump_back
transport_step_back = instance_create((transport_x + 64), transport_y, obj_anim_editor_button)
transport_step_back.sprite_index = spr_anim_editor_transport_step_back
transport_play = instance_create((transport_x + 128), transport_y, obj_anim_editor_button)
transport_play.sprite_index = spr_anim_editor_transport_play
transport_step_forward = instance_create((transport_x + 192), transport_y, obj_anim_editor_button)
transport_step_forward.sprite_index = spr_anim_editor_transport_step_forward
transport_jump_forward = instance_create((transport_x + 256), transport_y, obj_anim_editor_button)
transport_jump_forward.sprite_index = spr_anim_editor_transport_jump_forward
properties_x = 330
properties_y = 10
properties_border_x = 320
properties_border_y = 0
properties_border_x_edge = 640
properties_border_y_edge = 96
timeline_x = 330
timeline_y = 106
timeline_border_x = 320
timeline_border_y = 96
timeline_border_x_edge = 640
timeline_border_y_edge = 360
timeline_type_sprite = 0
timeline_type_object = 1
timeline_type_effect = 2
timeline_layer_count = 0
timeline_layer_type = -1
timeline_layer_asset = -1
timeline_layer_sound = -1
timeline_layer_effect = -1
timeline_layer_iindex = -1
timeline_layer_x = -1
timeline_layer_y = -1
timeline_layer_rotation = -1
timeline_layer_flip = -1
timeline_layer_cur = 0
timeline_cur = 0
timeline_view_cur = 0
timeline_length = 0
sound_x = properties_x
sound_y = properties_y
sound_button_x = sound_x + 96
effect_x = properties_x
effect_y = sound_y + 24
effect_button_x = effect_x + 96
playing = 0
image_speed = 0.2
timeline_cur_real = 0
anim_cur = 0
anim_name = "anim0"
if file_exists(anim_name)
    anim_editor_load_animation(anim_name)
else
    anim_editor_create_animation(anim_name)
scr_cout("Welcome to the GAT0-1 anim editor")
console_x = 400
console_y = 224
