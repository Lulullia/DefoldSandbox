varying mediump vec4 position;
varying mediump vec2 var_texcoord0;

uniform lowp vec4 ures;
uniform sampler2D iChannel0;

#define PIXEL_SIZE 2.0

//#define hair_vertical_offs 20.0
//#define hair_horizontal_offs -20.0

void main() {
	// old shader that would wave the tex
	//float t = utime.x * 0.05;
	
	//float uv_x_deform = cos(var_texcoord0.x);
	//vec2 offs_uv = vec2(cos(t * 2.0 + var_texcoord0.y * 10.0) + hair_horizontal_offs * ( var_texcoord0.x) * ( var_texcoord0.x) * 0.3, cos(t * 2.0 + var_texcoord0.x * 20.0) + hair_vertical_offs * (1.2 - var_texcoord0.x)) * 0.03 * (1.0 - var_texcoord0.x);

	//vec4 img = texture2D(texture_sampler, var_texcoord0 + vec2(offs_uv.x, offs_uv.y));

	//gl_FragColor = img;

	// pixelating effect
	vec2 uv = gl_FragCoord.xy / ures.xy;
	gl_FragColor = vec4(0);

	float dx = 1.0 / ures.x;
	float dy = 1.0 / ures.y;
	uv.x = (dx * PIXEL_SIZE) * floor(uv.x / (dx * PIXEL_SIZE));
	uv.y = (dy * PIXEL_SIZE) * floor(uv.y / (dy * PIXEL_SIZE));

	for (int i = 0; i < int(PIXEL_SIZE); i++)
	for (int j = 0; j < int(PIXEL_SIZE); j++)
	gl_FragColor += texture(iChannel0, vec2(uv.x + dx * float(i), uv.y + dy * float(j)));

	gl_FragColor /= pow(PIXEL_SIZE, 2.0);
}
