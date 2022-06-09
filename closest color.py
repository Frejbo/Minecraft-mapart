from math import sqrt

COLORS = (
    (181, 230, 99),
    (23, 186, 241),
    (99, 23, 153),
    (231, 99, 29),
)

def closest_color(rgb):
    r, g, b = rgb
    color_diffs = []
    for color in COLORS:
        cr, cg, cb = color
        color_diff = sqrt(abs(r - cr)**2 + abs(g - cg)**2 + abs(b - cb)**2)
        color_diffs.append((color_diff, color))
    return min(color_diffs)[1]