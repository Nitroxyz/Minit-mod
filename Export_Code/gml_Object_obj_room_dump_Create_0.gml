global.dump_tool = 1
global.editor = 0
text_cur = 0
for (var i = 0; i < 24; i++)
    text[i] = ""
text[0] = "catroid room dump utility"
text[1] = "press enter to dump all rooms"
alarm[0] = 12
i = 0
room_id[0] = room_next(r_loadout)
while (room_next(room_id[i]) != -1)
{
    room_id[(i + 1)] = room_next(room_id[i])
    i++
}
room_cur = 0
