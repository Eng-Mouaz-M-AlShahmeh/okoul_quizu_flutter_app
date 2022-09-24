/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';

iInputDecoration(BuildContext context) => InputDecoration(
      labelStyle: Theme.of(context).textTheme.headline5,
      errorStyle: Theme.of(context).textTheme.headline6,
      hintText: '',
      hintStyle: Theme.of(context).textTheme.headline5,
      fillColor: Colors.white,
      filled: true,
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
    );

iInputDecorationMobile(BuildContext context) => InputDecoration(
      icon: const Text(
        '🇸🇦',
        style: TextStyle(fontSize: 40),
      ),
      labelStyle: Theme.of(context).textTheme.headline5,
      errorStyle: Theme.of(context).textTheme.headline6,
      hintText: '5xxxxxxxx',
      hintStyle: Theme.of(context).textTheme.headline5,
      fillColor: Colors.white,
      filled: true,
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
    );
