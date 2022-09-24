/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../application/routes/constants.dart';
import '../../application/states/question_riverpod.dart';
import '../../application/states/score_riverpod.dart';
import '../widgets/button.dart';

class WrongAnswerScreen extends ConsumerWidget {
  const WrongAnswerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    ref.read(stepProvider.notifier).setStep(0);
                    ref.read(scoreProvider.notifier).setScore(0);
                    context.go(RoutesConstants.splash);
                  },
                  child: Text(
                    'X',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                '😢',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      // fontSize: 70,
                      color: Colors.black,
                    ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Wrong Answer',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iButton(context, 'Try Again', () {
                  ref.read(stepProvider.notifier).setStep(0);
                  ref.read(scoreProvider.notifier).setScore(0);
                  context.go(RoutesConstants.splash);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
