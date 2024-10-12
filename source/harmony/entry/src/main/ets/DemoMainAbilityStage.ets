import AbilityStage from '@ohos.app.ability.AbilityStage'
import {RedPlayerInitManager, RedPlayerPreload } from '@xhs/redplayer'
import LoggerImpl from './entryability/LoggerImpl'

/**
 * 应用程序启动类
 * 播放器初始化全局配置
 */
export default class DemoMainAbilityStage extends AbilityStage {
  onCreate() {
    //1、播放器管理初始化
    let cachePath = this.context.cacheDir + '/redplayer'//视频缓存路径
    let logger = new LoggerImpl()//日志实例
    RedPlayerInitManager.initPlayer(cachePath, logger)

    //2、播放缓存预加载初始化
    RedPlayerPreload.globalInit(cachePath, 20, 4, 0)
  }
}