varying vec2 v_vTexcoord;

void main() {
    vec4 color = texture2D(gm_BaseTexture, v_vTexcoord);
	float avg = (color.r + color.g + color.b) / 3.0;
    gl_FragColor = vec4(avg, avg, avg, 1.0);
}