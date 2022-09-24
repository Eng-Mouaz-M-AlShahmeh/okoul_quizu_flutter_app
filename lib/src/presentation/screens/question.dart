/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quizu_flutter/src/application/states/question_riverpod.dart';
import 'package:quizu_flutter/src/application/states/score_riverpod.dart';
import 'package:quizu_flutter/src/domain/question.dart';
import '../../application/routes/constants.dart';
import '../widgets/button.dart';
import 'package:slide_countdown/slide_countdown.dart';

class QuestionScreen extends ConsumerWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<QuestionModel>> questions = ref.watch(questionListProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: questions.when(
          data: (questions) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideCountdownSeparated(
                    width: 80,
                    height: 50,
                    onDone: () {
                      ref.read(stepProvider.notifier).setStep(0);
                      context.go(RoutesConstants.result);
                    },
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    duration: const Duration(minutes: 2),
                    padding: const EdgeInsets.all(5),
                  ),
                  Text(
                    ' ⏳',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      questions[ref.watch(stepProvider).step].question!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: iButtonAnswer(
                          context, questions[ref.watch(stepProvider).step].a!,
                          () {
                        if (questions[ref.watch(stepProvider).step].correct ==
                            'a') {
                          ref
                              .read(scoreProvider.notifier)
                              .setScore(ref.read(scoreProvider).score + 1);
                          if (ref.watch(stepProvider).step ==
                              (questions.length - 1)) {
                            ref.read(stepProvider.notifier).setStep(0);
                          } else {
                            ref
                                .read(stepProvider.notifier)
                                .setStep(ref.watch(stepProvider).step + 1);
                          }
                        } else {
                          context.go(RoutesConstants.wrongAnswer);
                        }
                      }),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: iButtonAnswer(
                          context, questions[ref.watch(stepProvider).step].b!,
                          () {
                        if (questions[ref.watch(stepProvider).step].correct ==
                            'b') {
                          ref
                              .read(scoreProvider.notifier)
                              .setScore(ref.read(scoreProvider).score + 1);
                          if (ref.watch(stepProvider).step ==
                              (questions.length - 1)) {
                            ref.read(stepProvider.notifier).setStep(0);
                          } else {
                            ref
                                .read(stepProvider.notifier)
                                .setStep(ref.watch(stepProvider).step + 1);
                          }
                        } else {
                          context.go(RoutesConstants.wrongAnswer);
                        }
                      }),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: iButtonAnswer(
                          context, questions[ref.watch(stepProvider).step].c!,
                          () {
                        if (questions[ref.watch(stepProvider).step].correct ==
                            'c') {
                          ref
                              .read(scoreProvider.notifier)
                              .setScore(ref.read(scoreProvider).score + 1);
                          if (ref.watch(stepProvider).step ==
                              (questions.length - 1)) {
                            ref.read(stepProvider.notifier).setStep(0);
                          } else {
                            ref
                                .read(stepProvider.notifier)
                                .setStep(ref.watch(stepProvider).step + 1);
                          }
                        } else {
                          context.go(RoutesConstants.wrongAnswer);
                        }
                      }),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: iButtonAnswer(
                          context, questions[ref.watch(stepProvider).step].d!,
                          () {
                        if (questions[ref.watch(stepProvider).step].correct ==
                            'd') {
                          ref
                              .read(scoreProvider.notifier)
                              .setScore(ref.read(scoreProvider).score + 1);
                          if (ref.watch(stepProvider).step ==
                              (questions.length - 1)) {
                            ref.read(stepProvider.notifier).setStep(0);
                          } else {
                            ref
                                .read(stepProvider.notifier)
                                .setStep(ref.watch(stepProvider).step + 1);
                          }
                        } else {
                          context.go(RoutesConstants.wrongAnswer);
                        }
                      }),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iButton(context, 'Skip 🔥', () {
                    if (ref.watch(stepProvider).step ==
                        (questions.length - 1)) {
                      ref.read(stepProvider.notifier).setStep(0);
                    } else {
                      ref
                          .read(stepProvider.notifier)
                          .setStep(ref.watch(stepProvider).step + 1);
                    }
                  }),
                ],
              ),
            ],
          ),
          error: (e, stack) => Center(
            child: Text(e.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
