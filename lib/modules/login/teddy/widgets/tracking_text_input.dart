import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:microblogging/assets/style.dart';
import 'package:microblogging/modules/login/teddy/widgets/input_helper.dart';

typedef void CaretMoved(Offset globalCaretPosition);
typedef void TextChanged(String text);

/*

    O Teddy foi pego pronto na internet.
    Essa classe foi pega pronta da internet.



*/

// Helper widget to track caret position.
class TrackingTextInput extends StatefulWidget {
  TrackingTextInput(
      {Key key,
      this.onCaretMoved,
      this.onTextChanged,
      this.onFocusChange,
      this.validator,
      this.textController,
      this.hint,
      this.label,
      this.isObscured = false})
      : super(key: key);
  final CaretMoved onCaretMoved;
  final TextChanged onTextChanged;
  final Function onFocusChange;
  final Function validator;
  final TextEditingController textController;
  final String hint;
  final String label;
  final bool isObscured;
  @override
  _TrackingTextInputState createState() => _TrackingTextInputState();
}

class _TrackingTextInputState extends State<TrackingTextInput> {
  final GlobalKey _fieldKey = GlobalKey();
  // final TextEditingController widget.textController = TextEditingController();
  Timer _debounceTimer;
  @override
  initState() {
    widget.textController.addListener(() {
      // We debounce the listener as sometimes the caret position is updated after the listener
      // this assures us we get an accurate caret position.
      if (_debounceTimer?.isActive ?? false) _debounceTimer.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 100), () {
        if (_fieldKey.currentContext != null) {
          // Find the render editable in the field.
          final RenderObject fieldBox =
              _fieldKey.currentContext.findRenderObject();
          Offset caretPosition = getCaretPosition(fieldBox);

          if (widget.onCaretMoved != null) {
            widget.onCaretMoved(caretPosition);
          }
        }
      });
      if (widget.onTextChanged != null) {
        widget.onTextChanged(widget.textController.text);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Focus(
        onFocusChange: widget.onFocusChange,
        child: TextFormField(
          decoration:
              Style.inputDecoration(hint: widget.hint, label: widget.label),
          key: _fieldKey,
          controller: widget.textController,
          obscureText: widget.isObscured,
          validator: widget.validator,
        ),
      ),
    );
  }
}
