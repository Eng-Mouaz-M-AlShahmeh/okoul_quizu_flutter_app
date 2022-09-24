/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quizu_flutter/src/application/routes/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/button.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref, [bool mounted = true]) {
    return Scaffold(
      appBar: iAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'Ready to test your knowledge and challenge others?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iButton(context, 'Quiz Me!', () async {
                  final prefs = await SharedPreferences.getInstance();
                  String? sharedToken = prefs.getString('token');

                  if (sharedToken == null) {
                    if (!mounted) return;
                    context.go(RoutesConstants.start);
                  } else {
                    if (!mounted) return;
                    context.go(RoutesConstants.question);
                  }
                }),
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Answer as much questions correctly within 2 minutes',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: iBottomNavBar(ref, context),
    );
  }
}
