if (flag1 == 0)
    return;
if surface_exists(GAME_MANAGER.surf)
    transition_sprite = sprite_create_from_surface(GAME_MANAGER.surf, 2, 2, 304, 192, false, false, 0, 0)
else
    transition_sprite = 144
if instance_exists(obj_player)
{
    obj_player.visible = true
    draw_sprite(obj_player.sprite_index, obj_player.image_index, obj_player.x, obj_player.y)
}
if instance_exists(obj_hud)
{
    obj_hud.linesvisible = 1
    var tvx = __view_get(0, 0)
    var tvw = __view_get(2, 0)
    var tvy = __view_get(1, 0)
    var tvh = __view_get(3, 0)
    draw_frame4(tvx, tvy, (tvx + tvw), (tvy + tvh))
}
instance_destroy()
