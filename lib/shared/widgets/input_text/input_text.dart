import 'package:meuapp/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;
  final String? Function(String)? validator;
  final void Function(String)? onChanged;
  const InputText({
    required this.hint,
    required this.label,
    this.onChanged,
    this.validator,
    Key? key,
    this.obscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label).label,
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          obscureText: obscure,
          onChanged: onChanged,
          validator: (value) {
            if (validator != null) {
              return validator!(value ?? "");
            }
          },
          style: AppTheme.textStyles.input,
          decoration: InputDecoration(
            hintStyle: AppTheme.textStyles.hint,
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.Colors.border),
            ),
          ),
        ),
      ],
    );
  }
}
