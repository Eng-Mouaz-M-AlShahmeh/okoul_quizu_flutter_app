/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../application/routes/constants.dart';
import '../../application/states/user_riverpod.dart';
import '../utils/constants.dart';
import '../widgets/button.dart';
import '../widgets/input_decoration.dart';

class NameScreen extends ConsumerWidget {
  NameScreen({Key? key}) : super(key: key);

  final _nameKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref, [bool mounted = true]) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Form(
          key: _nameKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      Constants.logo,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'What’s your name?',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return 'This field is required!';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        ref.read(nameProvider.notifier).setName(val);
                      },
                      decoration: iInputDecoration(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iButton(context, 'Done', () async {
                    if (!_nameKey.currentState!.validate()) {
                      return;
                    } else {
                      final prefs = await SharedPreferences.getInstance();
                      String? sharedToken = prefs.getString('token');
                      if (sharedToken != null) {
                        ref
                            .read(nameProvider.notifier)
                            .logName(ref, sharedToken);
                        if (!mounted) return;
                        context.go(RoutesConstants.home);
                      }
                    }
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
