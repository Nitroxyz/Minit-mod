global.editor_room = global.current_room
global.editor_map = MAP_MANAGER.map_current
cannot_escape = 1
ini_open("editorprefs.ini")
ini_write_string("editor", "editor_map", global.editor_map)
ini_write_string("editor", "editor_room", global.editor_room)
ini_write_real("editor", "editor_spawn_x", global.editor_spawn_x)
ini_write_real("editor", "editor_spawn_y", global.editor_spawn_y)
ini_write_string("editor", "editor_start_cat", string(global.editor_start_cat))
ini_write_string("editor", "editor_abilities", string(global.editor_abilities))
ini_close()
editor_save_room(global.current_room)
editor_test_room()
