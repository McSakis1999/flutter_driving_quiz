import 'package:flutter/material.dart';
import 'package:flutter_driving_quiz/components/categoryInkwell.dart';
import 'package:flutter_driving_quiz/models/data.dart';
import 'package:flutter_driving_quiz/theme/themeConstants.dart';
import 'package:flutter_driving_quiz/theme/themeManager.dart';
import 'screens/quiz_template.dart';
import 'theme/themeConstants.dart';
import 'theme/themeManager.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      title: 'Σήματα Οδήγησης',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Widget> createCategoryListTiles(
    List<List<Question>> dataList, Map<String, String> imagePathMap) {
  List<Widget> _tileList = [];
  for (List<Question> list in dataList) {
    if (list[0] != null)
      _tileList.add(CategoryCard(
          imagePath: imagePathMap[list[0].Raw_category]!,
          categoryTitle: list[0].Q_category!,
          data: list));
  }
  return _tileList;
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        title: Text(
          'Σήματα Οδήγησης',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          Switch(
              activeThumbImage: const AssetImage('assets/icons/moon.png'),
              inactiveThumbImage: const AssetImage('assets/icons/sun.png'),
              value: _themeManager.themeMode == ThemeMode.dark,
              onChanged: (newValue) {
                _themeManager.toggleTheme(newValue);
              })
        ],
      ),
      body: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).colorScheme.primary, width: 0.4),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30.0)),
                color: Theme.of(context).colorScheme.background),
            height: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Quiz(questions: generateQuiz(listData))),
                        )
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        color: Theme.of(context).colorScheme.primaryContainer,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 30),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  padding: const EdgeInsets.all(15),
                                  child: const Image(
                                    image: AssetImage(
                                        'assets/carIcons/021-manual book.png'),
                                    height: 70,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 700),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Τέστ Υπουργείου',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      const SizedBox(height: 10),
                                      Wrap(
                                        runSpacing: 8.0,
                                        spacing: 25.0,
                                        children: [
                                          FittedBox(
                                            child: Row(
                                              children: const [
                                                Icon(Icons.timer),
                                                Text(': 30 λεπτά')
                                              ],
                                            ),
                                          ),
                                          FittedBox(
                                            child: Row(
                                              children: const [
                                                Icon(Icons
                                                    .assignment_turned_in_outlined),
                                                Text(' : 30 ερωτήσεις')
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Κατηγορίες',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...createCategoryListTiles(listData, categoriesImages)
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  const FlutterLogo(
                    size: 70,
                  ),
                  const SizedBox(height: 20),
                  const Text('Created using Flutter!'),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
