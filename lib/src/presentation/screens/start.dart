/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quizu_flutter/src/application/states/user_riverpod.dart';
import '../../application/routes/constants.dart';
import '../utils/constants.dart';
import '../widgets/button.dart';
import '../widgets/input_decoration.dart';

class StartScreen extends ConsumerWidget {
  StartScreen({Key? key}) : super(key: key);

  final _mobileKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Form(
          key: _mobileKey,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Mobile',
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
                      onChanged: (val) {
                        ref.read(mobileProvider.notifier).setMobile(val);
                      },
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return 'This field is required!';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.phone,
                      decoration: iInputDecorationMobile(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iButton(context, 'Start', () {
                    if (!_mobileKey.currentState!.validate()) {
                      return;
                    } else {
                      context.go(RoutesConstants.otp);
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
