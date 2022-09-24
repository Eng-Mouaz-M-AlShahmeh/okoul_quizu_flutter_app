/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/screens/home.dart';
import '../../presentation/screens/leaderboard.dart';
import '../../presentation/screens/name.dart';
import '../../presentation/screens/otp.dart';
import '../../presentation/screens/profile.dart';
import '../../presentation/screens/question.dart';
import '../../presentation/screens/result.dart';
import '../../presentation/screens/splash.dart';
import '../../presentation/screens/start.dart';
import '../../presentation/screens/wrong_answer.dart';
import 'constants.dart';

CustomTransitionPage buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

final GoRouter router = GoRouter(
  initialLocation: RoutesConstants.splash,
  routes: <GoRoute>[
    GoRoute(
      path: RoutesConstants.splash,
      builder: (context, state) => const SplashScreen(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      path: RoutesConstants.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RoutesConstants.start,
      builder: (context, state) => StartScreen(),
    ),
    GoRoute(
      path: RoutesConstants.otp,
      builder: (context, state) => const OTPScreen(),
    ),
    GoRoute(
      path: RoutesConstants.name,
      builder: (context, state) => NameScreen(),
    ),
    GoRoute(
      path: RoutesConstants.question,
      builder: (context, state) => const QuestionScreen(),
    ),
    GoRoute(
      path: RoutesConstants.result,
      builder: (context, state) => const ResultScreen(),
    ),
    GoRoute(
      path: RoutesConstants.wrongAnswer,
      builder: (context, state) => const WrongAnswerScreen(),
    ),
    GoRoute(
      path: RoutesConstants.leaderBoard,
      builder: (context, state) => const LeaderBoardScreen(),
    ),
    GoRoute(
      path: RoutesConstants.profile,
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
