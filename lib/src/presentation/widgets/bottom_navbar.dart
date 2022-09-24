/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quizu_flutter/src/application/states/user_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../application/routes/constants.dart';

iBottomNavBar(WidgetRef ref, BuildContext context, [bool mounted = true]) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Expanded(
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            )),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            textStyle: MaterialStateProperty.all(
              Theme.of(context).textTheme.headline3,
            ),
          ),
          onPressed: () {
            context.go(RoutesConstants.home);
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.home_filled,
              size: 50,
              color: ModalRoute.of(context)!.settings.name == '/'
                  ? Colors.black
                  : Colors.grey,
            ),
          ),
        ),
      ),
      Expanded(
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            )),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            textStyle: MaterialStateProperty.all(
              Theme.of(context).textTheme.headline3,
            ),
          ),
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            String? sharedToken = prefs.getString('token');
            if (sharedToken != null) {
              if (!mounted) return;
              context.go(RoutesConstants.leaderBoard);
            } else {
              if (!mounted) return;
              context.go(RoutesConstants.start);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.celebration,
              size: 50,
              color: ModalRoute.of(context)!.settings.name == '/leaderBoard'
                  ? Colors.black
                  : Colors.grey,
            ),
          ),
        ),
      ),
      Expanded(
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            )),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            textStyle: MaterialStateProperty.all(
              Theme.of(context).textTheme.headline3,
            ),
          ),
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            String? sharedToken = prefs.getString('token');
            if (sharedToken != null) {
              ref.read(loginProvider.notifier).getUser(ref, sharedToken);
              if (!mounted) return;
              context.go(RoutesConstants.profile);
            } else {
              if (!mounted) return;
              context.go(RoutesConstants.start);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.person,
              size: 50,
              color: ModalRoute.of(context)!.settings.name == '/profile'
                  ? Colors.black
                  : Colors.grey,
            ),
          ),
        ),
      ),
    ],
  );
}
