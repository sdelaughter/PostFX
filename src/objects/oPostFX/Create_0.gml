shaders = [];
surf = [-1, -1];
swap = 0;

free_surfaces = function() {
	array_foreach(surf, function(_e, _i) {
		if surface_exists(_e) surface_free(_e);
		surf[_i] = -1;
	});
}

update_position = function() {
	application_surface_draw_enable(true);
	position = application_get_position();
	application_surface_draw_enable(false);
	
	x = position[0];
	y = position[1];
	w = position[2];
	h = position[3];
	
	free_surfaces();
}

activate_all = function() {
	array_foreach(shaders, function(_e, _i) {
		_e.active = true;
	});
}

deactivate_all = function() {
	array_foreach(shaders, function(_e, _i) {
		_e.active = false;
	});
}

set_shaders = function(_shader_list, _activate=true) {
	shaders = _shader_list
	if _activate activate_all()
}

get_shaders = function() {return shaders}

update_position();