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

  List<ColorContainer> _containers = [
    ColorContainer(),
    ColorContainer(),
    ColorContainer(),
    ColorContainer(),
    ColorContainer(),
    ColorContainer(),
    ColorContainer(),
    ColorContainer(),
    ColorContainer(),
    ColorContainer(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _containers)
      ],
    );
  }
}

class ColorContainer extends StatefulWidget {
  ColorContainer({Key});

  @override
  _ColorContainerState createState() => _ColorContainerState();
}

class _ColorContainerState extends State<ColorContainer> {
  Color _currentColor = AppColors.mainBlue;

  void _changeColor() {
    setState(() {
      _currentColor = _currentColor == AppColors.mainBlue
          ? AppColors.mainYellow
          : AppColors.mainBlue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              color: _currentColor, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
