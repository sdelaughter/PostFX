PostFX_Init();

sh_inverse = new PostFX_Shader(shPostFX_Inverse);
sh_gray = new PostFX_Shader(shPostFX_Gray);
sh_mult = new PostFX_Shader(
	shPostFX_Mult,
	function(_uniform, _multiplier) {
		shader_set_uniform_f(_uniform, _multiplier);
	}
);
with sh_mult {
	multiplier = 1.0;
	multiplier_min = 0.0;
	multiplier_max = 2.0;
	multiplier_step = 0.1;
	u_Mult = shader_get_uniform(shPostFX_Mult, "u_Mult");
	args = [u_Mult, multiplier];
}

PostFX_SetShaders([
//Re-order to put mult first so low-mult -> inverse = white
	sh_mult,
	sh_inverse,
	sh_gray
], false);

PostFX_DeactivateAll();

controls_string = @"
Mouse Left: Inverse
Mouse Right: Grayscale
Scrollwheel: Multiplier
F5: Debug Overlay
F11: Fullscreen
"