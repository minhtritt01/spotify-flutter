part of 'theme_cubit.dart';

@JsonSerializable()
class ThemeState {
  const ThemeState(this.mode);
  final ThemeMode mode;
  factory ThemeState.fromJson(Map<String, dynamic> json) =>
      _$ThemeStateFromJson(json);
  Map<String, dynamic> toJson() => _$ThemeStateToJson(this);
}
