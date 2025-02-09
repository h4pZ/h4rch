// Constants for better readability and maintenance
const vec2 REFERENCE_RESOLUTION = vec2(2560.0, 1440.0);
const vec2 PATTERN_SCALE = vec2(60.0, 60.0);
const float NOISE_TIME_SCALE = 0.03;
const float PATTERN_MOVEMENT_SPEED = 0.08;
const vec2 RECT_SCALE = vec2(2.0);
const vec2 RECT_HALF_SIZE = vec2(1.0);

// Color palette
const vec3 COLOR_DARK = vec3(0.0);
const vec3 COLOR_MID = vec3(0.07898);
const vec3 COLOR_LIGHT = vec3(0.089184);

// Simplex noise helper functions
vec3 mod289(vec3 x) { return x - floor(x * (1.0 / 289.0)) * 289.0; }
vec4 mod289(vec4 x) { return x - floor(x * (1.0 / 289.0)) * 289.0; }
vec4 permute(vec4 x) { return mod289(((x * 34.0) + 10.0) * x); }
vec4 taylorInvSqrt(vec4 r) { return 1.79284291400159 - 0.85373472095314 * r; }

// 3D Simplex noise implementation
float snoise(vec3 v) {
    const vec2 C = vec2(1.0 / 6.0, 1.0 / 3.0);
    const vec4 D = vec4(0.0, 0.5, 1.0, 2.0);

    // First corner
    vec3 i = floor(v + dot(v, C.yyy));
    vec3 x0 = v - i + dot(i, C.xxx);

    // Other corners
    vec3 g = step(x0.yzx, x0.xyz);
    vec3 l = 1.0 - g;
    vec3 i1 = min(g.xyz, l.zxy);
    vec3 i2 = max(g.xyz, l.zxy);

    vec3 x1 = x0 - i1 + C.xxx;
    vec3 x2 = x0 - i2 + C.yyy;
    vec3 x3 = x0 - D.yyy;

    // Permutations
    i = mod289(i);
    vec4 p = permute(permute(permute(
        i.z + vec4(0.0, i1.z, i2.z, 1.0))
        + i.y + vec4(0.0, i1.y, i2.y, 1.0))
        + i.x + vec4(0.0, i1.x, i2.x, 1.0));

    // Gradients: 7x7 points over a square, mapped onto an octahedron
    float n_ = 0.142857142857;
    vec3 ns = n_ * D.wyz - D.xzx;

    vec4 j = p - 49.0 * floor(p * ns.z * ns.z);

    vec4 x_ = floor(j * ns.z);
    vec4 y_ = floor(j - 7.0 * x_);

    vec4 x = x_ * ns.x + ns.yyyy;
    vec4 y = y_ * ns.x + ns.yyyy;
    vec4 h = 1.0 - abs(x) - abs(y);

    vec4 b0 = vec4(x.xy, y.xy);
    vec4 b1 = vec4(x.zw, y.zw);

    vec4 s0 = floor(b0) * 2.0 + 1.0;
    vec4 s1 = floor(b1) * 2.0 + 1.0;
    vec4 sh = -step(h, vec4(0.0));

    vec4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
    vec4 a1 = b1.xzyw + s1.xzyw * sh.zzww;

    // Normalise gradients
    vec3 p0 = vec3(a0.xy, h.x);
    vec3 p1 = vec3(a0.zw, h.y);
    vec3 p2 = vec3(a1.xy, h.z);
    vec3 p3 = vec3(a1.zw, h.w);

    vec4 norm = taylorInvSqrt(vec4(dot(p0, p0), dot(p1, p1), dot(p2, p2), dot(p3, p3)));
    p0 *= norm.x;
    p1 *= norm.y;
    p2 *= norm.z;
    p3 *= norm.w;

    // Mix final noise value
    vec4 m = max(0.5 - vec4(dot(x0, x0), dot(x1, x1), dot(x2, x2), dot(x3, x3)), 0.0);
    m = m * m;
    return 105.0 * dot(m * m, vec4(dot(p0, x0), dot(p1, x1), dot(p2, x2), dot(p3, x3)));
}

// 2D noise function for pattern generation
float noise2D(vec2 uv) {
    uvec2 pos = uvec2(floor(uv * 1000.));
    return float((pos.x * 68657387u ^ pos.y * 361524851u + pos.x) % 890129u) * (1.0 / 890128.0);
}

// Signed distance function for rounded rectangles
float roundRectSDF(vec2 center, vec2 size, float radius) {
    return length(max(abs(center) - size + radius, 0.0)) - radius;
}

// Calculate layered noise
float calculateLayeredNoise(vec2 puv, float time) {
    float noise = snoise(vec3(puv, time));
    noise += snoise(vec3(puv * 1.1, time + 0.5)) + 0.1;
    noise += snoise(vec3(puv * 2.0, time + 0.8));
    return pow(noise, 2.0);
}

// Calculate pattern UV coordinates
vec2 calculatePatternUV(vec2 uv, float ratio, float time) {
    vec2 puv = floor(uv * PATTERN_SCALE * vec2(1.0, ratio)) / PATTERN_SCALE;
    return puv + (smoothstep(0.0, 0.7, noise2D(puv)) - 0.5) * 0.05 
                + vec2(0.0, time * PATTERN_MOVEMENT_SPEED);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    // Calculate scaled UV coordinates
    vec2 scaleFactor = REFERENCE_RESOLUTION / iResolution.xy;
    vec2 uv = fragCoord / REFERENCE_RESOLUTION;
    float ratio = REFERENCE_RESOLUTION.y / REFERENCE_RESOLUTION.x;
    
    // Get base texture color
    vec4 baseColor = texture(iChannel0, fragCoord / iResolution.xy);
    
    // Calculate pattern coordinates
    float fw = max(fwidth(uv.x), fwidth(uv.y)) * length(scaleFactor);
    vec2 puv = calculatePatternUV(uv, ratio, iTime);
    
    // Calculate pattern geometry
    uv = fract(vec2(uv.x, uv.y * ratio) * 10.0);
    float d1 = roundRectSDF((RECT_SCALE + 0.01) * (uv - 0.5), RECT_HALF_SIZE, 0.075);
    float d2 = roundRectSDF((RECT_SCALE + 0.065) * (fract(uv * 6.0) - 0.5), RECT_HALF_SIZE, 0.2);
    
    // Calculate noise and color
    float noise = calculateLayeredNoise(puv, iTime * NOISE_TIME_SCALE);
    
    vec3 fcol = mix(
        mix(
            mix(COLOR_DARK, COLOR_MID, smoothstep(0.0, 0.3, noise)),
            COLOR_DARK,
            smoothstep(0.0, 0.5, noise)
        ),
        COLOR_LIGHT,
        smoothstep(0.0, 1.0, noise)
    );
    
    // Compose final color
    fragColor = vec4(
        baseColor.rgb + mix(COLOR_LIGHT, fcol, 
            smoothstep(fw, -fw, d1) * smoothstep(fw, -fw, d2)),
        baseColor.a
    );
}
