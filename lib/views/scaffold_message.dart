



import 'package:flutter/material.dart';

sealed class KTScaffoldMessage{
  static ScaffoldFeatureController scaffoldMessage(context,String message) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}