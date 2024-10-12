import {IRedPlayerLogger} from './log/IRedPlayerLogger';
import { NativeLoggerAdapter } from './log/NativeLoggerAdapter';
import RedPlayerLogger from './log/RedPlayerLogger';
import libnative from 'libredplayer.so'
import { PlayerNativeEventAdapter } from './implements/HmRedMediaPlayer';
import { GlobalConfig } from './implements/RedConfig';

/**
 * 播放器初始化管理类
 */
export class RedPlayerInitManager {
  /**
   * 初始化播放器全局配置，只需调用一次
   */
  public static initPlayer(cachePath: string, logger:IRedPlayerLogger) {
    libnative.registerLogListener(NativeLoggerAdapter.getInstance())
    libnative.registerPlayerEventListener(PlayerNativeEventAdapter.getInstance())
    if (cachePath) {
      GlobalConfig.cachePath = cachePath
    }
    if (logger) {
      RedPlayerLogger.loggerImpl = logger
    }
  }
}