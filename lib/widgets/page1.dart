import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF001379),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 30),
                Image.asset(
                  'assets/images/3-min.png',
                  height: 300,
                  width: 500,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            const Text(
              'សូមស្វាគមន៍មកកាន់កម្មវិធី',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Misan',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 3),
            const Text(
              'គណនាការប្រាក់',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 255, 247),
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Misan',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "គណនាប្រាក់សន្សំ និងប្រាក់កម្ចីបានយ៉ាងឆាប់រហ័ស!",
                style: TextStyle(color: Colors.white, fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page2');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF001379),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 20,
                ),
              ),
              child: const Text(
                'បន្ទាប់',
                style: TextStyle(fontFamily: 'Misan'),
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, color: Colors.blue, size: 15),
                SizedBox(width: 10),
                Icon(Icons.circle, color: Colors.white, size: 15),
                SizedBox(width: 10),
                Icon(Icons.circle, color: Colors.white, size: 15),
              ],
            ),
            const SizedBox(height: 10),
            
            const SizedBox(height: 150),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text.rich(
                TextSpan(
                  text: ' Develop by',
                  style: TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      // text: 'ក្រុមអ្នកស្រឡាញ់សន្តិតភាព',
                      text: 'JK Information Teachnology',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 255, 247),
                        fontFamily: 'Misan',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text.rich(
                TextSpan(
                  text: ' Version 1.0.0',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 255, 247),
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
