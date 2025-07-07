import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

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
                const SizedBox(height: 10),
                Image.asset(
                  'assets/images/1-min.png',
                  height: 220,
                  width: 400,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  const Text(
                    'រក្សាទុកលទ្ធផលរបស់អ្នកជា PDF',
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
                      "អាចបោះពុម្ព ឬរក្សាទុកបានយ៉ាងងាយស្រួល"
                      "សម្រាប់ការតាមដាន និងធ្វើការសម្រេចចិត្តប្រកបដោយភាពច្បាស់លាស់។",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/typeInterest');
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
                      style: TextStyle(fontSize: 20, fontFamily: 'M6.isan'),
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
                      Icon(
                        Icons.circle,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 15,
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.circle, color: Colors.blue, size: 15),
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
