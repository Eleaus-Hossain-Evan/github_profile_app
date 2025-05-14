part of 'extensions.dart';

extension ThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get color => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
}
