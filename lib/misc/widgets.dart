import 'package:flutter/material.dart';

class ECommerceItem extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final bool selected;
  const ECommerceItem({
    required this.onPressed,
    this.selected = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: selected
                ? Theme.of(context).primaryColor
                : Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                offset: Offset(4, 4),
                blurRadius: 5,
                color: Colors.black.withOpacity(0.2),
              ),
            ],
          ),
          child: Text(title),
        ),
      ),
    );
  }
}
