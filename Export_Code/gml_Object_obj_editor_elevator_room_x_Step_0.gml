if (!instance_exists(button[0]))
{
    button[0] = instance_create(x, y, obj_editor_button0)
    button[0].sprite_index = spr_editor_arrow
    button[0].text = ""
    button[0].host = id
    button[0].key_target = 109
}
if (!instance_exists(button[1]))
{
    button[1] = instance_create((x + 16), y, obj_editor_button0)
    button[1].sprite_index = spr_editor_arrow
    button[1].image_xscale = -1
    button[1].text = ""
    button[1].host = id
    button[1].key_target = 107
}
