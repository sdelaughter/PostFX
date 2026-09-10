gpu_set_blendenable(false);

if array_length(shaders) < 1 {
	draw_surface_ext(application_surface, x, y, 1, 1, 0, c_white, 1);
} else {
	array_foreach(surf, function(_e, _i) {
		if !surface_exists(_e) surf[_i] = surface_create(w, h, surface_rgba8unorm);	
	});
	
	swap = 0;
	surface_set_target(surf[swap]);
	draw_surface_ext(application_surface, 0, 0, 1, 1, 0, c_white, 1);
	surface_reset_target();

	array_foreach(shaders, function(_e, _i) {
		if _e.active {
			surface_set_target(surf[1-swap]);
			shader_set(_e.shader);
			method_call(_e.prep, _e.args);
			draw_surface_ext(surf[swap], 0, 0, 1, 1, 0, c_white, 1);
			shader_reset();
			surface_reset_target();
			swap = 1-swap;
		}
	});
	
	draw_surface_ext(surf[swap], x, y, 1, 1, 0, c_white, 1);
}

gpu_set_blendenable(true);