import 'package:flutter/material.dart';

void main() {
  runApp(MyFormApp()); // Directly calling Stateful Widget
}

class MyFormApp extends StatefulWidget {
  @override
  _MyFormAppState createState() => _MyFormAppState();
}

class _MyFormAppState extends State<MyFormApp> {
  // Controllers to get input values
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String message = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Login Form")),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              
              // USER ID FIELD
              TextField(
                controller: userIdController,
                decoration: InputDecoration(
                  labelText: "User ID",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              // PASSWORD FIELD
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              // BUTTON
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    String userId = userIdController.text;
                    String password = passwordController.text;

                    if (userId == "admin" && password == "1234") {
                      message = "Login Successful ✅";
                    } else {
                      message = "Invalid Credentials ❌";
                    }
                  });
                },
                child: Text("Login"),
              ),

              SizedBox(height: 20),

              // OUTPUT MESSAGE
              Text(
                message,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
