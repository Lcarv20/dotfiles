#version 150
in vec2 uv;
out vec4 fragColor;
uniform vec4 iChannel0;

void main() {
    // This is the simplest shader.
    // It just outputs the cursor color.
    fragColor = iChannel0;
}
