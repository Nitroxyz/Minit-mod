if instance_exists(MUSIC_MANAGER)
    return MUSIC_MANAGER.current_song;
else
    return -1;
