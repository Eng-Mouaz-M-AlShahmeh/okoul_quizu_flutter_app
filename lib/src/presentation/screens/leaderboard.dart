/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizu_flutter/src/application/states/score_riverpod.dart';
import 'package:quizu_flutter/src/domain/score.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navbar.dart';

class LeaderBoardScreen extends ConsumerWidget {
  const LeaderBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<ScoreModel>> topScores = ref.watch(scoreListProvider);

    return Scaffold(
      appBar: iAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Leaderboard',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            Expanded(
              child: topScores.when(
                data: (topScores) {
                  return ListView.builder(
                      itemCount: topScores.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(topScores[index].name!,
                                  style: Theme.of(context).textTheme.headline5),
                              const SizedBox(width: 15),
                              Text(topScores[index].score!.toString(),
                                  style: Theme.of(context).textTheme.headline5),
                            ],
                          ),
                        );
                      });
                },
                error: (e, stack) => Center(
                  child: Text(e.toString()),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: iBottomNavBar(ref, context),
    );
  }
}
