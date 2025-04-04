bottom = instance_create(x, y, obj_wall)
bottom.image_xscale = image_xscale
bottom.sprite_index = spr_hotboy_bottom
var t_sp = instance_create((x + 32 * image_xscale), (y - 32), obj_spike_2)
t_sp.image_angle -= (90 * image_xscale)
t_sp.depth = 10
t_sp.sprite_index = spr_none
t_sp.mask_index = spr_spike_2
with (t_sp)
    event_perform(ev_other, ev_room_start)
t_sp = instance_create((x + 32 * image_xscale), (y + 48), obj_spike_2)
t_sp.image_angle -= (90 * image_xscale)
t_sp.sprite_index = spr_none
t_sp.mask_index = spr_spike_2
with (t_sp)
    event_perform(ev_other, ev_room_start)
visible = true
if (get_room_state() == 2)
{
    bottom.visible = false
    visible = false
    image_speed = 0.2
    if (global.flows_cleared == 0)
        c_anim_initialize("anim_hotboy_idle")
    else
    {
        c_anim_initialize("anim_hotboy2_idle")
        c_anim_stun = "anim_hotboy2_stun"
        anim_talk = "anim_hotboy2_talk"
        anim_stun = "anim_hotboy2_stun"
        anim_idle = "anim_hotboy2_idle"
        anim_clench = "anim_hotboy2_clench"
        anim_shoot = "anim_hotboy2_shoot"
        anim_shoot_2 = "anim_hotboy2_shoot_2"
        anim_rocket_shoot = "anim_hotboy2_rocket_shoot"
        anim_rocket_clench = "anim_hotboy2_rocket_clench"
        anim_jump = "anim_hotboy2_jump"
        obj_custom9.death_event = 594
        obj_custom9.hp = 170
    }
    obj_custom9.exploit_blocker = instance_create((x + 24 * image_xscale), (y + 36), obj_spike_2)
    obj_custom9.exploit_blocker.sprite_index = spr_none
    obj_custom9.exploit_blocker.mask_index = spr_spike_2
    with (obj_custom9.exploit_blocker)
        event_perform(ev_other, ev_room_start)
    with (obj_door_auto_U)
        dont_play_lockmusic = 1
}
else
{
    scr_clear_lockroom_doors()
    bottom.visible = true
    sprite_index = spr_hotboy_destroyed
}
