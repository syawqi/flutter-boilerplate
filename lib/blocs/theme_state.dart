part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  ThemeMode themeData = ThemeMode.light;
  Locale locale = const Locale("en");

  ThemeState(this.themeData, this.locale);
}

class CurrentTheme extends ThemeState {
  CurrentTheme(ThemeMode themeData, Locale locale) : super(themeData, locale);

  @override
  List<Object> get props => [themeData, locale];
}