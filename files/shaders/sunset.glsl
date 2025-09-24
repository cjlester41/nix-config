
#define BRIGHTNESS 1.0
#define COLOR_BASE 1.5
#define COLOR_SPEED 0.5
#define RGB vec3(0.0, 1.0, 2.0)
#define COLOR_WAVE 14.0
#define COLOR_DOT vec3(1,-1,0)

#define WAVE_STEPS 8.0
#define WAVE_FREQ 5.0
#define WAVE_AMP 0.6
#define WAVE_EXP 1.8
#define WAVE_VELOCITY vec3(0.2)

#define PASSTHROUGH 0.2
#define SOFTNESS 0.005
#define STEPS 100.0
#define SKY 10.0
#define FOV 1.0

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    float z = 0.0;
    float d = 0.0;
    float s = 0.0;
    
    vec3 dir = normalize( vec3(2.0*fragCoord - iResolution.xy, - FOV * iResolution.y));    
    vec3 col = vec3(0);
    
    for(float i = 0.0; i<STEPS; i++)
    {
        vec3 p = z * dir;        
        for(float j = 0.0, f = WAVE_FREQ; j<WAVE_STEPS; j++, f *= WAVE_EXP)
            
            p += WAVE_AMP*sin(p*f - WAVE_VELOCITY*iTime).yzx / f;
            
        s = 0.3 - abs(p.y);
        d = SOFTNESS + max(s, -s*PASSTHROUGH) / 4.0;
        z += d;
        float phase = COLOR_WAVE * s + dot(p,COLOR_DOT) + COLOR_SPEED*iTime;
        col += (cos(phase - RGB) + COLOR_BASE) * exp(s*SKY) / d;
    }
    col *= SOFTNESS / STEPS * BRIGHTNESS;
    fragColor = vec4(tanh(col * col), 1.0);
}
