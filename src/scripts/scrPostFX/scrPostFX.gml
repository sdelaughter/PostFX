#macro POST_FX_DEPTH -9999

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

function PostFX_Init() {
	global.PostFX = instance_create_depth(0, 0, POST_FX_DEPTH, oPostFX);	
}