// Copyright Kazimierz Pogoda, 2022 - https://xemantic.com/
// I am the sole copyright owner of this Work.
// You cannot host, display, distribute or share this Work in any form,
// including physical and digital. You cannot use this Work in any
// commercial or non-commercial product, website or project. You cannot
// sell this Work and you cannot mint an NFTs of it.
// I share this Work for educational purposes, and you can link to it,
// through an URL, proper attribution and unmodified screenshot, as part
// of your educational material. If these conditions are too restrictive
// please contact me and we'll definitely work it out.

// copyright statement borrowed from Inigo Quilez

/*
Descripition copied from fx(hash), where this system is mintable in unique
iterations:

https://www.fxhash.xyz/generative/slug/the-mathematics-of-perception

This system, called The Mathematics of Perception, emerged from a
series of thought experiments. Our xemantic collective applies philosophy
to facts about the world. The physics behind sensory experience is already
deeply researched. But what makes certain experiences evoke certain
feelings and affectionate states in the broader sense? I want to evoke
emotions with algorithms. This research is needed for bigger immersive
installations, using certain aesthetics for telling various narratives.
However I am not a video artist, I don't cut and transform existing frames.
I synthesize them with equations. The process can be described as
sculpting in light and time with math.

Generating video-experience, which is perceptually pleasant, usually
involves 3D modeling. There is no 3D per se involved in this system, not
even so called ray marching. It represents an optical illusion of infinitive
space coded as a single GLSL fragment shader.

It started with a sketch - how to show an unlimited grid of lights,
overlapping each other in perspective and movement.

Then I added depth of field simulation, to blur the light discs depending
on perceived distance. Usually generating things "out of focus" is surprisingly
expensive to compute. Here simplicity of mathematical analytic formula
came very handy without extra cost.

After depth of field, the simulation of connected chromatic aberration
followed. This alone is the actual source of color in this system.

By accident I discovered that I can also introduce simulated refractions.
It's hard to believe how much this simple addition improved the experience.
The "refraction" is not fully following the physics of perception. It is
"impossible" on purpose, still believable optical illusion. If you feel
oniric and escheresque, probably it's thanks to this single line of code.

The waves are important as well. Usually I use trigonometric functions for
expressing motion. They have this ability of producing oscillation cycles
we observe everywhere in the physical world. From rocking in our cradles,
later observing branches of a tree when the wind blows, through experience
of music, which is unconscious perception of ratios between waves, we relate
to this kind of swinging movement. This is how we dance.

Each minted variant of this system will have different base parameters and
motion, providing similar, but unique experience. I hope that due to
differences, each of them might evoke slightly different emotions.
Therefore this drop is to please your senses, but also to continue with
our experiment. After minting each variant please write us back how you
feel out it.

Kazik Pogoda
the mother of xemantic
 */

const int ITERATIONS = 15;
const float PI = 3.14159265359;

mat2 rotate2d(in float angle){
  return mat2(cos(angle),-sin(angle), sin(angle),cos(angle));
}

float shape(in vec2 st, in float size, in float blur) {
  vec2 modSt = mod(st, 1.) * 2. - 1.;
  float dist = length(modSt);
  return smoothstep(size + blur, size - blur, dist);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
  vec2 st = (2.* fragCoord - iResolution.xy) / min(iResolution.x, iResolution.y);

  vec3 color = vec3(0);
  float luma = .5;
  vec2 layerSt = st * (cos(iTime * .115) * .6 + .8);
  layerSt *= rotate2d(cos(iTime * .023 + 5.) * PI + PI);

  for (int i = 0; i < ITERATIONS; i++) {
    vec2 gridSt = layerSt + vec2(cos(iTime * .013) * 6. + 6., cos(iTime * .011) * 6. + 6.);
    layerSt *= rotate2d(-cos(iTime * .0012) * PI + 1.);

    float depth = (float(i) + .5) / float(ITERATIONS);
    float focusDepth = depth - (cos(iTime * .73) * .5 + .5) * .8 + .1;
    float blur = .05 + focusDepth * focusDepth * .4;

    float chromaticAberration = cos(iTime * .15) * .2 + .2;
    float shapeSize = + .3 + cos(iTime * .074) * .2;
    vec3 shapeColor = vec3(
      shape(gridSt - st * chromaticAberration * blur, shapeSize, blur),
      shape(gridSt, shapeSize, blur),
      shape(gridSt + st * chromaticAberration * blur, shapeSize, blur)
    ) * luma;

    layerSt += st * shape(gridSt, shapeSize, .5) * cos(iTime * .081) * .6;
    layerSt *= cos(iTime * .23) * .05 + 1.1;
    color += shapeColor;
    luma *= .85;
  }
  fragColor = vec4(color, 1.0);
}
