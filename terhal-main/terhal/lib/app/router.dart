


import 'package:flutter/material.dart';
import 'package:terhal/ui/screens/auth/sigin_in.dart';
import 'package:terhal/ui/screens/login_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
     
       case SignIn.id:
        return MaterialPageRoute(builder: (_) => SignIn()); 
    
        
        
        

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No rout defined for'),
                  ),
                ));
    }
  }

  static goToNextScreenWithReplacment(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => screen));
  }

  static goToNextScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
