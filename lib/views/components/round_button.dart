import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RoundButton extends StatelessWidget {
  final Function onTap;
  final IconData icon;

  const RoundButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: Colors.blue,
        minimumSize: const Size(60, 60),
        elevation: 10,
      ),
      child: Icon(
        icon,
        size: 30,
      ),
    );
  }
}
