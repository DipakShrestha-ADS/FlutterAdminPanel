import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:weplay_admin/view/viewUtils/styles.dart';

class TotalDaysField extends StatelessWidget {
  TotalDaysField({
    Key key,
    this.labelText,
    this.initialValue,
    this.autoFocus = false,
    this.focusNode,
    this.onSubmit,
    this.onTap,
    this.autoValidate = AutovalidateMode.disabled,
    this.validators,
  }) : super(key: key);

  final TextEditingController controller = TextEditingController();
  final String labelText;
  final String initialValue;
  final bool autoFocus;
  final FocusNode focusNode;
  final Function(String) onSubmit;
  final Function() onTap;
  final AutovalidateMode autoValidate;
  final List<String Function(dynamic)> validators;

  @override
  Widget build(BuildContext context) {
    controller.text = initialValue ?? null;
    return FormBuilderTextField(
      attribute: "totalDays",
      autofocus: autoFocus,
      focusNode: focusNode,
      autovalidateMode: autoValidate,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType: TextInputType.number,
      valueTransformer: (val) {
        if (val != null) {
          if (val.isNotEmpty) {
            return int.parse(val);
          }
        }
        return val;
      },
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      style: TextStyles.Footnote.copyWith(
        fontSize: FontSizes.s16,
      ),
      validators: validators ??
          [
            FormBuilderValidators.required(),
          ],
    );
  }
}
