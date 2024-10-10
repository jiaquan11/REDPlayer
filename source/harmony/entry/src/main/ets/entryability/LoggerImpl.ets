import {IRedPlayerLogger} from '@xhs/redplayer';

/**
 * 日志接口实现类
 * 从Har中导入接口，便于业务侧和SDK测接口实现统一
 */
export default class LoggerImpl implements IRedPlayerLogger {
  i(tag: string, msg?: string) {
    console.info(tag, msg)
  }

  d(tag: string, msg?: string) {
    console.debug(tag, msg)
  }

  w(tag: string, msg?: string) {
    console.warn(tag, msg)
  }

  e(tag: string, msg?: string, error?: Error) {
    console.error(tag, msg, error)
  }
}