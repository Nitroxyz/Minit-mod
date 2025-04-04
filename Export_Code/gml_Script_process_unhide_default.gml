scr_unhide_enemies()
player_auto_end()
if ((!instance_exists(obj_boss)) && dont_play_lockmusic == 0)
{
    audio_play_sound(_SideDoorClose, 100, false)
    music_duck(1, 0)
    music_xfade(CatroidEnemyLock, 0)
}
