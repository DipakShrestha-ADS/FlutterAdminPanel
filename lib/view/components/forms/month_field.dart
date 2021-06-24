import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:weplay_admin/view/viewUtils/styles.dart';

class MonthField extends StatelessWidget {
  MonthField({
    Key key,
    @required this.labelText,
    this.initialValue,
    this.autoFocus = false,
    this.focusNode,
    this.onSubmit,
    this.onTap,
    this.autoValidate = AutovalidateMode.disabled,
    this.readOnly = false,
  }) : super(key: key);

  final TextEditingController controller = TextEditingController();
  final String labelText;
  final String initialValue;
  final bool autoFocus;
  final FocusNode focusNode;
  final Function(String) onSubmit;
  final Function() onTap;
  final AutovalidateMode autoValidate;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    controller.text = initialValue ?? null;
    return FormBuilderTextField(
      attribute: "month",
      autofocus: autoFocus,
      focusNode: focusNode,
      readOnly: readOnly,
      onFieldSubmitted: onSubmit,
      autovalidateMode: autoValidate,
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
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(2, errorText: 'Value length <= 2 is acceptable'),
        FormBuilderValidators.max(12, errorText: 'Value <= 12 is acceptable'),
        FormBuilderValidators.min(1, errorText: 'Value >= 1 is acceptable'),
      ],
    );
  }
}
