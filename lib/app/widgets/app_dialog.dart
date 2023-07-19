import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_separator/app/themes/styles/app_colors.dart';
import 'package:photo_separator/app/themes/styles/app_styles.dart';
import 'package:photo_separator/app/themes/styles/app_text_styles.dart';

//Extends ao controller do GetX
class StudioDialog extends GetWidget {
  final String title;
  final Widget content;
  final bool? hasPrimaryButton;
  final String? primaryButtonLabel;
  final VoidCallback? onPrimaryButtonPressed;
  final bool? isPrimaryButtonDisabled;
  final String? secondaryButtonLabel;
  final VoidCallback? onSecondaryButtonPressed;
  final bool? isScrollable;

  const StudioDialog({
    super.key,
    required this.title,
    required this.content,
    this.hasPrimaryButton = false,
    this.primaryButtonLabel,
    this.onPrimaryButtonPressed,
    this.isPrimaryButtonDisabled = false,
    this.secondaryButtonLabel = 'Fechar',
    this.onSecondaryButtonPressed,
    this.isScrollable = false,
  });

  @override
  Widget build(BuildContext context) {
    final dialogController = Get.put(StudioDialogController());
    dialogController.isPrimaryButtonDisabled.value = isPrimaryButtonDisabled!;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Colors.grey[800],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Text(title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center),
          ),
          isScrollable!
              ? Expanded(
                  child: SingleChildScrollView(
                    controller: dialogController.scrollController,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      child: content,
                    ),
                  ),
                )
              : Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
                  alignment: Alignment.center,
                  child: content,
                ),
          Padding(
            padding: EdgeInsets.fromLTRB(7, isScrollable! ? 4 : 0, 7, 4),
            child: Row(
              mainAxisAlignment: hasPrimaryButton!
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => onSecondaryButtonPressed != null
                      ? onSecondaryButtonPressed!()
                      : Get.back(),
                  style: context.appStyles.dialogTextButton,
                  child: FittedBox(
                    child: Text(
                      secondaryButtonLabel!,
                      style: context.appTextStyles.textButtonLabel,
                    ),
                  ),
                ),
                Container(
                  child: hasPrimaryButton!
                      ? Obx(
                          () => TextButton(
                            onPressed: () =>
                                dialogController.isPrimaryButtonDisabled.value
                                    ? null
                                    : onPrimaryButtonPressed!(),
                            style: context.appStyles.dialogTextButton.copyWith(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                dialogController.isPrimaryButtonDisabled.value
                                    ? Colors.grey[600]!
                                    : Colors.grey[200]!,
                              ),
                            ),
                            child: FittedBox(
                              child: Text(
                                primaryButtonLabel!,
                                style: context.appTextStyles.textButtonLabel
                                    .copyWith(
                                  color: context.primary,
                                ),
                              ),
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StudioDialogController extends GetxController {
  final scrollController = ScrollController();
  Rx<bool> isPrimaryButtonDisabled = false.obs;

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
