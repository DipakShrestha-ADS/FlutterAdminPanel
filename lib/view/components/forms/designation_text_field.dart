import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:weplay_admin/utils/utils.dart';
import 'package:weplay_admin/view/viewUtils/styles.dart';

class DesignationTextField extends StatelessWidget {
  final String labelText;
  final String initialValue;
  final TextEditingController controller = TextEditingController();
  final bool autoFocus;
  final FocusNode focusNode;
  final Function(String) onSubmit;
  final Function() onTap;

  DesignationTextField({
    @required this.labelText,
    this.initialValue,
    this.autoFocus = false,
    this.focusNode,
    this.onSubmit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    controller.text = initialValue ?? null;
    return FormBuilderTextField(
      attribute: "designation",
      controller: controller,
      autofocus: autoFocus,
      focusNode: focusNode,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      style: TextStyles.Footnote.copyWith(
        fontSize: FontSizes.s16,
      ),
      maxLines: 1,
      valueTransformer: (value) {
        if (value.toString().isNotEmpty) {
          return Utils().capitalizeFirstLetterOfWords(value.toString());
        }
      },
      validators: [
        FormBuilderValidators.required(),
      ],
    );
  }
}
