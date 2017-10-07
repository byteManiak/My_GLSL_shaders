/** POWER CORE **/
// by byteManiak
// contact info: bytemaniak 98 at gmail dot com
#ifdef GL_ES
precision mediump float;
#endif

#extension GL_OES_standard_derivatives : enable

uniform float time;
uniform vec2 resolution;

float f(float x)
{ /** you can change the plot function here **/
	return .3 * sin(x/cos(mod(cos(time)/50.+150.,190./pow(x, 4.))))
		* cos(x*mod(cos(time)+150.,pow(x, 4.)))
		* exp(x/mod(cos(time)+150., x*x*x*x*x));
}

bool cmp(float a, float b, float epsilon)
{ return (abs(a-b))<epsilon; }

void main( void ) {

	vec2 p = gl_FragCoord.xy / resolution.xy * 8.0 - 4.;
	vec2 plot = gl_FragCoord.xy / resolution.xy;

	float size = mix(0.25, 0.3, sin(time*5.));

	if(cmp((p.x+p.y)/2., f((p.y-p.x)/2.), size))
		gl_FragColor += vec4(1.);

	gl_FragColor *= resolution.x/p.x / resolution.y*p.y > .0 ? 
vec4(0.0, 1.0, 0.0, 1.0) : vec4(0.0, 1.0, 1.0, 1.0);

}
