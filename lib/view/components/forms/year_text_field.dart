import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:weplay_admin/view/viewUtils/styles.dart';

class YearTextField extends StatelessWidget {
  YearTextField({
    Key key,
    @required this.labelText,
    this.initialValue,
    this.autoFocus = false,
    this.focusNode,
    this.onTap,
    this.onSubmit,
    this.autoValidate = AutovalidateMode.disabled,
    this.readOnly = false,
  }) : super(key: key);
  final String labelText;
  final TextEditingController controller = TextEditingController();
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
      attribute: "year",
      controller: controller,
      autofocus: autoFocus,
      focusNode: focusNode,
      readOnly: readOnly,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      style: TextStyles.Footnote.copyWith(
        fontSize: FontSizes.s16,
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      valueTransformer: (value) {
        if (value.isNotEmpty) {
          return int.parse(value);
        }
        return value;
      },
      autovalidateMode: autoValidate,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.numeric(),
        FormBuilderValidators.maxLength(4, errorText: 'Value length <=4 is acceptable'),
      ],
    );
  }
}
