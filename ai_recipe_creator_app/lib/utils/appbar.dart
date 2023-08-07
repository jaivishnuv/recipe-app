import 'package:flutter/material.dart';

AppBar buildAppBar(
        {required String appBarTitle,
        bool? centerTitle,
        List<Widget>? actionWidgets,
        required context}) =>
    AppBar(
      title: Text(appBarTitle),
      centerTitle: centerTitle ?? false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      actions: actionWidgets ?? [],
    );