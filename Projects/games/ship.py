# encoding:utf-8

import pygame


class Ship(object):
    def __init__(self, screen, ):
        # 初始化飞船并设置它的初始位置
        self.screen = screen
        self.image = pygame.image.load('images/feiji.bmp')
        self.rect = self.image.get_rect()
        # 把飞机放到底部的中央位置
        self.screen_rect = screen.get_rect()
        # 设置坐标
        self.rect.centerx = self.screen_rect.centerx
        self.rect.bottom = self.screen_rect.bottom

    def blitme(self):
        self.screen.blit(self.image, self.rect)
