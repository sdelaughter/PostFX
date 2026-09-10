varying vec2 v_vTexcoord;

void main() {
    vec4 color = texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor = vec4(1.0-color.r, 1.0-color.g, 1.0-color.b, 1.0);
}