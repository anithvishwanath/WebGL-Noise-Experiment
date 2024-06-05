uniform float time;
uniform float uProgress;
uniform vec2 uTextureSize;
uniform sampler2D uTexture;

varying vec2 vUv;
varying vec2 vTexSize;

/* Recalc and rescale UVs, Preserve aspect ratio */
vec2 getUV(vec2 uv, vec2 textureSize, vec2 quadSize) {
    vec2 tempUV = uv - vec2(0.5);

    float quadAspect = quadSize.x / quadSize.y;
    float textureAspect = textureSize.x / textureSize.y;

    if (quadAspect < textureAspect) {
        tempUV *= vec2(quadAspect / textureAspect, 1.0);
    } else {
        tempUV *= vec2(1.0, textureAspect / quadAspect);
    }

    tempUV += vec2(0.5);
    return tempUV;
}

void main() {
    vec2 scaledUV = getUV(vUv, uTextureSize, vTexSize);
    vec4 imgTex = texture(uTexture, scaledUV);
    // gl_FragColor = vec4( vUv, 0.0, 1.0 );
    gl_FragColor = imgTex;
}