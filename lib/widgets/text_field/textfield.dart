import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/const/paddings.dart';
import 'package:places/const/sizes.dart';
import 'package:places/providers/addprovider.dart';
import 'package:places/widgets/button/but_in_textfield.dart';
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
    this.prefixIcon,
    this.filled,
    this.predBorderDecoration,
    this.filledColor,
    this.hintText,
    this.suffixWidget,
    this.onTap,
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
  final Widget? prefixIcon;
  final bool? filled;
  final bool? predBorderDecoration;
  final Color? filledColor;
  final String? hintText;
  final Widget? suffixWidget;
  final Function()? onTap;

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
    var theme = Theme.of(context);
    return SizedBox(
      height: widget.multiLine ? null : 40,
      child: TextField(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
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
          hintText: widget.hintText,
          hintStyle:
              theme.textTheme.bodyText1?.copyWith(color: theme.disabledColor),
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
              : widget.suffixWidget,
          prefixIcon: widget.prefixIcon,
          // prefixIcon: const Padding(
          //   padding: EdgeInsets.all(10.0),
          //   child: SvgIcon(
          //     assetName: AppIcons.iconSearch,
          //     color: Colors.black,
          //     height: 24,
          //     width: 24,
          //   ),
          // ),
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
          filled: widget.filled,
          fillColor: widget.filledColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(AppSizes.radiusBtnImageSlider),
            borderSide: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .tertiaryContainer
                  .withOpacity(0.0),
              width: widget.predBorderDecoration == null ? 1 : 0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(AppSizes.radiusBtnImageSlider),
            borderSide: BorderSide(
              color: theme.colorScheme.tertiaryContainer.withOpacity(0.4),
              width: widget.predBorderDecoration == null ? 2 : 0,
            ),
          ),
        ),
        style: theme.textTheme.bodyText1
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
