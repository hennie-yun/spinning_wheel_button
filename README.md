## Features

This package provides a circular spinning wheel with up to 8 buttons.  
It’s designed to be visually appealing and highly customizable.  
Feel free to tailor it to your needs and make it look beautiful!

## Preview
![Spinning Wheel Example](demo.gif)

## Getting Started

To use the `spinning_wheel_button` package, follow the steps below:

### 1. Add Dependency
Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  spinning_wheel_button: <latest-version>
``` 

### 2. Run pub get
```
flutter pub get
```

### 3. Import package 
```
import 'package:spinning_wheel_button/spinning_wheel_button.dart';
```

## Usage 

### Simple usage 

```dart
class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: WheelButton(
                    bottom: 20,
                    containerSize: 300,
                    containerBgColor: Colors.white,
                    showLines: true,
                    borderColor: Colors.transparent,
                    borderWidth: 2,
                    centerWidget: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.circle, size: 56, color: Colors.green),
                    ),
                    buttons: [
                      EachButton(
                        icon: Icons.music_note,
                        imageOrIconColor : Colors.green,
                        label: 'music',
                        labelStyle: const TextStyle(fontSize: 15),
                        onTap: () {
                          print('Button 1 clicked');
                        },
                      ),
                      EachButton(
                        icon: Icons.person_outline_sharp,
                        imageOrIconColor : Colors.green,

                        label: 'myPage',
                        labelStyle: const TextStyle(fontSize: 15),
                        onTap: () {
                          print('Button 2 clicked');
                        },
                      ),
                      EachButton(
                        icon: Icons.pin_drop,
                        imageOrIconColor : Colors.green,

                        label: 'location',
                        labelStyle: const TextStyle(fontSize: 15),
                        onTap: () {
                          print('Button 3 clicked');
                        },
                      ),
                      EachButton(
                        icon: Icons.mic_none_sharp,
                        imageOrIconColor : Colors.green,

                        label: 'record',
                        labelStyle: const TextStyle(fontSize: 15),
                        onTap: () {
                          print('Button 4 clicked');
                        },
                      ),
                      EachButton(
                        icon: Icons.qr_code,
                        imageOrIconColor : Colors.green,

                        label: 'qr_code',
                        labelStyle: const TextStyle(fontSize: 15),
                        onTap: () {
                          print('Button 5 clicked');
                        },
                      ),
                      EachButton(
                        icon: Icons.photo_camera,
                        imageOrIconColor : Colors.green,

                        label: 'photo',
                        labelStyle: const TextStyle(fontSize: 15),
                        onTap: () {
                          print('Button 6 clicked');
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Text('Click Me'),
        ),
      ),
    );
  }
}
```

You can add up to 8 buttons and customize the central button (centerWidget) to include any functionality you desire. Lines can also be added, so feel free to use it as creatively as you'd like!


## Author 
✨ Haehyeon yun (hennie) ✨ 

