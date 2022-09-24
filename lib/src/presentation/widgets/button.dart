/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

iButton(BuildContext context, String text, Function function) => ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          side: const BorderSide(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(1),
        )),
        backgroundColor:
            MaterialStateProperty.all(CupertinoColors.extraLightBackgroundGray),
        textStyle: MaterialStateProperty.all(
          Theme.of(context).textTheme.headline3,
        ),
      ),
      onPressed: () => function(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );

iButtonAnswer(BuildContext context, String text, Function function) =>
    ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(1),
        )),
        backgroundColor:
            MaterialStateProperty.all(CupertinoColors.extraLightBackgroundGray),
        textStyle: MaterialStateProperty.all(
          Theme.of(context).textTheme.headline4,
        ),
      ),
      onPressed: () => function(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
