import 'package:flutter/material.dart';

class HorizontalCategorySection extends StatelessWidget {
  final List<String> categories;
  final Color backgroundColor;
  final List<IconData> icons;
  final Function(int index, String category)? onCategoryTap;

  const HorizontalCategorySection({
    super.key,
    required this.categories,
    required this.backgroundColor,
    required this.icons,
    this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                categories.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: GestureDetector(
                    onTap: () {
                      if (onCategoryTap != null) {
                        onCategoryTap!(index, categories[index]);
                      }
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: backgroundColor,
                          child: Icon(
                            icons[index],
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: 70, // Fixed width to prevent overflow
                          child: Text(
                            categories[index],
                            style: const TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
