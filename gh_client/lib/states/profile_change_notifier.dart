import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../common/global.dart';
import '../models/user.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  Profile get _profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile();
    super.notifyListeners();
  }
}

class UserModel extends ProfileChangeNotifier {
  User? get user => _profile.user;

  bool get isLogin => user != null;

  set user(User? user) {
    if (user?.login != _profile.user?.login) {
      _profile.lastLogin = user?.login;
      _profile.user = user;
      notifyListeners();
    }
  }
}

class ThemeModel extends ProfileChangeNotifier {
  ColorSwatch get theme => Global.themes.firstWhere(
        (e) => e.value == _profile.theme,
        orElse: () => Global.themes.first,
      );

  set theme(ColorSwatch color) {
    if (color != theme) {
      _profile.theme = color[500]!.value;
      notifyListeners();
    }
  }
}

class LocaleModel extends ProfileChangeNotifier {
  Locale? getLocale() {
    if (_profile.locale == null) {
      return null; //跟随系统
    }
    final list = _profile.locale!.split('_');
    return list.length > 1 ? Locale(list[0], list[1]) : Locale(list[0]);
  }

  String? get locale => _profile.locale;

  set locale(String? locale) {
    Global.profile.locale = locale;
    notifyListeners();
  }
}
