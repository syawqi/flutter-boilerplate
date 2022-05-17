import 'package:boilerplate/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/theme_cubit.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.current.welcome,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () =>
                  BlocProvider.of<ThemeCubit>(context).changeTheme(),
              child: const Text(
                "Change Theme",
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () =>
                  BlocProvider.of<ThemeCubit>(context).changeLocale("en"),
              child: const Text(
                "English",
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () =>
                  BlocProvider.of<ThemeCubit>(context).changeLocale("id"),
              child: const Text(
                "Indonesia",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
