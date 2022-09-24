/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quizu_flutter/src/application/states/score_riverpod.dart';
import '../../application/routes/constants.dart';
import 'package:share_plus/share_plus.dart';
import '../../application/states/question_riverpod.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({Key? key}) : super(key: key);

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
                '🏁',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      // fontSize: 70,
                      color: Colors.black,
                    ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'You have completed',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    ref.read(scoreProvider).score.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'correct answers!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                Share.share(
                    'I answered ${ref.read(scoreProvider).score.toString()} correct answers in QuizU!');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.share, size: 40),
                  const SizedBox(width: 15),
                  Text(
                    'Share',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
