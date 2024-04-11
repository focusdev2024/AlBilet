import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:online_library/widgets/style_button_widget.dart';

class ReadAndBuyPage extends StatefulWidget {
  const ReadAndBuyPage({super.key});

  @override
  State<ReadAndBuyPage> createState() => _ReadAndBuyPageState();
}

class _ReadAndBuyPageState extends State<ReadAndBuyPage> {
  double value = 3.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 230,
                  height: 340,
                  child: Placeholder(),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Name of the book',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                const Text(
                  'Author of the book',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                RatingStars(
                  value: value,
                  onValueChanged: (v) {
                    //
                    setState(() {
                      value = v;
                    });
                  },
                  starBuilder: (index, color) => Icon(
                    Icons.star,
                    color: color,
                  ),
                  starCount: 5,
                  starSize: 20,
                  valueLabelColor: const Color(0xff9b9b9b),
                  valueLabelTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  valueLabelRadius: 10,
                  maxValue: 5,
                  starSpacing: 2,
                  maxValueVisibility: true,
                  valueLabelVisibility: true,
                  animationDuration: const Duration(milliseconds: 1000),
                  valueLabelPadding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                  valueLabelMargin: const EdgeInsets.only(right: 8),
                  starOffColor: const Color(0xffe7e8ea),
                  starColor: Colors.yellow,
                ),
                const SizedBox(height: 20),
                const Text('About the author'),
                const Text(
                  'About the author text',
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Ovedview',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Overview text',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 20,
                ),
                StyleButtonWidget(
                    buttonName: 'Buy',
                    onTap: () {},
                    buttonColor: Colors.red,
                    buttonBorderColor: Colors.white,
                    buttonTextColor: Colors.white),
                const SizedBox(height: 20),
                StyleButtonWidget(
                    buttonName: 'Read',
                    onTap: () {},
                    buttonColor: Colors.white,
                    buttonBorderColor: Colors.white,
                    buttonTextColor: Colors.red)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
