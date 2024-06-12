
import 'package:flutter/cupertino.dart';

import '../DashBoard/Home/AC/ac_service.dart';
import '../DashBoard/Home/AC/addToCart.dart';


// Animation routing for AddToCartPage
Route createRouteAddToCart() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => AddToCart(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut; // Changed to easeInOut for smoother transition

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var reverseTween = Tween(begin: end, end: begin).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: SlideTransition(
          position: secondaryAnimation.drive(reverseTween),
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 700), // Increased duration for smoothness
    reverseTransitionDuration: const Duration(milliseconds: 700), // Consistent duration for reverse transition
  );
}


// Animation routing in AcServicePage
Route createRouteAcService() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => AcService(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut; // Changed to easeInOut for smoother transition

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var reverseTween = Tween(begin: end, end: begin).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: SlideTransition(
          position: secondaryAnimation.drive(reverseTween),
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 700), // Increased duration for smoothness
    reverseTransitionDuration: const Duration(milliseconds: 700), // Consistent duration for reverse transition
  );
}