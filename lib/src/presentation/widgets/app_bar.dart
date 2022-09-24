/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import '../utils/constants.dart';

iAppBar(BuildContext context) => AppBar(
      centerTitle: true,
      title: Text(
        Constants.logo,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
