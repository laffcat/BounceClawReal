shader_type spatial;
render_mode unshaded;

uniform vec4 screen_color : hint_color;

void fragment() {
	ALBEDO = screen_color.rgb;
}