for (var i = 0; i < ds_list_size(slices); i++)
    ds_list_replace(ds_list_find_value(slices, i), 0, wrap(((ds_list_find_value(ds_list_find_value(slices, i), 0)) + (ds_list_find_value(ds_list_find_value(slices, i), 0))), 0, xmax))
