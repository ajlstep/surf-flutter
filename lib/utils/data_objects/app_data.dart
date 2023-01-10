class AppAuxData {
  late bool _isFirstOpen;

  AppAuxData() {
    _initializeSettings();
  }

  bool get ifFirstOpen => false;

  void _initializeSettings() {
    _isFirstOpen = false;
  }
}
