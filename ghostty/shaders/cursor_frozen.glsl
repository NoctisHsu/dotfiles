float getSdfRectangle(in vec2 p, in vec2 xy, in vec2 b)
{
    vec2 d = abs(p - xy) - b;
    return length(max(d, 0.0)) + min(max(d.x, d.y), 0.0);
}

float seg(in vec2 p, in vec2 a, in vec2 b, inout float s, float d) {
    vec2 e = b - a;
    vec2 w = p - a;
    float ee = dot(e, e);
    vec2 proj = a + e * clamp(dot(w, e) / ee, 0.0, 1.0);
    vec2 diff = p - proj;
    d = min(d, dot(diff, diff));

    float c0 = step(0.0, w.y);
    float c1 = 1.0 - step(0.0, p.y - b.y);
    float c2 = 1.0 - step(0.0, e.x * w.y - e.y * w.x);
    float allCond = c0 * c1 * c2;
    float noneCond = (1.0 - c0) * (1.0 - c1) * (1.0 - c2);
    s *= mix(1.0, -1.0, step(0.5, allCond + noneCond));
    return d;
}

float getSdfParallelogram(in vec2 p, in vec2 v0, in vec2 v1, in vec2 v2, in vec2 v3) {
    float s = 1.0;
    float d = dot(p - v0, p - v0);

    d = seg(p, v0, v3, s, d);
    d = seg(p, v1, v0, s, d);
    d = seg(p, v2, v1, s, d);
    d = seg(p, v3, v2, s, d);

    return s * sqrt(d);
}

float determineStartVertexFactor(vec2 c, vec2 p) {
    float condition1 = step(p.x, c.x) * step(c.y, p.y);
    float condition2 = step(c.x, p.x) * step(p.y, c.y);
    return 1.0 - max(condition1, condition2);
}

const vec4 TRAIL_COLOR = vec4(0.82, 0.84, 0.88, 1.0);
const vec4 TRAIL_COLOR_ACCENT = vec4(0.62, 0.64, 0.68, 1.0);
const float DURATION = 0.3;

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = fragCoord.xy / iResolution.xy;
    fragColor = texture(iChannel0, uv);

    // Early exit: animation finished, no work needed
    float progress = clamp((iTime - iTimeCursorChange) / DURATION, 0.0, 1.0);
    if (progress >= 1.0) return;

    float scale = 2.0 / iResolution.y;
    vec2 normOffset = iResolution.xy / iResolution.y;

    vec2 vu = fragCoord * scale - normOffset;

    vec2 curPos = iCurrentCursor.xy * scale - normOffset;
    vec2 curSize = iCurrentCursor.zw * scale;
    vec2 prevPos = iPreviousCursor.xy * scale - normOffset;
    vec2 prevSize = iPreviousCursor.zw * scale;

    // Spatial early exit: skip pixels far from cursor and trail
    vec2 bboxMin = min(curPos - curSize, prevPos - prevSize) - vec2(0.02);
    vec2 bboxMax = max(curPos + curSize, prevPos + prevSize) + vec2(0.02);
    if (vu.x < bboxMin.x || vu.x > bboxMax.x || vu.y < bboxMin.y || vu.y > bboxMax.y) return;

    vec2 offsetFactor = vec2(-0.5, 0.5);
    vec4 currentCursor = vec4(curPos, curSize);
    vec4 previousCursor = vec4(prevPos, prevSize);

    vec2 centerCC = curPos + vec2(curSize.x * 0.5, -curSize.y * 0.5);
    vec2 centerCP = prevPos + vec2(prevSize.x * 0.5, -prevSize.y * 0.5);

    float vertexFactor = determineStartVertexFactor(currentCursor.xy, previousCursor.xy);
    float invertedVertexFactor = 1.0 - vertexFactor;

    vec2 v0 = vec2(curPos.x + curSize.x * vertexFactor, curPos.y - curSize.y);
    vec2 v1 = vec2(curPos.x + curSize.x * invertedVertexFactor, curPos.y);
    vec2 v2 = vec2(prevPos.x + curSize.x * invertedVertexFactor, prevPos.y);
    vec2 v3 = vec2(prevPos.x + curSize.x * vertexFactor, prevPos.y - prevSize.y);

    float sdfCurrentCursor = getSdfRectangle(vu, curPos - (curSize * offsetFactor), curSize * 0.5);
    float sdfTrail = getSdfParallelogram(vu, v0, v1, v2, v3);

    float easedProgress = pow(1.0 - progress, 3.0);
    float lineLength = distance(centerCC, centerCP);

    float mod = .003;
    vec4 trail = mix(TRAIL_COLOR_ACCENT, fragColor, 1. - smoothstep(0., sdfTrail + mod, 0.003));
    trail = mix(TRAIL_COLOR, trail, 1. - smoothstep(0., sdfTrail + mod, 0.002));
    trail = mix(trail, TRAIL_COLOR, step(sdfTrail + mod, 0.));
    trail = mix(TRAIL_COLOR_ACCENT, trail, 1. - smoothstep(0., sdfCurrentCursor + .001, 0.002));
    trail = mix(TRAIL_COLOR, trail, 1. - smoothstep(0., sdfCurrentCursor + .001, 0.002));
    fragColor = mix(trail, fragColor, 1. - smoothstep(0., sdfCurrentCursor, easedProgress * lineLength));
}
