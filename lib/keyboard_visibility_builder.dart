import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

/// A Widget reacting on keyboard visibility changes using [KeyboardVisibilityNotification]  and triggering a rebuild
class KeyboardVisibilityBuilder extends StatefulWidget {

  /// Builder used to create child widget
  final Widget Function(BuildContext, bool) builder;

  /// Callback for when the current visibility state of the keyboard changes
  final void Function(bool) onChange;

  /// Callback for when the keyboard gets opened
  final void Function() onShow;

  /// Callback for when the keyboard gets closed
  final void Function() onHide;

  /// Constructs a new [KeyboardVisibilityBuilder]
  KeyboardVisibilityBuilder({this.builder, this.onChange, this.onHide, this.onShow});

  @override
  _KeyboardVisibilityBuilderState createState() => _KeyboardVisibilityBuilderState();
}

class _KeyboardVisibilityBuilderState extends State<KeyboardVisibilityBuilder> {

  /// Holds the id defined by the notifier for later unsubscribing
  int _subscribingId;

  /// Holds the notifier which will send the keyboard events 
  KeyboardVisibilityNotification _notifier;

  /// Holds the current visibility state of the Keyboard
  bool _keyboardVisible = false;

  @override
  void initState() { 

    _notifier = KeyboardVisibilityNotification();

    /// Register the listener for updating the [_keyboardVisible] variable and triggering the rebuild
    _subscribingId = _notifier.addNewListener(
      onChange: (value) => _onVisibilityChanged(value),
      onHide: () => _onHide(),
      onShow: () => _onShow(),
    );
    super.initState();
  }

  @override
  void dispose() {
    /// Removes the listener when the widget gets disposed
    _notifier.removeListener(_subscribingId);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Building child using the [builder] parsed to the constructor
    return widget.builder(context, _keyboardVisible);
  }

  /// Callback which gets called by [_notifier] when the keyboard visibility gets changed
  void _onVisibilityChanged(bool isVisible) {
    setState(() {
      _keyboardVisible = isVisible;
    });
    
    if (widget.onChange != null) {
      widget.onChange(isVisible);
    } 
  }

  /// Callback which gets called by [_notifier] when the keyboard gets dismissed
  void _onHide() {
    if (widget.onHide != null) {
      widget.onHide();
    }
  }

  /// Callback which gets called by [_notifier] when the keyboard gets opened
  void _onShow() {
    if (widget.onShow != null) {
      widget.onShow();
    }
  }
}