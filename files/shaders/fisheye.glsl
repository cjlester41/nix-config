// Niri window/output shader
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    // Niri provides the resolution via a global or inferred from coords
    // Here we normalize based on the standard 0.0 to 1.0 range
    vec2 uv = fragCoord; 
    vec2 p = uv - 0.5;
    
    // Correct for screen aspect ratio
    // If Niri doesn't provide iResolution, you may need to hardcode your aspect 
    // (e.g., 1920.0/1080.0) or use Niri's internal uniforms.
    // Assuming 16:9 for this example:
    float aspect = 1.777; 
    p.x *= aspect;
    
    float r = length(p);
    float phi = atan(p.y, p.x);
    
    // Fisheye Math
    float strength = 1.1;
    float distortion = atan(r * strength) / 1.570796;
    
    vec2 distortedUV;
    distortedUV.x = (distortion * cos(phi) / aspect) + 0.5;
    distortedUV.y = (distortion * sin(phi)) + 0.5;

    // Sample the live screen/window texture
    // 'iChannel0' is usually what Niri maps the input to
    vec3 col = texture(iChannel0, distortedUV).rgb;
    
    // Vignette
    col *= smoothstep(0.5, 0.48, r);

    fragColor = vec4(col, 1.0);
}