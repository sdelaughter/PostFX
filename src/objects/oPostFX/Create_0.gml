shaders = [];
surf = [-1, -1];
swap = 0;

update_position = function() {
	application_surface_draw_enable(true);
	position = application_get_position();
	application_surface_draw_enable(false);
	
	x = position[0];
	y = position[1];
	w = position[2];
	h = position[3];
	
	array_foreach(surf, function(_e, _i) {
		if surface_exists(_e) surface_free(_e);
		surf[_i] = -1;
	});
}

update_position();