//
//  AudioTool.m
//  Punish
//
//  Created by YuChangLin on 16/9/10.
//  Copyright © 2016年 YuChangLin. All rights reserved.
//

#import "AudioTool.h"
#import <AVFoundation/AVFoundation.h>


@implementation AudioTool

/**
 *  存放所有的音乐播放器
 */
static NSMutableDictionary *_musicPlayers;
+ (NSMutableDictionary *)musicPlayers
{
    if (!_musicPlayers) {
        _musicPlayers = [NSMutableDictionary dictionary];
    }
    return _musicPlayers;
}

/**
 *  播放音乐
 *
 *  @param filename 音乐的文件名
 */
+ (BOOL)playMusic:(NSString *)filename
{
    if (!filename) return NO;
    
    AVAudioPlayer *player = [self musicPlayers][filename];
    
    
    if (!player) {
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        if (!url) return NO;
        
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        
        if (![player prepareToPlay]) return NO;
        
        [self musicPlayers][filename] = player;
    }
    
    if (!player.isPlaying) {
        return [player play];
    }
    return YES;
}

@end
