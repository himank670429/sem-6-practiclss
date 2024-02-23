from numpy import ndarray
def drawCircle(pixels : ndarray[ndarray], center : tuple[int, int], r : float) -> None:
    x, y = 0, r
    d = 1-r
    x_c, y_c = center

    if 0 <= x_c+x <= pixels.shape[1] and 0 <= y_c+y <= pixels.shape[0]:
        pixels[y_c][x_c-r] = 1
        pixels[y_c][x_c+r] = 1
        pixels[y_c+r][x_c] = 1
        pixels[y_c-r][x_c] = 1

    # center
    # if 0 <= x_c <= pixels.shape[1] and 0 <= y_c <= pixels.shape[0]:
    #     pixels[y_c][x_c] = 1

    while x <= y:
        x += 1 
        if d < 0:
            d = d+(2*x + 1)
        else:
            y -=1
            d = d+ (2*x - 2*y)+1
        
        # continue
        if 0 <= x+x_c <= pixels.shape[1] and 0 <= y+y_c <= pixels.shape[0]:
            # arc_1
            pixels[y_c+y][x_c+x] = 1

            # arc 2
            pixels[y_c+x][x_c+y] = 1

            # arc 3
            pixels[y_c-x][x_c+y] = 1
            
            # arc 4
            pixels[y_c-y][x_c+x] = 1

            # arc 5
            pixels[y_c-y][x_c-x] = 1

            # arc 6
            pixels[y_c-x][x_c-y] = 1

            # arc 7
            pixels[y_c+x][x_c-y] = 1

            # arc 8
            pixels[y_c+y][x_c-x] = 1
            