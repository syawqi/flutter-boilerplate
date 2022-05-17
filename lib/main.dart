import 'package:boilerplate/blocs/theme_cubit.dart';
import 'package:boilerplate/cores/environment.dart';
import 'package:boilerplate/cores/themes.dart';
import 'package:boilerplate/example.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SentryFlutter.init(
    (options) {
      options.dsn = Environment.sentryDNS;
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      DevicePreview(
        enabled: kDebugMode,
        tools: const [
          ...DevicePreview.defaultTools,
        ],
        builder: (context) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeCubit cubit = ThemeCubit();

  @override
  void initState() {
    cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cubit.init();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => cubit,
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, theme) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: MainThemeData.light,
              darkTheme: MainThemeData.dark,
              navigatorKey: Environment.globalAlice.getNavigatorKey(),
              themeMode: theme.themeData,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: theme.locale,
              builder: EasyLoading.init(),
              home: const ExampleScreen(),
            );
          },
        ),
      ),
    );
  }
}
