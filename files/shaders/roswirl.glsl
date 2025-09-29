//Number of turbulence waves
#define TURB_NUM 10.0
//Turbulence wave amplitude
#define TURB_AMP 0.7
//Turbulence wave speed
#define TURB_SPEED 0.3
//Turbulence frequency
#define TURB_FREQ 2.0
//Turbulence frequency multiplier
#define TURB_EXP 1.4

//Apply turbulence to coordinates
vec2 turbulence(vec2 p)
{
    //Turbulence starting scale
    float freq = TURB_FREQ;
    
    //Turbulence rotation matrix
    mat2 rot = mat2(0.6, -0.8, 0.8, 0.6);
    
    //Loop through turbulence octaves
    for(float i=0.0; i<TURB_NUM; i++)
    {
        //Scroll along the rotated y coordinate
        float phase = freq * (p * rot).y + TURB_SPEED*iTime + i;
        //Add a perpendicular sine wave offset
        p += TURB_AMP * rot[0] * sin(phase) / freq;
        
        //Rotate for the next octave
        rot *= mat2(0.6, -0.8, 0.8, 0.6);
        //Scale down for the next octave
        freq *= TURB_EXP;
    }
    
    return p;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    //Screen coordinates, centered and aspect corrected
    vec2 p = 2.0*(fragCoord.xy*2.0-iResolution.xy)/iResolution.y;
    
    //Apply Turbulence
    p = turbulence(p);
    
    //Subtle blue and yellow gradient
    vec3 col = 0.5*exp(0.4*p.x*vec3(-1,0,2)); //vec3 col = 0.5*exp(0.1*p.x*vec3(-1,0,2));
    //Vary brightness
    col /= dot(cos(p*3.),sin(-p.yx*3.*.618))+2.0;
    //Exponential tonemap
    col = 1.0 - exp(-col);
    fragColor = vec4(col,1);
}