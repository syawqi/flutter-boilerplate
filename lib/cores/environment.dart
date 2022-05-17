import 'package:alice/alice.dart';
import 'package:flutter/foundation.dart';

class Environment{
  static String baseUrl = "";
  static String baseApi = "";
  static String sentryDNS = "https://3229c90c247745799f43bd312ba20364@o1248855.ingest.sentry.io/6409028";
  static Alice globalAlice = Alice(
    showNotification: !kReleaseMode,
    showInspectorOnShake: !kReleaseMode,
    darkTheme: false,
    maxCallsCount: 1000,
  );
}