import 'package:flutter/material.dart';
import 'package:interest_calculator/widgets/save_interest.dart';
import 'input_loan.dart';
import 'info.dart';

class TypeInteret extends StatelessWidget {
  final List<String> menuItems = [
    'រំលស់ថយចុះ ឬ​រំលស់ដើមថេរ',
    'បង់រំលស់ថេរ',
    'សំណងពាក់កណ្តាល-ពាក់កណ្តាល',
    'សងការរាល់ខែ​ និងទូទាត់ដើមនៅចុងកាលបរិច្ឆេទ',
    'កម្ចីសងតែម្តង',
    'ផ្គួបការប្រាក់',
  ];
  final List<bool> _text = [true, false];

  TypeInteret({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_rounded, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Page5()),
              );
            },
          ),
        ],

         backgroundColor: const Color(0xFF001379),
        title: const Text(
          'គណនាការប្រាក់',

          style: TextStyle(color: Colors.white, fontFamily: 'Misan'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(5)),
            Container(
              height: 50,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.all(16),
              child: Center(
                child: ToggleButtons(
                  isSelected: _text,
                  color: const Color(0xFF001379),
                  selectedColor: const Color.fromARGB(255, 255, 255, 255),
                  fillColor: const Color(0xFF001379),
                  borderColor: const Color(0xFF001379),
                  selectedBorderColor: const Color(0xFF001379),
                  splashColor: Colors.blue,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < _text.length; i++) {
                        _text[i] = i == index;
                      }
                    });
                    // Navigate based on selection
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => TypeInteret()),
                      );
                    } else if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SaveInterest()),
                      );
                    }
                  },
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        'កម្ចី',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Misan',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        'សន្សំ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Misan',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(color: Colors.blue, width: 400, height: 1),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                InputScreen(title: menuItems[index]),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF001379),
                        foregroundColor: Colors.white,
                        elevation: 4,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        menuItems[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Misan',
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
