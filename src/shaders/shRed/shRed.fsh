// sampler2D u_input; // implicitly passed in GameMaker
varying vec2 v_vTexcoord;

void main() {
    float red = texture2D(gm_BaseTexture, v_vTexcoord).r;
    gl_FragColor = vec4(red, 0.0, 0.0, 1.0);
}