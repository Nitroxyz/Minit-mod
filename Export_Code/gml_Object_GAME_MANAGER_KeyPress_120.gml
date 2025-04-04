if (!debug_commands)
    return;
global.language = wrap((global.language + 1), 1, 11)
process_define_font_settings()
