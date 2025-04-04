script_execute(state)
if (alarm[0] == 0)
{
    if (hurt_hspd != 0)
    {
        hspd = hurt_hspd * 0.5
        hurt_hspd = 0
    }
    if (hurt_vspd != 0)
    {
        vspd = hurt_vspd * 0.5
        hurt_vspd = 0
    }
}
