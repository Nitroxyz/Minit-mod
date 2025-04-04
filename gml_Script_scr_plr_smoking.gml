if (smoke_timer > 0)
{
    smoke_timer--
    if ((smoke_timer % 8) == 0)
    {
        if (irandom(2) == 0)
        {
            var st = instance_create((x + irandom(6) - 3), (y + irandom(6) - 3), obj_steam_cloud)
            st.hspd *= choose(1, -1)
            st.vspd = 0
            st.depth = depth + (choose(-1, 1))
        }
    }
}
else
{
    smoke_timer = smoke_timer_max
    st = instance_create((x + irandom(6) - 3), (y + irandom(6) - 3), obj_steam_cloud)
    st.hspd *= choose(1, -1)
    st.vspd = 0
    st.depth = depth + 1
}
