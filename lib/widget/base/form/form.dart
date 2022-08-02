import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:resto_mobile/widget/base/extention/ext_string.dart';

enum FormType { text, email, phone, password, money, multiLine }

class OFormText extends StatefulWidget {
  final String title;
  final String? hintText;
  final TextEditingController? controller;
  final bool isRequired;
  final FormType formType;
  final int maxLines;
  final bool readOnly;

  const OFormText({
    Key? key,
    required this.title,
    this.controller,
    this.isRequired = true,
    this.formType = FormType.text,
    this.hintText,
    this.maxLines = 1,
    this.readOnly = false,
    }) : super(key: key);

  @override
  State<OFormText> createState() => _OFormTextState();
}

class _OFormTextState extends State<OFormText> {
  String? checkValidation(String value) {
    if (widget.isRequired) {
      if (value.isEmpty) {
        return '${widget.title.toUpperCase()} TIDAK BOLEH KOSONG';
      }
    }
    if (widget.formType == FormType.phone) {
      if (int.tryParse(value) == null) {
        return '${widget.title.toUpperCase()} HANYA ANGKA SAJA';
      }
    }
    if (widget.formType == FormType.email) {
      String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?)*$";
      RegExp regex = RegExp(pattern);
      if (value.trim().isNotEmpty && !regex.hasMatch(value.trim())) {
        return '${widget.title.toUpperCase()} HARUS VALID EMAIL';
      }
    }
    return null;
  }

  List<TextInputFormatter>? maskFormat(FormType type) {
    if (type == FormType.phone) {
      return [
        MaskTextInputFormatter(
          mask: '#### #### #### ##',
          filter: {"#": RegExp(r'[0-9]')},
        )
      ];
    } else if (type == FormType.money) {
      return [FilteringTextInputFormatter.digitsOnly];
    }
    return [];
  }

  bool obscureText = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.formType == FormType.password) obscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.primary),
          ),
          TextFormField(
            readOnly: widget.readOnly,
            maxLines: widget.maxLines,
            validator: (value) => checkValidation(value!),
            controller: widget.controller,
            keyboardType: textInputType(widget.formType),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            // inputFormatters: maskFormat(formType),
            decoration: InputDecoration(
              // border: InputBorder.none,
              hintText: widget.hintText ?? 'Masukkan ${widget.title.capitalizeText()}',
              // hintStyle: TextStyle(fontSize: gstate.bodyTextSize)
              suffixIcon: (widget.formType == FormType.password)
                  ? InkWell(
                      child: Icon((obscureText) ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    )
                  : SizedBox.shrink(),
            ),
            obscureText: obscureText,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  TextInputType textInputType(FormType formType) {
    if (formType == FormType.multiLine) {
      return TextInputType.multiline;
    } else if (formType == FormType.phone) {
      return TextInputType.number;
    } else if (formType == FormType.money) {
      return TextInputType.number;
    } else {
      return TextInputType.text;
    }
  }
}
