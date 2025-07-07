import 'package:flutter/material.dart';
import 'package:interest_calculator/widgets/type_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

final List<String> shareOptions = ['ចែករំលែក', 'facebook', 'Telegram'];
final List<String> Loanlist = [
  'រំលស់ថយចុះ ឬ​រំលស់ដើមថេរ',
  'បង់រំលស់ថេរ',
  'សំណងពាក់កណ្តាល-កណ្តាល',
  'សងការរាល់ខែ​ និងទូទាត់ដើមនៅចុងកាលបរិច្ឆេទ',
  'កម្ចីសងតែម្តង',
  'ផ្គួបការប្រាក់',
];
final List<String> Savelist = [
  'គណនីសន្សំធម្មតា',
  'បញ្ញើថេរ',
  'ការសន្សំប្រចាំខែ',
  'គណនីសន្សំអត្រាការប្រាក់ខ្ពស់',
  'គណនីសន្សំសម្រាប់កុមារ',
  'គណនីសន្សំសម្រាប់គោលដៅជាក់លាក់',
];

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          centerTitle: true,
          shape: LinearBorder.bottom(
            side: const BorderSide(
              color: Color.fromARGB(255, 255, 255, 255),
              width: 2,
            ),
          ),
          backgroundColor: const Color(0xFF001379),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'ព័ត៌មានទូទៅ',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: 'Misan',
            ),
          ),
        ),
        body: const Column(children: [Expanded(child: ListsWithCards())]),
      ),
    );
  }
}

class ListsWithCards extends StatelessWidget {
  const ListsWithCards({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [loan(), Save(), shareMe(), AboutUsCard()],
    );
  }
}

class loan extends StatelessWidget {
  const loan({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const ListTile(
            title: Text(
              'ស្វែងយល់អំពីប្រភេទនៃកម្ចី',
              style: TextStyle(
                fontFamily: 'Misan',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          ListView.builder(
            itemCount: Loanlist.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                title: Text(
                  Loanlist[index],
                  style: const TextStyle(fontFamily: 'Misan'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TypeInfo(title: Loanlist[index]),
                    ),
                  );
                },
                trailing: const Icon(Icons.arrow_forward_ios, size: 20),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Save extends StatelessWidget {
  const Save({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const ListTile(
            title: Text(
              'ស្វែងយល់អំពីប្រភេទនៃការសន្សំ',
              style: TextStyle(
                fontFamily: 'Misan',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          ListView.builder(
            itemCount: Savelist.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                title: Text(
                  Savelist[index],
                  style: const TextStyle(fontFamily: 'Misan'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TypeInfo(title: Savelist[index]),
                    ),
                  );
                },
                trailing: const Icon(Icons.arrow_forward_ios, size: 20),
              );
            },
          ),
        ],
      ),
    );
  }
}

class shareMe extends StatelessWidget {
  const shareMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              shareOptions[0],
              style: const TextStyle(
                fontFamily: 'Misan',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          ListView.builder(
            itemCount: shareOptions.length - 1,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.share_rounded),
                title: Text(
                  'ចែករំលែកទៅ ${shareOptions[index + 1]}',
                  style: const TextStyle(fontFamily: 'Misan'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AboutUsCard extends StatefulWidget {
  const AboutUsCard({super.key});

  @override
  State<AboutUsCard> createState() => _AboutUsCardState();
}

class _AboutUsCardState extends State<AboutUsCard> {
  final Uri facebookUrl = Uri.parse(
    'https://www.facebook.com/share/1BrM5usTFJ/?mibextid=qi2Omg',
  );
  final Uri telegramUrl = Uri.parse('https://t.me/+855978597137');

  final TapGestureRecognizer _facebookTap = TapGestureRecognizer();
  final TapGestureRecognizer _telegramTap = TapGestureRecognizer();

  @override
  void initState() {
    super.initState();

    _facebookTap.onTap = () async {
      if (!await launchUrl(facebookUrl, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $facebookUrl';
      }
    };

    _telegramTap.onTap = () async {
      if (!await launchUrl(telegramUrl, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $telegramUrl';
      }
    };
  }

  @override
  void dispose() {
    _facebookTap.dispose();
    _telegramTap.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const ListTile(
            title: Text(
              'អំពីយើង',
              style: TextStyle(
                fontFamily: 'Misan',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              textAlign: TextAlign.left,
              text: const TextSpan(
                style: TextStyle(
                  fontFamily: 'Misan',
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: '  សូមស្វាគមន៍មកកាន់កម្មវិធី '),
                  TextSpan(
                    text: 'គណនាការប្រាក់',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'មិនថាអ្នកជាអ្នកខ្ចី ឬអោយគេខ្ចីឡើយ កម្មវិធីរបស់យើងនឹងជួយអ្នកកាត់បន្ថយពេលវេលា'
                        'និងកំហុសក្នុងការគណនាបានយ៉ាងមានប្រសិទ្ធភាព។ មួយផ្នែកធំនៃកម្មវិធីនេះដកស្រង់ចេញពីសៀវភៅ',
                  ),
                  TextSpan(
                    text:
                        ' ការគ្រប់គ្រងឥណទាន (មុខវិជ្ជា Credit Management) នៃសាកលវិទ្យាល័យជាតិបាត់ដំបង។',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // TextSpan(
                  //   text:
                  //       'ដោយគ្រាន់តែបញ្ជូលចំនួនប្រាក់ដើម អត្រាការប្រាក់ និងរយៈពេលសងប្រាក់',
                  // ),
                  TextSpan(
                    text:
                        // 'កម្មវិធីនឹងធ្វើការគណនាតារាងបង់ប្រាក់ឲ្យអ្នកភ្លាមៗ។'
                        ' សូមអរគុណចំពោះការជ្រើសរើសប្រើកម្មវិធីរបស់យើង។'
                        ' ប្រសិនបើអ្នកមានយោបល់ ឬសំណើសុំមុខងារថ្មី សូមកុំស្ទាក់ស្ទើរក្នុងការទំនាក់ទំនងមកកាន់ពួកយើង!',
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontFamily: 'Misan',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(
                      text: '\nFACEBOOK:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' JK Information technology',
                      
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: _facebookTap,
                    ),
                    const TextSpan(
                      text: '\nTELEGRAM:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' 097 85 97 137',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: _telegramTap,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 400,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 7, 19, 255),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(10),
            child: const Center(
              child: Text.rich(
                TextSpan(
                  text: ' Develop by',
                  style: TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: ' JK Information Teachnology',
                     
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 255, 247),
                        fontFamily: 'Misan',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
