varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 blink_effect_trigger;

void main()
{
    lowp vec4 color_of_pixel = texture2D(texture_sampler, var_texcoord0.xy);

    if((blink_effect_trigger.r == 1.0) && (color_of_pixel.a != 0.0)){
        color_of_pixel = vec4(1.0, 1.0, 1.0, 1.0);
    }
    
    gl_FragColor = color_of_pixel;
}
