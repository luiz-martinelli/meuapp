import 'package:meuapp/shared/theme/app_colors.dart';
import 'package:meuapp/shared/theme/app_text_style.dart';

export 'app_text.dart';

class AppTheme {
  static final AppTheme instance = AppTheme();

  final _colors = AppColors();
  // ignore: non_constant_identifier_names
  static AppColors get Colors => instance._colors;

  final _textStyles = AppTextStyles();
  static AppTextStyles get textStyles => instance._textStyles;
}
