import 'package:flutter/material.dart';
import 'package:markatty/Config/Routes/routes.dart';
import 'package:markatty/Features/Cart/presentation/Screens/cart_screen.dart';
import 'package:markatty/Features/Home/presentation/Screens/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.cart:
        return MaterialPageRoute(builder: (_) => CartScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}