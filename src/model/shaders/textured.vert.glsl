precision highp float;

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform mat4 bones[50];
uniform mat4 rotationMatrix;

attribute vec3 position;
attribute vec3 normal;
attribute vec2 uv;
attribute float color;
attribute float boneIndex;

varying vec3 vPosition;
varying vec3 vNormal;
varying float vColor;
varying vec2 vUv;

void main() {
    gl_Position = projectionMatrix * modelViewMatrix * bones[int(boneIndex)] * vec4(position, 1.0);
    vPosition = position;
    vec4 newNormal = rotationMatrix * bones[int(boneIndex)] * vec4(normal, 1.0);
    vNormal = newNormal.xyz;
    vColor = color;
    vUv = uv;
}