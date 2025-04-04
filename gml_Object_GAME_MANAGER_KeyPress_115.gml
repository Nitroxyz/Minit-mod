if (!debug_commands)
    return;
if (!global.decoder_discovered)
    global.decoder_discovered = 1
else if (!global.decoder_complete)
    global.decoder_complete = 1
else
{
    global.decoder_complete = 0
    global.decoder_discovered = 0
}
