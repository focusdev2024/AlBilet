import 'package:flutter/material.dart';

class MainDatailsWidget extends StatefulWidget {
  MainDatailsWidget({super.key});

  @override
  State<MainDatailsWidget> createState() => _MainDatailsWidgetState();
}

class _MainDatailsWidgetState extends State<MainDatailsWidget> {
  List<String> items = [
    'Konsert',
    'Teatr',
    'Kinoteatr',
    'Sport',
    'Başga',
  ];

  List<IconData> icons = [
    Icons.home,
    Icons.abc,
    Icons.abc_rounded,
    Icons.ac_unit,
    Icons.access_alarm_rounded
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.all(5),
                            width: 80,
                            height: 45,
                            decoration: BoxDecoration(
                                color: current == index
                                    ? Colors.white70
                                    : Colors.white54,
                                borderRadius: current == index
                                    ? BorderRadius.circular(15)
                                    : BorderRadius.circular(10),
                                border: current == index
                                    ? Border.all(
                                        color:
                                            Theme.of(context).primaryColorLight,
                                        width: 2)
                                    : null),
                            child: Center(
                              child: Text(
                                items[index],
                                style: TextStyle(
                                    color: current == index
                                        ? Colors.black
                                        : Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                            visible: current == index,
                            child: Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).primaryColorLight),
                            ))
                      ],
                    );
                  }),
            ),
            //MAIN BODY,
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text('The Best'),
            ),
            const SizedBox(height: 5),

            SizedBox(
              height: 320,
              width: double.infinity,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (contx, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).shadowColor,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                                child: Image.asset(
                                  'assets/images/tagamly_sozler001.png',
                                  width: 300,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text('Book Name',
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                              const SizedBox(height: 5),
                              Text(
                                'Author Name',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text('New'),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
