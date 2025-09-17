#ifdef GL_ES
precision highp float;
#endif

uniform vec2    resolution;
uniform float   time;
uniform sampler2D frame_buffer;

#define M_PI 3.1415926535897932384626433832795
#define speed 40.0
#define distance_to_center 300.0
#define fade 0.982

#define black vec4(0.0, 0.0, 0.0, 0.0)
#define white vec4(1.0, 1.0, 1.0, 1.0)
#define red vec4(1.0, 0.0, 0.0, 1.0)
#define green vec4(0.0, 1.0, 0.0, 1.0)

void main(void) {
    vec2 uv = gl_FragCoord.xy / resolution;
    vec4 previousColor = texture2D(frame_buffer, uv);
    
    float ratio = mod(time * speed / 1000.0, 1.0);
    vec2 center_point = resolution * 0.5;
    
    float ratioTau = ratio * M_PI * 2.0;
    
    vec2 new_pos1 = center_point + (vec2(sin(ratioTau * 5.0), cos(ratioTau * 3.0)) * distance_to_center);
    vec2 to_center1 = vec2(gl_FragCoord.x - new_pos1.x, gl_FragCoord.y - new_pos1.y);
    vec4 currentColor = mix(white, black, smoothstep(0.0, 15.0, length(to_center1)));
    
    vec2 new_pos2 = center_point + (vec2(-sin(ratioTau * 5.0), tan(ratioTau * 2.0)) * distance_to_center);
    vec2 to_center2 = vec2(gl_FragCoord.x - new_pos2.x, gl_FragCoord.y - new_pos2.y);
    currentColor = mix(red, currentColor, smoothstep(0.0, 15.0, length(to_center2)));
    
    vec2 new_pos3 = center_point + (vec2(tan(ratioTau), sin(ratioTau * 3.0)) * distance_to_center);
    vec2 to_center3 = vec2(gl_FragCoord.x - new_pos3.x, gl_FragCoord.y - new_pos3.y);
    currentColor = mix(green, currentColor, smoothstep(0.0, 15.0, length(to_center3)));
    
    
    gl_FragColor = (previousColor * fade * step(0.15, previousColor.a)) + currentColor;    
}