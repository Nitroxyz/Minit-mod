var i = 0
for (i = 0; i < array_length_1d(prop_button); i++)
{
    if (prop_button[i] != self)
    {
        with (prop_button[i])
            instance_destroy()
    }
}
