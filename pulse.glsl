#ifdef GL_ES
precision mediump float;
#endif

#extension GL_OES_standard_derivatives : enable

uniform float time;
uniform vec2 resolution;

void main() 
{
	vec2 p = gl_FragCoord.xy/resolution;
	vec3 col = vec3(0.,
sin(p.y*resolution.y/2.)*sin(p.x*resolution.x/2.)*sin(p.y+time),
sin(p.y*resolution.y/2.)*sin(p.x*resolution.x/2.)*sin(p.y+time)) 
		* 1.-distance(p, vec2(.5));
	gl_FragColor = vec4(col, 1.0);
}
