import 'package:flutter/material.dart';

class CommonContainerTopic extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color backgroundColor;
  final Color iconBackgroundColor;
  final Color textColor;
  final ImageProvider<Object>? image;

  const CommonContainerTopic({
    super.key,
    required this.title,
    required this.description,
    this.icon = Icons.lightbulb_outline,
    this.backgroundColor = Colors.purple,
    this.iconBackgroundColor = Colors.deepPurple,
    this.textColor = Colors.white,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: image != null
                ? Image.asset(
                    'assets/icons/icon_gamini.png',
                    width: 24,
                    height: 24,
                  )
                : Icon(
                    icon,
                    color: textColor,
                  ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: textColor.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
