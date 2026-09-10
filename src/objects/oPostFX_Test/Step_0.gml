if keyboard_check_pressed(vk_f5) {
	show_debug_overlay(!is_debug_overlay_open())
}

if keyboard_check_pressed(vk_f11) {
	window_set_fullscreen(!window_get_fullscreen())	
}

sh_inverse.active = mouse_check_button(mb_left);
sh_gray.active = mouse_check_button(mb_right);

with sh_mult {
	if mouse_wheel_up() {
		multiplier += multiplier_step;
	} else if mouse_wheel_down() {
		multiplier -= multiplier_step;
	}
	multiplier = clamp(multiplier, multiplier_min, multiplier_max);
	args[1] = multiplier;
	active = multiplier != 1.0;
}