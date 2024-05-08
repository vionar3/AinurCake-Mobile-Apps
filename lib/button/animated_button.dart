import 'package:flutter/material.dart';

class MyBlinkingButton extends StatefulWidget {
  const MyBlinkingButton({Key? key}) : super(key: key);

  @override
  _MyBlinkingButtonState createState() => _MyBlinkingButtonState();
}

class _MyBlinkingButtonState extends State<MyBlinkingButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.keyboard_arrow_down_outlined,color: Colors.blue,),
            Text('Are you want to customize cake? Press Below'),
            Icon(Icons.keyboard_arrow_down_outlined,color: Colors.blue,)
          ],
        ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}