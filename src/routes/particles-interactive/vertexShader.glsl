uniform float uTime;
varying vec2 vUv;
uniform sampler2D uPositions;
varying vec4 vColor;
uniform bool uRadar;
uniform float uRadarRadius;


void main() {
  vUv = uv;

  vec4 pos = texture2D(uPositions, uv);

  

  if(uRadar) {
    float angle = atan(pos.y, pos.x);
    float d = uRadarRadius + 0.45 * sin(angle + uTime * 2.8);
    vColor = vec4(vec3(0.5, d, d), d);
  } else {
    vColor = vec4(vec3(0.5, 0.5, 0.5), 1.0);
  }
  



  gl_Position = projectionMatrix * modelViewMatrix * vec4(pos.xyz, 1.0);
  gl_PointSize = 5.0 - length(pos.xyz) * 0.5;

}

