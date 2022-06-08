uniform sampler2D texture_lightMap;

void addLightMap() {
    vec4 rgbm = texture2D(texture_lightMap, $UV);
    dDiffuseLight = (8.0 * rgbm.a) * rgbm.rgb;
    dDiffuseLight *= dDiffuseLight;

    vec2 inBlack = vec2(29.0, 38.0) / 255.0;
    vec2 inWhite = vec2(97.0, 255.0) / 255.0;
    vec2 c = rgbm.a * 8.0 * rgbm.br;
    c = max(c - inBlack, vec2(0.0)) / (inWhite - inBlack);
    c = clamp(c, vec2(0.0), vec2(1.0));
    dAo = c.y * c.x;
}
