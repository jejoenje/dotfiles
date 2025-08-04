
import json
import colorsys

with open("/home/jejoenje/.cache/wal/colors.json") as f:
    data = json.load(f)

colors = data['colors']

def hex_to_rgb(hex_color):
    hex_color = hex_color.lstrip('#')
    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))

def rgb_to_hsl(rgb):
    r, g, b = [x / 255.0 for x in rgb]
    return colorsys.rgb_to_hls(r, g, b)  # returns (hue, lightness, saturation)

# Define lightness threshold (e.g., avoid colors too dark or too light)
LIGHTNESS_MIN = 0.3
LIGHTNESS_MAX = 0.7

best_color = None
best_score = -1  # composite score for saturation and lightness

print("Pywal palette colors (Saturation, Lightness):")
for name, hex_color in colors.items():
    rgb = hex_to_rgb(hex_color)
    h, l, s = rgb_to_hsl(rgb)
    print(f"{name}: {hex_color} - Saturation: {s:.3f}, Lightness: {l:.3f}")

    # Only consider colors within lightness range
    if LIGHTNESS_MIN < l < LIGHTNESS_MAX:
        # Score: multiply saturation and lightness difference from 0.5 for contrast balance
        score = s * abs(l - 0.5)
        if score > best_score:
            best_score = score
            best_color = (name, hex_color, s, l)

if best_color:
    name, hex_color, s, l = best_color
    print(f"\nBest accent color candidate: {name} {hex_color} with Saturation={s:.3f} and Lightness={l:.3f}")
else:
    print("\nNo suitable accent color found with the chosen lightness range.")
