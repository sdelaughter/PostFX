#macro POSTFX_VERSION 0.1.0

function PostFX_Quit() {
	if !variable_global_exists("PostFX") return;
	if instance_exists(global.PostFX) instance_destroy(global.PostFX);
	global.PostFX = undefined;
}

function PostFX_Init(_layer=-9999) {
	PostFX_Quit();
	if is_numeric(_layer) {
		global.PostFX = instance_create_depth(0, 0, _layer, oPostFX);	
	} else {
		global.PostFX = instance_create_layer(0, 0, _layer, oPostFX);	
	}
}

function PostFX_ActivateAll() {
	global.PostFX.activate_all();	
}

function PostFX_DeactivateAll() {
	global.PostFX.deactivate_all();	
}

function PostFX_SetShaders(_shaders, _activate=true) {
	global.PostFX.set_shaders(_shaders, _activate);	
}

function PostFX_GetShaders() {
	return global.PostFX.get_shaders();
}

function PostFX_Shader(_shader, _prep=undefined, _args=[]) constructor {
	active = true;
	shader = _shader;
	prep = _prep;
	args = [];
	if is_undefined(prep) prep = function(){}

	static toggle = function(_active=undefined) {
		if is_undefined(_active) active = !active;
		else active = _active;
	}
	
	array_push(global.PostFX.shaders, self);
}

