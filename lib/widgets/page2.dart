import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
                Image.asset(
                  'assets/images/4-min.png',
                  height: 260,
                  width: 380, // <-- fix height
                  fit: BoxFit.contain,
                ),
              ],
            ),
            Container(
              child: Column(
                children: [
                  const Text(
                    'គណនាផ្នែកហិរញ្ញវត្ថុជាច្រើនប្រភេទ',

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Misan',
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'ការបង់ប្រាក់កម្ចី ឬការប្រាក់សន្សំ'
                      " គ្រប់យ៉ាងដែលអ្នកត្រូវការដើម្បីគណនាហិរញ្ញវត្ថុ មាននៅទីនេះ!",
                      // "pleasant thing in the word, and it requires specific skills"
                      // "and knowledge",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/page3');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF001379),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      'បន្ទាប់',
                      style: TextStyle(fontSize: 20, fontFamily: 'Misan'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 15,
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.circle, color: Colors.blue, size: 15),
                      SizedBox(width: 10),
                      Icon(Icons.circle, color: Colors.white, size: 15),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       'English',
                  //       style: TextStyle(color: Colors.white, fontSize: 20),
                  //     ),
                  //     SizedBox(width: 20),
                  //     Text(
                  //       'ខ្មែរ',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 20,
                  //         fontFamily: 'Misan',
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
