import 'package:flutter/material.dart';
import 'package:markatty/modee_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const ModeeApp());
}
