ini_open("audio_file_levels.ini")
if ini_section_exists("audio")
    ini_section_delete("audio")
for (var i = mu_cat_exploration; i < array_length_1d(global.audio_default_volumes); i++)
{
    if (audio_values_o[i] != global.audio_default_volumes[i])
        ini_write_real("audio", audio_get_name(i), global.audio_default_volumes[i])
}
ini_close()
