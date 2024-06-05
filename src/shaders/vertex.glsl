uniform float time;
uniform float uProgress;
uniform vec2 uResolution;
uniform vec2 uQuadSize;
uniform vec4 uCorners;
varying vec2 vTexSize;

varying vec2 vUv;

void main() {
    vUv = uv;
    vec4 defaultState = modelMatrix * vec4( position, 1.0 );
    vec4 fullScreenState = vec4( position, 1.0 );
    fullScreenState.x *= uResolution.x / uQuadSize.x;
    fullScreenState.y *= uResolution.y / uQuadSize.y;

    float cornersProgress = mix(
        mix(uCorners.z, uCorners.w, uv.x), 
        mix(uCorners.x, uCorners.y, uv.x),
        uv.y
        );

    /* Interpolate between defaultState and fullScreenState */
    vec4 finalState = mix(defaultState, fullScreenState, cornersProgress);

    vTexSize = mix(uQuadSize, uResolution, uProgress); // get size of the texture used in the quad in each step of the progress animation

    gl_Position = projectionMatrix * viewMatrix * finalState;
}