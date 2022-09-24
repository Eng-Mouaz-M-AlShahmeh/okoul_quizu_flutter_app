/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quizu_flutter/src/application/states/user_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../application/routes/constants.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navbar.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref, [bool mounted = true]) {
    return Scaffold(
      appBar: iAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            final prefs = await SharedPreferences.getInstance();
                            prefs.remove('token');
                            if (!mounted) return;
                            context.go(RoutesConstants.splash);
                          },
                          child: const Icon(
                            Icons.logout,
                            size: 55,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Profile',
                      style: Theme.of(context).textTheme.headline2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Name: ${ref.read(nameProvider).name}',
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Mobile: ${ref.read(loginProvider).user.mobile}',
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                )),
            const Divider(),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'My Scores',
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('01:30 PM 23/9/2022',
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                const SizedBox(width: 15),
                                Text('xxx',
                                    style:
                                        Theme.of(context).textTheme.headline5),
                              ],
                            ),
                          );
                        }),
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
