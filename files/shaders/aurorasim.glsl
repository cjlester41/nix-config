// ShaderToy的GLSL代码
#define NUM_LAYERS 2.

mat2 Rot(float a) {
    float s=sin(a), c=cos(a);
    return mat2(c, -s, s, c);
}

float Star(vec2 uv, float flare) {
	float d = length(uv);
    float m = .05/d;
    
    float rays = max(0., 1.-abs(uv.x*uv.y*1000.));
    m += rays*flare;
    uv *= Rot(3.1415/9.);
    rays = max(0., 1.-abs(uv.x*uv.y*1000.));
    //m += rays*.3*flare;
    m += rays * flare / (d);
    m *= smoothstep(.1, 0., d);
    return m;
}

float Hash21(vec2 p) {
    p = fract(p*vec2(123.34, 456.21));
    p += dot(p, p+45.32);
    return fract(p.x*p.y);
}

// vec3 StarLayer(vec2 uv) {
// 	vec3 col = vec3(0);
	
//     vec2 gv = fract(uv)-.5;
//     vec2 id = floor(uv);
    
//     for(int y=-1;y<=1;y++) {
//     	for(int x=-1;x<=1;x++) {
//             vec2 offs = vec2(x, y);
            
//     		float n = Hash21(id+offs); // random between 0 and 1
//             if (n < 0.8) continue;
//             float size = fract(n*345.32)*0.4;
            
//     		float star = Star(gv-offs-vec2(n, fract(n*34.))+.5, smoothstep(.9, 1., size)*.6);

//             vec3 color = sin(vec3(.2, .3, .9)*fract(n*2345.2)*123.2)*.5+.5;
//             color = color*vec3(1,.25,1.+size)+vec3(.2, .2, .1)*2.;
            
//             //star *= sin(iTime*3.+n*6.2831)*.5+1.;
//             star *= sin(iTime/4. * (1. + n) * 3. + n * 6.2831) * .1 + 0.1;
//             col += star*size*color;
//         }
//     }
//     return col;
// }
// 定义全局变量
#define TAU 6.28318530718

// 模拟的Perlin噪声函数
float noise(vec2 st) {
    return fract(sin(dot(st.xy, vec2(112.9898,78.233))) * 43758.5453123);
}

// Perlin噪声的hash函数
vec2 hash22(vec2 p) {
    p = p * mat2(129.1, 311.7, 269.5, 183.3);
    p = -1.0 + 2.0 * fract(sin(p) * 43758.5453123);
    return sin(p * TAU + iTime * 0.1);
}

// 创建Perlin噪声的函数
float perlinNoise(vec2 p) {
    vec2 pi = floor(p);
    vec2 pf = p - pi;
    vec2 w = pf * pf * (3.0 - 2.0 * pf);
    float f00 = dot(hash22(pi + vec2(0.0, 0.0)), pf - vec2(0.0, 0.0));
    float f01 = dot(hash22(pi + vec2(0.0, 1.0)), pf - vec2(0.0, 1.0));
    float f10 = dot(hash22(pi + vec2(1.0, 0.0)), pf - vec2(1.0, 0.0));
    float f11 = dot(hash22(pi + vec2(1.0, 1.0)), pf - vec2(1.0, 1.0));
    float xm1 = mix(f00, f10, w.x);
    float xm2 = mix(f01, f11, w.x);
    return mix(xm1, xm2, w.y);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv1 = (fragCoord-.5*iResolution.xy)/iResolution.y;
	vec2 M = (iMouse.xy-iResolution.xy*.5)/iResolution.y;
    
    float t = iTime*.002;
    
    uv1 += M*4.;
    
    uv1 *= Rot(t);
    vec3 col1 = vec3(0);
    
    for(float i=0.; i<1.; i+=1./NUM_LAYERS) {
    	float depth = fract(i+t);
        
        float scale = mix(20., .5, depth);
        float fade = depth*smoothstep(1., .9, depth);
        // col1 += StarLayer(uv1*scale+i*453.2-M)*fade;
    }
    
    col1 = pow(col1, vec3(.4545));	// gamma correction
    
    // fragColor = vec4(col,1.0);
    // 规范化坐标（从0到1）
    vec2 uv = fragCoord.xy / iResolution.xy;
    uv.x *= iResolution.x / iResolution.y; // 纵横比校正
    uv.y = uv.y*.6;
    // Perlin噪声，用来创建波纹
    float n = 0.0;
    n += 0.5000 * perlinNoise(uv * 1.0 - iTime * 0.2);
    n += 0.2500 * perlinNoise(uv * 2.0 - iTime * 0.3);
    n += 0.1250 * perlinNoise(uv * 4.0 - iTime * 0.5);
    n += 0.0625 * perlinNoise(uv * 8.0 - iTime * 0.8);

    // 北极光的强度
    float intensity = smoothstep(0.1, 0.9, uv.y);
    intensity *= sin(uv.y * 10.0 + n * 5.0 - 1. * 0.5) * 0.5 + 0.5;

    // 添加颜色渐变，从紫色到蓝绿色
    vec3 color1 = vec3(1,0,1);//vec3(0.21, 0.07, 0.82); // 紫色
    vec3 color2 = vec3(0,1,0);//vec3(0.0, 0.7, 0.7); // 蓝绿色

    // 使用垂直坐标(UV的y分量)来混合两种颜色
    vec3 color = mix(color1, color2, uv.x);
    
    // 应用噪声强度到颜色上
    color *= intensity;
    // color = mix(col1,color,uv.x)
    color += col1;
    // 输出颜色
    fragColor = vec4(color, 1.0);
}
