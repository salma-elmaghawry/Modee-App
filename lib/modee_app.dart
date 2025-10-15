import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markatty/Config/Routes/app_router.dart';
import 'package:markatty/Config/Routes/routes.dart';
import 'package:markatty/Core/Theme/app_colors.dart';

class ModeeApp extends StatelessWidget {
  const ModeeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 930),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: AppColors.background),
        onGenerateRoute: AppRouter().generateRoute,
        initialRoute: Routes.home,
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(title: const Text('Route Not Found')),
              body: const Center(child: Text('Page not found')),
            ),
          );
        },
      ),
    );
  }
}
