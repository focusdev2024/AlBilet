import 'package:flutter/material.dart';
import 'package:online_library/tools/colors/albilet_colors.dart';

class TablesWidget extends StatefulWidget {
  const TablesWidget({super.key});

  @override
  State<TablesWidget> createState() => _TablesWidgetState();
}

class _TablesWidgetState extends State<TablesWidget> {
  Color _containerColor = AppColors.mainBlue;

  void _changeColor() {
    setState(() {
      _containerColor = _containerColor == AppColors.mainBlue
          ? AppColors.mainYellow
          : AppColors.mainBlue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: _changeColor,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: _containerColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            GestureDetector(
              onTap: _changeColor,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: _containerColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        )
      ],
    );
  }
}
