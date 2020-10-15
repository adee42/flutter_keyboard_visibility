# keyboard_visibility_hybrid

clone from https://github.com/adee42/flutter_keyboard_visibility
在原有库的基础上适配了Android混合栈，给原先的库提了pr，但貌似已经没人维护了，自己发个
Notification service for soft-keyboard visibility

# Usage

```
keyboard_visibility_hybrid: ^0.0.1
```

(Please note that the two spaces in the beginning of the line are important)
Run 'flutter packages get' in your root folder after saving the pubspec.yaml file.
For additional documentation about the pubspec.yaml file please refer to the official flutter documentation
[using packages](http://flutter.io/docs/development/packages-and-plugins/using-packages)


Import `package:keyboard_visibility/keyboard_visibility.dart`, instantiate `KeyboardVisibilityNotification`
and use the Android and iOS notifications to get events about changes of the visibility of the soft-keyboard

The best practice to call the addNewListener function is inside the initState function as in the following example:

```dart
import 'package:keyboard_visibility/keyboard_visibility.dart';

@protected
void initState() {
  super.initState();

  KeyboardVisibilityNotification().addNewListener(
    onChange: (bool visible) {
      print(visible);
    },
  );
}
```

Also check out the example included with the package

## Getting Started

For help getting started with Flutter, view the following online
[documentation](http://flutter.io/).