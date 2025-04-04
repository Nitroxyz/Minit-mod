depth = -10000
checked = 0
prop_cur = 0
property[0] = "-1"
message[0] = "Intro Area"
message[1] = "Aqueduct"
message[2] = "Hub World"
message[3] = "Heater Core"
message[4] = "Ventilation"
message[5] = "Incubator"
message[6] = "Laboratory"
image_speed = 0
prop_cur = real(string_copy(obj_editor.properties_maptarget, 4, 1))
var int = 0
while file_exists("map" + string(int))
{
    property[int] = "map" + string(int)
    int++
}
button[0] = instance_create(x, y, obj_editor_button0)
button[0].sprite_index = spr_editor_arrow
button[0].text = ""
button[0].host = id
button[0].key_target = 109
button[1] = instance_create((x + 16), y, obj_editor_button0)
button[1].sprite_index = spr_editor_arrow
button[1].image_xscale = -1
button[1].text = ""
button[1].host = id
button[1].key_target = 107
