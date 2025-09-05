// Fork of "Google TurboColormap color study" by morisil. https://shadertoy.com/view/Wd3BWr
// 2020-11-07 12:07:43

// Fork of "Google TurboColormap grad. study" by morisil. https://shadertoy.com/view/3dcfDn
// 2020-11-07 12:04:55

// Fork of "spectral_zucconi6 gradient study" by morisil. https://shadertoy.com/view/wsdBR7
// 2020-11-07 10:50:52

// Fork of "spectral_zucconi6 color study" by morisil. https://shadertoy.com/view/tddBR7
// 2020-11-07 01:33:41

float dim(float x) {
	return -4. * pow(x - .5, 2.) + 1.;    
}

vec3 dimmedTurbo(float x) {
    return TurboColormap(x) * dim(x);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
	vec3 color = mix(
        dimmedTurbo(mod(uv.x - iTime * .04, 1.)),
        dimmedTurbo(1. - mod(uv.x + iTime * .15, 1.)),
        uv.y
    );
    fragColor = vec4(color, 1.);
}
