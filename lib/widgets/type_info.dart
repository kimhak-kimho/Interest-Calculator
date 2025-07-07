import 'package:flutter/material.dart';

class TypeInfo extends StatefulWidget {
  final String title;

  const TypeInfo({super.key, required this.title});

  @override
  State<TypeInfo> createState() => _TypeInfoState();
}

class _TypeInfoState extends State<TypeInfo> {
  @override
  Widget build(BuildContext context) {
    String appbar;
    Widget description = const SizedBox();
    switch (widget.title) {
      case 'រំលស់ថយចុះ ឬ​រំលស់ដើមថេរ':
        appbar = 'ស្វែងយល់អំពីប្រភេទនៃកម្ចី';
        description = const Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            text: 'នេះជាវិធីបង់ប្រាក់ដែលប្រាក់ដើមត្រូវបាន',
            style: TextStyle(
              fontFamily: 'Misan',
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: 'បង់ស្មើៗគ្នារៀងរាល់ខែ',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Misan',
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    '។ ការប្រាក់ត្រូវគណនាតាមប្រាក់ដើមដែលនៅសល់។ ដោយសារតែប្រាក់ដើមថយចុះជារៀងរាល់ខែ ការប្រាក់ក៏ថយចុះ។ ដូច្នេះ ប្រាក់សរុបដែលត្រូវបង់ប្រចាំខែក៏នឹងថយចុះផងដែរ។ វិធីសាស្រ្តនេះផ្តល់អត្ថប្រយោជន៍ចំពោះអតិថិជនដែលចង់បង់ប្រាក់ដើមឱ្យបានលឿន។',
                style: TextStyle(
                  fontFamily: 'Misan',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
        break;
      case 'បង់រំលស់ថេរ':
        appbar = 'ស្វែងយល់អំពីប្រភេទនៃកម្ចី';
        description = const Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            text: 'វិធីនេះបង់ប្រាក់ ',
            style: TextStyle(
              fontFamily: 'Misan',
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: 'ប្រចាំខែថេរ',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Misan',
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    ' ដោយក្នុងនោះរួមមានការប្រាក់និងប្រាក់ដើម។ ការប្រាក់ត្រូវគណនាលើប្រាក់ដើមដែលនៅសល់។ នៅដើមរយៈពេលបង់ ការប្រាក់មានចំណែកច្រើន ជាងប្រាក់ដើម។ បន្ទាប់មកប្រាក់ដើមនឹងកើនឡើងស្របនឹងការបន្ថយនៃការប្រាក់។ វិធីនេះងាយស្រួលក្នុងការធ្វើផែនការហិរញ្ញវត្ថុ។',
                style: TextStyle(
                  fontFamily: 'Misan',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );

        break;

      case 'សំណងពាក់កណ្តាល-កណ្តាល':
        appbar = 'ស្វែងយល់អំពីប្រភេទនៃកម្ចី';

        description = const Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            text:
                'វិធីសាស្រ្តនេះ គឺជាការទូទាត់សំណង ប្រចាំខែ ដែលក្នុងនោះរួមមាន ការទូទាត់ការប្រាក់ប្រចាំខែ និង',
            style: TextStyle(
              fontFamily: 'Misan',
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: 'ប្រាក់ដើមនៅពាក់កណ្តាលកាលបរិច្ឆេទ',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Misan',
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    ' ហើយពាក់កណ្តាលទៀតទូទាត់ នៅចុងកាលបរិច្ឆេទ។​ វិធីនេះអាចជួយបន្ថយបន្ទុកសាច់ប្រាក់នៅដើមរយះពេល និងអនុវត្តបានល្អសម្រាប់អាជីវកម្មខ្លះៗដែលទទួលចំណូលជាច្រើននៅចុងពេល។',
                style: TextStyle(
                  fontFamily: 'Misan',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );

        break;

      case 'សងការរាល់ខែ​ និងទូទាត់ដើមនៅចុងកាលបរិច្ឆេទ':
        appbar = 'ស្វែងយល់អំពីប្រភេទនៃកម្ចី';
        description = const Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            text: 'អតិថិជនត្រូវបង់តែ',
            style: TextStyle(
              fontFamily: 'Misan',
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: 'ការប្រាក់រៀងរាល់ខែ',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Misan',
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'ហើយបង់ប្រាក់ដើមទាំងមូលនៅខែចុងក្រោយ។ វិធីនេះសមស្របសម្រាប់អ្នកដែលចង់មានសាច់ប្រាក់សល់ប្រើនៅពេលដំបូង ហើយមានប្រាក់ចំណូលធំនៅចុងបញ្ចប់។',
                style: TextStyle(
                  fontFamily: 'Misan',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );

        break;

      case 'កម្ចីសងតែម្តង':
        appbar = 'ស្វែងយល់អំពីប្រភេទនៃកម្ចី';
        description = const Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            text: 'វិធីសាស្រ្តនេះគឺ',
            style: TextStyle(
              fontFamily: 'Misan',
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: 'បង់ប្រាក់ដើម និងការប្រាក់ទាំងមូល',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Misan',
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'នៅចុងកាលបរិច្ឆេទ។ វាធម្មតាត្រូវបានប្រើសម្រាប់កម្ចីរយៈពេលខ្លី ហើយអាចសន្សំថ្លៃសេវាបាន។ អ្នកខ្ចីត្រូវមានសមត្ថភាពបង់ជាធំក្នុងពេលខាងមុខ។',
                style: TextStyle(
                  fontFamily: 'Misan',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );

        break;

      case 'ផ្គួបការប្រាក់':
        appbar = 'ស្វែងយល់អំពីប្រភេទនៃកម្ចី';
        description = const Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            text: 'ការប្រាក់ផ្គួបគឺជាវិធីគណនាការប្រាក់ដែល',
            style: TextStyle(
              fontFamily: 'Misan',
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: 'បង់ប្រាក់ដើម និងការប្រាក់ទាំងមូល',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Misan',
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'នៅចុងកាលបរិច្ឆេទ។ វាធម្មតាត្រូវបានប្រើសម្រាប់កម្ចីរយៈពេលខ្លី ហើយអាចសន្សំថ្លៃសេវាបាន។ អ្នកខ្ចីត្រូវមានសមត្ថភាពបង់ជាដុំធំក្នុងពេលខាងមុខ។',
                style: TextStyle(
                  fontFamily: 'Misan',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );

        break;

      case 'គណនីសន្សំធម្មតា':
        appbar = 'ស្វែងយល់អំពីប្រភេទនៃការសន្សំ';
        description = const Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            text:
                'គណនីសន្សំធម្មតាជាជម្រើសល្អសម្រាប់អ្នកចង់រក្សាប្រាក់ដោយមានភាពរហ័សក្នុង',
            style: TextStyle(
              fontFamily: 'Misan',
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: 'ការដកចេញគ្រប់ពេល។',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Misan',
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'អ្នកអាចដាក់បញ្ចូលឬដកប្រាក់បានគ្មានដែនកំណត់ និងមិនមានការផាកពិន័យ។ ប្រហែលជា អត្រាការប្រាក់គឺទាបបំផុត ប៉ុន្តែអាចទទួលបានភាពបត់បែនក្នុងការប្រើប្រាស់ប្រាក់។ វាសមស្របសម្រាប់អ្នកចង់រក្សាប្រាក់សំរាប់ចំណាយបន្ទាន់ ឬអ្នកចាប់ផ្ដើមសន្សំ។',
                style: TextStyle(
                  fontFamily: 'Misan',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );

        break;

      case 'បញ្ញើថេរ':
        appbar = 'ស្វែងយល់អំពីប្រភេទនៃការសន្សំ';
        description = const Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            text: 'បញ្ញើថេរជារបៀបសន្សំប្រាក់ក្នុង',
            style: TextStyle(
              fontFamily: 'Misan',
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: 'រយៈពេលកំណត់ ដូចជា 3 ខែ, 6 ខែ, ឬ 1 ឆ្នាំ។',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Misan',
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'អត្រាការប្រាក់ខ្ពស់ជាងគណនីធម្មតា និងគិតការប្រាក់តាមរយៈរយៈពេល។ អ្នកមិនអាចដកប្រាក់ចេញបានមុនពេលកំណត់ដោយគ្មានការបាត់បង់ការប្រាក់។ វាសមស្របសម្រាប់អ្នកចង់រក្សាប្រាក់យូរពេល ដោយគ្មានបំណងប្រើប្រាស់ភ្លាមៗ។',
                style: TextStyle(
                  fontFamily: 'Misan',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );

        break;

      case 'ការសន្សំប្រចាំខែ':
        appbar = 'ស្វែងយល់អំពីប្រភេទនៃការសន្សំ';
        description = const Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            text: 'គឺជាគណនីសន្សំដែលអ្នកត្រូវ',
            style: TextStyle(
              fontFamily: 'Misan',
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: ' ដាក់ប្រាក់ចូលជាប្រចាំរៀងរាល់ខែ ជាចំនួនថេរ។',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Misan',
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'វាជួយបង្កើតវិន័យផ្នែកហិរញ្ញវត្ថុ ហើយផ្ដល់អត្រាការប្រាក់សមរម្យ ប៉ុន្តែតិចជាងបញ្ញើថេរ។ សមស្របសម្រាប់អ្នកចង់សន្សំពេលវេលាវែងសម្រាប់គោលដៅខាងមុខ ដូចជា ទិញផ្ទះ ឬបង្កើនទុនធ្វើអាជីវកម្ម។',
                style: TextStyle(
                  fontFamily: 'Misan',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );

        break;

      case 'គណនីសន្សំអត្រាការប្រាក់ខ្ពស់':
        appbar = 'ស្វែងយល់អំពីប្រភេទនៃការសន្សំ';
        description = const Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            text: 'គណនីនេះផ្ដល់អត្រាការប្រាក់ខ្ពស់ជាងគណនីសន្សំធម្មតា',
            style: TextStyle(
              fontFamily: 'Misan',
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: 'ប៉ុន្តែតម្រូវឱ្យមានចំនួនទុនដំបូងខ្ពស់',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Misan',
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'ក្នុងករណីខ្លះ អ្នកមិនអាចដកប្រាក់ញឹកញាប់បានឡើយ ប្រសិនបើដកប្រាក់លើសកំណត់ អ្នកអាចបាត់បង់ការប្រាក់ឬរងការផាកពិន័យ។',
                style: TextStyle(
                  fontFamily: 'Misan',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );

        break;

      case 'គណនីសន្សំសម្រាប់កុមារ':
        appbar = 'ស្វែងយល់អំពីប្រភេទនៃការសន្សំ';
        description = const Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            text:
                'គណនីសន្សំសម្រាប់កុមារត្រូវបានរចនាឡើងដើម្បីជួយឪពុកម្តាយសន្សំប្រាក់ឲ្យកូនៗ',
            style: TextStyle(
              fontFamily: 'Misan',
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: 'ក្នុងរយៈពេលវែង។ ',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Misan',
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'វាអាចផ្ដល់អត្រាការប្រាក់លើសគន្លងធម្មតា ហើយជួយអប់រំកុមារអំពីវិន័យហិរញ្ញវត្ថុ។ គណនីនេះអាចបើកជាមួយឈ្មោះកុមារ ដោយមានឪពុកម្តាយជាអ្នកគ្រប់គ្រង។ ជាជម្រើសល្អសម្រាប់ទទួលបានភាពសន្សំនិងការលើកទឹកចិត្តឲ្យកូនសន្សំចាប់ពីអាយុតិច។',
                style: TextStyle(
                  fontFamily: 'Misan',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );

        break;

      case 'គណនីសន្សំសម្រាប់គោលដៅជាក់លាក់':
        appbar = 'ស្វែងយល់អំពីប្រភេទនៃការសន្សំ';
        description = const Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            text:
                'គណនីនេះត្រូវបានរចនាឡើងសម្រាប់ការសន្សំប្រាក់ក្នុងគោលដៅពិសេសៗ ដូចជា ទិញផ្ទះ, ទៅសិក្សានៅក្រៅប្រទេស, ឬធ្វើដំណើរទេសចរណ៍។អ្នកត្រូវ',
            style: TextStyle(
              fontFamily: 'Misan',
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: 'កំណត់រយៈពេល និងចំនួនប្រាក់ដាក់បញ្ចូលប្រចាំខែ។',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Misan',
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    'វាជួយអ្នករក្សាសវនកម្មក្នុងការសន្សំ និងកុំឲ្យចំណាយប្រាក់ច្រើនក្នុងរយៈពេលខ្លី។ អត្រាការប្រាក់អាចមានលក្ខណៈពិសេសផងដែរ។',
                style: TextStyle(
                  fontFamily: 'Misan',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );

        break;
      default:
        appbar = 'ស្វែងយល់អំពីប្រភេទនៃការសន្សំ';
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          shape: LinearBorder.bottom(
            side: const BorderSide(color: Colors.white, width: 2),
          ),
           backgroundColor: const Color(0xFF001379),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            appbar,
            style: const TextStyle(color: Colors.white, fontFamily: 'Misan'),
          ),
        ),
        body: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      widget.title,
                      style: const TextStyle(
                        fontFamily: 'Misan',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: description,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
