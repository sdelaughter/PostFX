varying vec2 v_vTexcoord;
uniform float u_Mult;

void main() {
    vec4 color = texture2D(gm_BaseTexture, v_vTexcoord);
	float avg = (color.r + color.g + color.b) / 3.0;
    gl_FragColor = vec4(color.r*u_Mult, color.g*u_Mult, color.b*u_Mult, 1.0);
}