import pygame as pg
from numpy import ndarray, zeros
from pracs.prac1 import drawLineDDA, drawLineBresanham
from pracs.prac2 import drawCircle

W, H = 200, 160
PIXEL = 5
W_SCREEN, H_SCREEN = W*PIXEL, H*PIXEL
PIXEL_BUFFER :  ndarray[ndarray] = zeros((H, W), dtype=int)


pg.init()
screen : pg.Surface = pg.display.set_mode((W_SCREEN, H_SCREEN))


def draw_grid(surface : pg.Surface, color : pg.Color) -> None:
    [pg.draw.line(surface, color, (x, 0), (x, H_SCREEN)) for x in range(0, W_SCREEN, PIXEL)]

    [pg.draw.line(surface, color, (0, y), (W_SCREEN, y)) for y in range(0, H_SCREEN, PIXEL)]

def draw_pixel(buffer : ndarray[ndarray], surface : pg.Surface, color : pg.Color) -> None:
    print(buffer.shape)
    [[pg.draw.rect(surface, color, pg.Rect(x*PIXEL, y*PIXEL, PIXEL, PIXEL)) for x, pixel in enumerate(row) if pixel] for y, row in enumerate(buffer[::-1])]

running : bool = True

if __name__ == '__main__':
    screen.fill((0,0,0))
    # draw_grid(screen, (10, 10, 10))

    # draw line
    drawCircle(PIXEL_BUFFER, (0, 0), 120)
    drawCircle(PIXEL_BUFFER, (0, 0), 40)
    for i in range(1, 4):
        drawCircle(PIXEL_BUFFER, (100, 80), 20 * i)
    
    for i in range(1, 3):
        drawCircle(PIXEL_BUFFER, (0, 80), 20 * i)
    # drawLineBresanham(PIXEL_BUFFER, (0,0), (99, 79))
    # drawLineBresanham(PIXEL_BUFFER, (40, 10), (90, 100))


    draw_pixel(PIXEL_BUFFER, screen, (50, 50, 50))
    pg.display.flip()

    while running:
        [exit() for e in pg.event.get() if e.type == pg.QUIT]