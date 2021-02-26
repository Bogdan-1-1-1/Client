enum LogLevels { ALL, DEBUG, INFO, TAG, ERROR, FATAL }

class Logger {
  static Logger instance;

  static Logger getLogger() {
    instance ??= Logger();
    return instance;
  }

  Logger();
  LogLevels logLevel = LogLevels.ALL;

  void log(String tag, String message) {
    print(tag + ': [' + message + ']');
  }

  void error(String message) {
    if (logLevel != LogLevels.TAG && logLevel != LogLevels.FATAL) {
      log('ERROR', message);
    }
  }

  void info(String message) {
    if (logLevel == LogLevels.ALL ||
        logLevel == LogLevels.DEBUG ||
        logLevel == LogLevels.INFO) {
      log('INFO', message);
    }
  }

  void fatal(String message) {
    if (logLevel != LogLevels.TAG &&
        logLevel != LogLevels.ERROR &&
        logLevel != LogLevels.INFO) {
      log('FATAL', message);
    }
  }

  void tag(String message) {
    if (logLevel == LogLevels.TAG || logLevel == LogLevels.ALL) {
      log('TAG', message);
    }
  }

  void setLogLevel(LogLevels logLevel) {
    this.logLevel = logLevel;
  }
}
