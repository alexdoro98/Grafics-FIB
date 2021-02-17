#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float A = 0.1;
uniform float f = 1; // expressada en Hz
uniform float time;

uniform float speed = 0.5;

const float PI = 3.141592;

void main()
{
	vec3 N = normalize(normalMatrix * normal);

    frontColor = vec4(color, 1.0);
    vtexCoord = texCoord;

	float st = speed * time;

	mat3 matR = mat3 (
		vec3 (cos(st), 	0, 	-sin(st)),
		vec3 (0, 		1, 	0		),
		vec3 (sin(st), 	0, 	cos(st)	)
		 );


	vec3 newV = matR* vertex;    

    gl_Position = modelViewProjectionMatrix * vec4(newV,1.);
}
