import 'package:flutter/material.dart';
import 'package:todo/views/components/round_button.dart';

class AddTodoWidget extends StatelessWidget {
  final Function onAdd;
  final TextEditingController controller;

  const AddTodoWidget({
    super.key,
    required this.onAdd,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 20,
                right: 20,
                left: 20,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset.zero,
                    blurRadius: 10,
                    spreadRadius: 0,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: "Add a todo",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 20,
              right: 20,
            ),
            child: RoundButton(
              onTap: onAdd,
              icon: Icons.add,
            ),
          ),
        ],
      ),
    );
  }
}
