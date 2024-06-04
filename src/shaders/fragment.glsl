uniform float time;
varying float pulse;
uniform sampler2D uTexture;

varying vec2 vUv;

void main() {
    // vec4 texImg = texture( uTexture, vUv ); // adds texture to the shader
    vec4 texImg = texture( uTexture, vUv + 0.01*sin(vUv * 20.0 + time) ); //distort texture (UV's)

    //distort texture
    float sinePulse = (1.0 + sin(vUv.x * 50.0 + time)) * 0.5;

    // gl_FragColor = vec4( vUv, 0.0, 1.0 );
    // gl_FragColor = vec4( sinePulse, 0.0, 0.0, 1.0 );
    gl_FragColor = texImg;
}