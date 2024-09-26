import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class AppSettings extends ChangeNotifier {
  late Box box;
  AppSettings() {
    _starHive();
  }

  _starHive() async {
    box = await Hive.openBox('order');
  }
}
