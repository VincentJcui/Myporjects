# encoding:utf-8

import sys
import pygame
from setting import Setting
from ship import Ship


def run_game():
    pygame.init()  # 初始化背景,让游戏运行
    sets = Setting()  # 实例化Setting类
    screen = pygame.display.set_mode((sets.screen_width, sets.screen_height))  # 创建一个显示窗口
    pygame.display.set_caption('打飞机')
    screen.fill(sets.bg_color)
    ship = Ship(screen)
    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()
        screen.fill(sets.bg_color)
        ship.blitme()
        pygame.display.flip()


if __name__ == '__main__':
    run_game()
    pass
