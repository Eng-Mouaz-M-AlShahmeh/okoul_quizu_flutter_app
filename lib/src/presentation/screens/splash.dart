/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../application/routes/constants.dart';
import '../utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, [bool mounted = true]) {
    Future.delayed(const Duration(seconds: 2), () {
      if(!mounted) return;
      context.go(RoutesConstants.home);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:
            Text(Constants.logo, style: Theme.of(context).textTheme.headline1),
      ),
    );
  }
}
