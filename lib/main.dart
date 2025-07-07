import 'package:flutter/material.dart';
import 'package:interest_calculator/widgets/page1.dart';
import 'package:interest_calculator/widgets/page2.dart';
import 'package:interest_calculator/widgets/page3.dart';
import 'package:interest_calculator/widgets/type_interet.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const Page1());

          case '/page2':
            return _slideLeftRoute(const Page2());

          case '/page3':
            return _slideLeftRoute(const Page3());

          case '/typeInterest':
            return _fadeRoute(TypeInteret());

          default:
            return null;
        }
      },
    );
  }
  
  PageRouteBuilder _slideLeftRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); 
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  
  PageRouteBuilder _fadeRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
