import 'package:flutter/material.dart';
import 'package:markatty/Core/di/dependency_injection.dart';
import 'package:markatty/modee_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
   await setupGetIt();
  runApp(const ModeeApp());
}
