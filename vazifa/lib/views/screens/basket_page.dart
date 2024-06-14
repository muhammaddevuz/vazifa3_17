import 'package:dars_3_9_uy_ishi/model/course.dart';
import 'package:dars_3_9_uy_ishi/utils/app_constants.dart';
import 'package:dars_3_9_uy_ishi/views/screens/course_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BasketPage extends StatefulWidget {
  Course course;
  BasketPage({super.key, required this.course});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  double price = 0;
  int courseCount = 0;
  @override
  void initState() {
    for (var i = 0; i < AppConstants.lessons.length; i++) {
      if (AppConstants.lessons[i].basketCheck) {
        price += AppConstants.lessons[i].price;
        courseCount++;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseScreen(course: widget.course),
                ));
          },
        ),
        title: Text("Basket"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          for (var i = 0; i < AppConstants.lessons.length; i++)
            if (AppConstants.lessons[i].basketCheck)
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppConstants.lessons[i].description,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${AppConstants.lessons[i].price} \$",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            AppConstants.lessons[i].basketCheck = false;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BasketPage(
                                    course: widget.course,
                                  ),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: const Text(
                              "Savatdan olish",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$courseCount ta kurs jami narx: $price\$",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            InkWell(
              onTap: () {
                for (var i = 0; i < AppConstants.lessons.length; i++) {
                  if (AppConstants.lessons[i].basketCheck) {
                    AppConstants.lessons[i].buyCheck = true;
                    AppConstants.lessons[i].basketCheck = false;
                    price = 0;
                    courseCount = 0;
                  }
                }
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: const Text(
                  "Sotib olish",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
