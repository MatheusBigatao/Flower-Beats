//
// Simple alpha test fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
    if (col.a < 0.5) discard;
    gl_FragColor = col;
}

