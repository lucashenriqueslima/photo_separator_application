import 'package:flutter/material.dart';
import 'package:photo_separator/app/themes/styles/app_colors.dart';
import 'package:photo_separator/app/themes/styles/app_text_styles.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double? height;
  final double? width;
  final Color? backgroundColorButton;
  final TextStyle? textStyle;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.height,
    this.width,
    this.backgroundColorButton,
    this.textStyle,
    this.isLoading = false,
  });

  //TODO: Implementar disable enquanto isLoading == true

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 70,
      width: width ?? 90,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColorButton ?? context.primary,
          ),
          onPressed: () {
            if (!isLoading) {
              onPressed?.call();
            }

            null;
          },
          child: FittedBox(
            child: isLoading
                ? SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: height ?? 1,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    label,
                    style: textStyle ??
                        context.appTextStyles.textBold.copyWith(fontSize: 1000),
                  ),
          )),
    );
  }
}
