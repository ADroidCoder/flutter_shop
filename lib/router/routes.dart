class Routes {
  // dart 单例
  factory Routes() => _getInstance();

  static Routes _instance;

  static Routes get instance => _getInstance();

  static Routes _getInstance() {
    if (_instance == null) {
      _instance = Routes();
    }
    return _instance;
  }
}
