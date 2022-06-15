import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:places/const/paddings.dart';
import 'package:places/const/sizes.dart';
import 'package:places/providers/addprovider.dart';
import 'package:places/widgets/button/but_in_textfield.dart';
import 'package:places/widgets/text_field/clear_text_controller.dart';
import 'package:provider/provider.dart';

class TextFieldDesigned extends StatefulWidget {
  const TextFieldDesigned({
    Key? key,
    this.isNumeric = false,
    this.multiLine = false,
    this.controller,
    // this.clearButton,
    this.onChanged,
    this.onSubmited,
    this.maxLenght,
    this.focusNode,
    this.fAddToOnChanged,
    this.inputFormaters,
    // this.inputFormaters,
  }) : super(key: key);

  final bool multiLine;
  final TextEditingController? controller;
  // final ClearTextController? clearButton;
  final bool isNumeric;
  final Function(String)? onChanged;
  final Function(String)? onSubmited;
  final Function(String)? fAddToOnChanged;
  final int? maxLenght;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormaters;

  @override
  State<TextFieldDesigned> createState() => _TextFieldDesignedState();
}

class _TextFieldDesignedState extends State<TextFieldDesigned> {
  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() {
      setState(() {});
      Provider.of<AddSight>(context, listen: false).filterAndNotify();
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.multiLine ? null : 40,
      child: TextField(
        focusNode: widget.focusNode,
        maxLength: widget.maxLenght,
        onChanged: onChange,
        onSubmitted: widget.onSubmited,
        inputFormatters: widget.inputFormaters,
        keyboardType: widget.isNumeric ? TextInputType.number : null,
        controller: widget.controller,
        minLines: widget.multiLine ? 3 : 1,
        maxLines: widget.multiLine ? null : 1,
        decoration: InputDecoration(
          counterText: "",
          suffixIcon: widget.controller?.text != ""
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClearButtonForController(onClear: onClear),
                  ],
                )
              : null,
          contentPadding: AppPadding.contentNormalAll,
          // border: OutlineInputBorder(
          //   borderRadius: const BorderRadius.all(AppSizes.radiusBtnImageSlider),
          //   borderSide: BorderSide(
          //     color: Theme.of(context)
          //         .colorScheme
          //         .tertiaryContainer
          //         .withOpacity(0.4),
          //     width: 1,
          //   ),
          // ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(AppSizes.radiusBtnImageSlider),
            borderSide: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .tertiaryContainer
                  .withOpacity(0.4),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(AppSizes.radiusBtnImageSlider),
            borderSide: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .tertiaryContainer
                  .withOpacity(0.4),
              width: 2,
            ),
          ),
        ),
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }

  void onChange(String text) {
    // widget.clearButton?.onChanged(text);
    widget.onChanged != null ? widget.onChanged!(text) : null;
    if (widget.fAddToOnChanged != null) {
      widget.fAddToOnChanged!(text);
    }
    setState(() {});
  }

  void onClear() {
    widget.controller?.text = "";
    if (widget.fAddToOnChanged != null) {
      widget.fAddToOnChanged!("");
    }
    setState(() {});
  }
}
