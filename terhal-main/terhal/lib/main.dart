import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:terhal/app/app_widget.dart';
import 'package:terhal/ui/screens/pref_manager.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(PrefManager());
  await Firebase.initializeApp();
  runApp(AppWidget());
}
