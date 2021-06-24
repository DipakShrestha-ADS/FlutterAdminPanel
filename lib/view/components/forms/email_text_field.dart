import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:weplay_admin/view/viewUtils/styles.dart';

class EmailTextField extends StatelessWidget {
  EmailTextField({
    Key key,
    @required this.labelText,
    this.initialValue,
    this.autoFocus = false,
    this.focusNode,
    this.onSubmit,
    this.onTap,
  }) : super(key: key);

  final TextEditingController controller = TextEditingController();
  final String labelText;
  final String initialValue;
  final bool autoFocus;
  final FocusNode focusNode;
  final Function(String) onSubmit;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    controller.text = initialValue ?? null;
    return FormBuilderTextField(
      attribute: "email",
      autofocus: autoFocus,
      focusNode: focusNode,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      controller: controller ??
          TextEditingController(
            text: initialValue ?? null,
          ),
      decoration: InputDecoration(
        labelText: labelText,
      ),
      style: TextStyles.Footnote.copyWith(
        fontSize: FontSizes.s16,
      ),
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.email(),
      ],
    );
  }
}
