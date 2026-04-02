import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Row Column + Shadow"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // 🔹 Row (horizontal)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                // Box 1
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                ),

                // Box 2
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 40),

            // 🔹 Column (vertical)
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 12,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Center Box",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}