import AbilityStage from '@ohos.app.ability.AbilityStage'
import { RedPlayerConfigBuilder, RedPlayerInitManager, RedPlayerPreload } from '@xhs/redplayer'
import LoggerImpl from './entryability/LoggerImpl'

/**
 * 应用程序启动类
 * 初始化全局配置
 */
export default class DemoMainAbilityStage extends AbilityStage {
  onCreate() {
    //1、播放器管理初始化
    let configBuilder = new RedPlayerConfigBuilder()
    configBuilder.cachePath = this.context.cacheDir + '/redplayer'
    configBuilder.logger = new LoggerImpl()
    RedPlayerInitManager.initPlayer(configBuilder)
    //2、播放缓存预加载初始化
    RedPlayerPreload.globalInit(configBuilder.cachePath, 20, 4, 0)
  }
}