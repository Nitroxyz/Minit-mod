if (instance_number(DATA_MANAGER) > 1)
{
    instance_destroy()
    return;
}
global.saveid = -100
global.loadid = -100
global.isSaving = 0
global.isLoading = 0
global.respawn_mode = 0
depth = -10000000
global.controller_slot = 0
loaded_data = -1
