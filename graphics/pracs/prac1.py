from numpy import ndarray

def drawLineDDA(pixels : ndarray[ndarray], start_pos : tuple[int, int], end_pos : tuple[int, int]) -> None:
    x1, y1 = start_pos
    x2, y2 = end_pos
    
    min_x = min(x1, x2)
    max_x = max(x1, x2)
    min_y = min(y1, y2)
    max_y = max(y1, y2)

    x = min_x
    y = min_y

    dy = y2-y1
    dx = x2-x1

    m = dy/dx if dx != 0 else float('inf')

    if 0 <= x <= pixels.shape[1] and 0 <= y <= pixels.shape[0]:
        pixels[-(y+1)][x] = 1
    
    while True:
        if m <= 1:
            x += 1
            y += m
        else:
            x += 1/m
            y += 1

        if x > max_x or y > max_y:
            break
            
        if 0 <= round(x) <= pixels.shape[1] and 0 <= round(y) <= pixels.shape[0]:
            pixels[-(round(y) + 1)][round(x)] = 1

def drawLineBresanham(pixels : ndarray[ndarray], start_pos : tuple[int, int], end_pos : tuple[int, int]) -> None:
    x1, y1 = start_pos
    x2, y2 = end_pos

    dx = abs(x2-x1)
    dy = abs(y2-y1)

    p = (dy << 1) - dx

    x, y = x1, y1

    if 0 <= x <= pixels.shape[1] and 0 <= y <= pixels.shape[0]:
        pixels[-(y+1)][x] = 1

    while x < x2:
        if (p >= 0):
            y += 1
            p += (dy-dx) << 1
        else:
            p += (dy << 1)
        x += 1
        if 0 <= round(x) <= pixels.shape[1] and 0 <= round(y) <= pixels.shape[0]:
            pixels[-(round(y) + 1)][round(x)] = 1
