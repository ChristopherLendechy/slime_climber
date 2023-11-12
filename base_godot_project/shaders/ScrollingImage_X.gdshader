shader_type canvas_item;
// from tutorial: https://www.youtube.com/watch?v=A0Z6KchisAw&list=PLb9xOik0gj6q9CnHo3S0VAHJHZOfOfdXT&index=3 

uniform float scroll_speed;
uniform bool positive;
void fragment() {
	// Place fragment code here.
	vec2 u = UV;
	if (positive) {
		u.x += scroll_speed*TIME;
	}
	else {
		u.x -= scroll_speed*TIME;
	}
	vec4 col = texture(TEXTURE,u);
	COLOR = col;
}
