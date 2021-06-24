import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:weplay_admin/utils/utils.dart';
import 'package:weplay_admin/view/viewUtils/styles.dart';

class NameTextField extends StatelessWidget {
  final String labelText;
  final String initialValue;
  final TextEditingController controller = TextEditingController();
  final bool autoFocus;
  final FocusNode focusNode;
  final Function(String) onSubmit;
  final Function() onTap;
  final AutovalidateMode autoValidate;

  NameTextField({
    this.labelText,
    this.initialValue,
    this.autoFocus = false,
    this.focusNode,
    this.onSubmit,
    this.onTap,
    this.autoValidate,
  });

  @override
  Widget build(BuildContext context) {
    controller.text = initialValue ?? null;
    return FormBuilderTextField(
      attribute: "name",
      controller: controller,
      autofocus: autoFocus,
      autovalidateMode: autoValidate,
      focusNode: focusNode,
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      style: TextStyles.Footnote.copyWith(
        fontSize: FontSizes.s16,
      ),
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
