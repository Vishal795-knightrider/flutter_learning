import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

// 🔹 HOME WITH DRAWER + TABS
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const CounterScreen(),
    const CalculatorScreen(),
    const BMIScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("🚀 Multi App")),

      // 🔹 DRAWER
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Welcome User 👋",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.exposure_plus_1),
              title: const Text("Counter"),
              onTap: () {
                setState(() => currentIndex = 0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text("Calculator"),
              onTap: () {
                setState(() => currentIndex = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.monitor_weight),
              title: const Text("BMI"),
              onTap: () {
                setState(() => currentIndex = 2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: screens[currentIndex],

      // 🔹 BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Counter"),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Calc"),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: "BMI"),
        ],
      ),
    );
  }
}

// 🔹 COUNTER SCREEN
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[100],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Count: $count", style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() => count++);
              },
              child: const Text("Increase 🔼"),
            ),
          ],
        ),
      ),
    );
  }
}

// 🔹 CALCULATOR SCREEN
class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();
  String result = "";

  void calculate() {
    double a = double.tryParse(num1.text) ?? 0;
    double b = double.tryParse(num2.text) ?? 0;
    setState(() {
      result = "Sum: ${a + b}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(controller: num1, decoration: const InputDecoration(labelText: "Enter first number")),
          TextField(controller: num2, decoration: const InputDecoration(labelText: "Enter second number")),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: calculate, child: const Text("Calculate ➕")),
          const SizedBox(height: 20),
          Text(result, style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}

// 🔹 BMI SCREEN
class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController height = TextEditingController();
  final TextEditingController weight = TextEditingController();
  String result = "";

  void calculateBMI() {
    double h = double.tryParse(height.text) ?? 0;
    double w = double.tryParse(weight.text) ?? 0;

    if (h > 0) {
      double bmi = w / ((h / 100) * (h / 100));
      setState(() {
        result = "BMI: ${bmi.toStringAsFixed(2)}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(controller: height, decoration: const InputDecoration(labelText: "Height (cm)")),
          TextField(controller: weight, decoration: const InputDecoration(labelText: "Weight (kg)")),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: calculateBMI, child: const Text("Calculate BMI 🏃")),
          const SizedBox(height: 20),
          Text(result, style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}