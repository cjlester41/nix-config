#define LOGO_W 850.0  
#define LOGO_H 180.0  

// Common Uniforms in various desktop/standalone GLSL editors
uniform float u_time; 
uniform vec4 iDate; 
uniform float u_unixTime;
uniform float sys_Time;

float segment(vec2 uv) {
    vec2 d = abs(uv) - vec2(0.5, 0.1);
    return smoothstep(0.1, 0.05, max(d.x, d.y));
}

float digit7(vec2 uv, int n) {
    if (n < 0 || n > 9) return 0.0;
    float s = 0.0;
    if (n!=1 && n!=4) s = max(s, segment(uv - vec2(0.0, 1.2)));
    if (n!=0 && n!=1 && n!=7) s = max(s, segment(uv - vec2(0.0, 0.0)));
    if (n!=1 && n!=4 && n!=7) s = max(s, segment(uv - vec2(0.0, -1.2)));
    if (n!=1 && n!=2 && n!=3 && n!=7) s = max(s, segment(uv.yx - vec2(0.6, -0.6)));
    if (n!=5 && n!=6) s = max(s, segment(uv.yx - vec2(0.6, 0.6)));
    if (n==0 || n==2 || n==6 || n==8) s = max(s, segment(uv.yx - vec2(-0.6, -0.6)));
    if (n!=2) s = max(s, segment(uv.yx - vec2(-0.6, 0.6)));
    return s;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    float testVal = 0.0;
    vec3 debugCol = vec3(0.0);

    // 1. Test u_time (Green)
    if (u_time > 1000.0) {
        testVal = u_time;
        debugCol = vec3(0.0, 1.0, 0.0);
    } 
    // 2. Test iDate (Blue) - Usually iDate.w is seconds since midnight
    else if (iDate.x > 2000.0) {
        testVal = iDate.w; 
        debugCol = vec3(0.0, 0.5, 1.0);
    }
    // 3. Test u_unixTime (Yellow)
    else if (u_unixTime > 1000.0) {
        testVal = u_unixTime;
        debugCol = vec3(1.0, 1.0, 0.0);
    }
    // 4. Test sys_Time (White)
    else if (sys_Time > 1000.0) {
        testVal = sys_Time;
        debugCol = vec3(1.0, 1.0, 1.0);
    }
    // 5. Fail (Red)
    else {
        fragColor = vec4(0.8, 0.1, 0.1, 1.0);
        return;
    }

    vec2 uv = (fragCoord - (iResolution.xy * 0.5)) * 0.06;
    float text = 0.0;
    
    // Show the first 10 digits of whichever variable was found
    for(int i = 0; i < 10; i++) {
        float p = pow(10.0, float(9 - i));
        int digit = int(mod(floor(testVal / p + 0.0001), 10.0));
        text = max(text, digit7(uv - vec2(-15.75 + float(i) * 3.5, 0.0), digit));
    }

    fragColor = vec4(debugCol * text, 1.0);
}