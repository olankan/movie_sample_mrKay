import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPageView(),
    );
  }
}

class MyPageView extends StatefulWidget {
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageView Animation Example')),
      body: PageView(
        onPageChanged: (int page) {
          if (page != currentPage) {
            currentPage = page;
            if (currentPage % 2 == 0) {
              // Trigger a random animation here based on the condition (if current page number is even)
              // Add your random animation logic here
             Text('Random Animation').animate().slide();
            }
          }
        },
        children: [
          Container(color: Colors.blue),
          Container(color: Colors.green),
          Container(color: Colors.red),
        ],
      ),
    );
  }
}
