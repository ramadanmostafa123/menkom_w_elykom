import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/main.dart';

push(Widget child) => Navigator.of(navigator.currentContext!)
    .push(MaterialPageRoute(builder: (context) => child));

pushAndRemoveUntil(Widget child) =>
    Navigator.of(navigator.currentContext!).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => child), (route) => false);

pushReplacement(Widget child) => Navigator.of(navigator.currentContext!)
    .pushReplacement(MaterialPageRoute(builder: (context) => child));
