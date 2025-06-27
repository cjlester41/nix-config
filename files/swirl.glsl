precision highp float;

uniform float time;
uniform vec2 resolution;
#define iTime time
#define iResolution resolution

void mainImage(out vec4 O, vec2 I)
{
    float i, z, d;
    for(O *= i; i++<5e1;)
    {
        vec3 p = z*normalize(vec3(I+I,0)-iResolution.xyy), v;
        p.z -= iTime;
        z += d = 1e-4+.5*length(max(v=cos(p)-sin(p).yzx,v.yzx*.2));
        O.rgb += (cos(p)+1.2)/d;
    }
    O /= O + 1e3;
}

void main(void)
{
    mainImage(gl_FragColor, gl_FragCoord.xy);
}