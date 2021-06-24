import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:weplay_admin/view/viewUtils/styles.dart';

class ContactField extends StatelessWidget {
  final String labelText;
  final String initialValue;
  final TextEditingController controller = TextEditingController();
  final bool autoFocus;
  final FocusNode focusNode;
  final Function(String) onSubmit;
  final Function() onTap;

  ContactField({
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
    return FormBuilderPhoneField(
      attribute: 'contact',
      autofocus: autoFocus,
      focusNode: focusNode,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      style: TextStyles.Footnote.copyWith(
        fontSize: FontSizes.s16,
      ),
      controller: controller,
      defaultSelectedCountryIsoCode: 'NP',
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      // style: TextStyle(color: Colors.black, fontSize: 18),
      decoration: InputDecoration(
        labelText: labelText,
      ),
      onChanged: (value) {},
      priorityListByIsoCode: ['NP'],
      maxLength: 10,
      validators: [
        FormBuilderValidators.required(errorText: 'This field required'),
        FormBuilderValidators.numeric(),
      ],
    );
  }
}
