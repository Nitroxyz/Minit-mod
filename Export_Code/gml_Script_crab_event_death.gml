set_room_state(1)
process_deactivate_flameblocks()
with (obj_enemy_collider)
    instance_destroy()
with (obj_boss3)
{
    active = 0
    music_duck(0, 0)
    instance_destroy()
    shake_screen(30)
}
with (obj_custom1)
    instance_destroy()
with (obj_custom2)
    instance_destroy()
with (obj_custom3)
    instance_destroy()
with (obj_custom4)
    instance_destroy()
with (obj_custom5)
    instance_destroy()
with (obj_custom6)
    instance_destroy()
instance_destroy()
qu_set(259)
