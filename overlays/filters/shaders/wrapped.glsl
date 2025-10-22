#version 300 es
@builtin_ext@
@builtin@

precision mediump float;

uniform sampler2D in_tex;
out vec4 out_color;
in mediump vec2 uvpos;
uniform float progress;
uniform vec4 margins;

void main()
{
    vec4 c = get_pixel(uvpos);
    vec2 uv = uvpos;
    vec4 m = margins;
    vec4 oc = c;
    vec4 shadow_color = vec4(0.0, 0.0, 0.2, 0.5);
    ivec2 size = textureSize(in_tex, 0);
    vec2 texelSize = 1.0 / vec2(size);
    m.x *= texelSize.x; // left
    m.y *= texelSize.y; // top
    m.z *= texelSize.x; // right
    m.w *= texelSize.y; // bottom
    vec4 border_color = vec4(0.1, 0.1, 0.1, 1.0);
    float border_size = 4.0;
    float corner_radius = 15.0;
    float shadow_radius = 12.0;
    float d;
    float diffuse = 1.0 / max(shadow_radius / 2.0, 1.0);
    
    // Sides
    if ((uvpos.x <= (texelSize.x * border_size) || uvpos.x >= 1.0 - (texelSize.x * border_size)) && uvpos.y > (texelSize.y * corner_radius) && uvpos.y < 1.0 - (texelSize.y * corner_radius) ||
        ((uvpos.y <= (texelSize.y * border_size) || uvpos.y >= 1.0 - (texelSize.y * border_size)) && uvpos.x > (texelSize.x * corner_radius) && uvpos.x < 1.0 - (texelSize.x * corner_radius)))
    {
        c = border_color;
    } else
    // Corners
    if (uvpos.x <= (texelSize.x * corner_radius) && uvpos.y <= (texelSize.y * corner_radius))
    {
        // Bottom Left
        d = distance(vec2(corner_radius), uvpos * vec2(size));
        if (d - corner_radius <= 0.0 && d - (corner_radius - border_size) >= 0.0)
        {
            c = border_color;
        }
    } else if (uvpos.x >= 1.0 - (texelSize.x * corner_radius) && uvpos.y <= (texelSize.y * corner_radius))
    {
        // Bottom Right
        d = distance(vec2(float(size.x) - corner_radius, corner_radius), uvpos * vec2(size));
        if (d - corner_radius <= 0.0 && d - (corner_radius - border_size) >= 0.0)
        {
            c = border_color;
        }
    } else if (uvpos.x <= (texelSize.x * corner_radius) && uvpos.y >= 1.0 - (texelSize.y * corner_radius))
    {
        // Top Left
        d = distance(vec2(corner_radius, float(size.y) - corner_radius), uvpos * vec2(size));
        if (d - corner_radius <= 0.0 && d - (corner_radius - border_size) >= 0.0)
        {
            c = border_color;
        }
    } else if (uvpos.x >= 1.0 - (texelSize.x * corner_radius) && uvpos.y >= 1.0 - (texelSize.y * corner_radius))
    {
        // Top Right
        d = distance(vec2(vec2(size) - corner_radius), uvpos * vec2(size));
        if (d - corner_radius <= 0.0 && d - (corner_radius - border_size) >= 0.0)
        {
            c = border_color;
        }
    }
    out_color = mix(oc, c, progress);
}