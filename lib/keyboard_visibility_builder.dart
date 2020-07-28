import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

/// A Widget reacting on keyboard visibility changes using [KeyboardVisibilityNotification]  and triggering a rebuild
class KeyboardVisibilityBuilder extends StatefulWidget {

  /// Builder used to create child widget
  final Widget Function(BuildContext, bool) builder;

  /// Constructs a new [KeyboardVisibilityBuilder]
  KeyboardVisibilityBuilder({this.builder});

  @override
  _KeyboardVisibilityBuilderState createState() => _KeyboardVisibilityBuilderState();
}

class _KeyboardVisibilityBuilderState extends State<KeyboardVisibilityBuilder> {

  /// Holds the current visibility state of the Keyboard
  bool _keyboardVisible = false;

  @override
  void initState() { 

    /// Register the listener for updating the [_keyboardVisible] variable and triggering the rebuild
    KeyboardVisibilityNotification().addNewListener(
      onChange: (visible) => setState(() => _keyboardVisible = visible)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Building child using the [builder] parsed to the constructor
    return widget.builder(context, _keyboardVisible);
  }
}