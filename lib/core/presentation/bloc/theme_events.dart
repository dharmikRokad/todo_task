import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_events.freezed.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.toggleTheme() = ToggleThemeEvent;
}
