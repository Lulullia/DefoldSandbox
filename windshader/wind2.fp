varying mediump vec4 position;
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 utime;
uniform vec4 ures;

// Settings
float speed = 0.3; // Speed multiplier
float cycles = 30.0; // Factor for how many full cycles per unit; lower is less wavy
float amplitude = 15.0; // The "height" of the waves; lower is higher
float constraint = 0.2; // Factor for how much the top should be constrained
float angle = 0.0; // Tilt of the waving

void main()
{
	vec2 uv = var_texcoord0;

	uv /= ures.xy;

	// Calculate amplitude
	float calc_amplitude = max(0.0, amplitude / ((1.0 - uv.y) - constraint));

	// Only wave if amplitude is not 0
	if (calc_amplitude != 0.0) {
		uv.x += (sin(uv.y * cycles + utime.x * speed) / calc_amplitude) + (uv.y * angle);
	} else {
		// Even if not waving, it needs to be angled!
		uv.x += uv.y * angle;
	}

	uv = var_texcoord0/ures.xy;

	gl_FragColor = texture2D(texture_sampler, uv);
}
