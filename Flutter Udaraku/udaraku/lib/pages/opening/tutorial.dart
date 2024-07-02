import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'loading.dart';

class TutorialPage extends StatefulWidget {
  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  int _currentPageIndex = 0;

  void _navigateToPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  final List<String> _tutorialPages = [
    'Selamat Datang di UdaraKu',
    'Pernahkah Anda Mempertimbangkan Kualitas Udara Ruangan Anda?',
    'Pantau dan Tingkatkan Kualitas Udara Ruangan dalam Satu Genggaman dengan UdaraKu',
  ];

  final List<String> _tutorialPages2 = [
    'Membantu Anda memantau udara bersih untuk hidup sehat',
    'Udara yang bersih memiliki manfaat bagi kesehatan, mental dan lingkungan, termasuk meningkatkan kualitas tidur, konsentrasi dan perlindungan terhadap penyakit pernapasan.',
    'Perhatikan udara yang Anda hirup setiap hari. UdaraKu selalu siap membantu.',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            if (_currentPageIndex != 2)
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background_tutor.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            if (_currentPageIndex == 2)
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background_tutor3.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Container(
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/ulogo.png',
                    height: 40,
                    width: 40,
                  ),
                  Visibility(
                    visible: _currentPageIndex != 2,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoadingScreen()),
                        );
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 80, 15, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                            child: Container(
                              height: 40,
                              child: Text(
                                _tutorialPages[_currentPageIndex],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                              height: 400,
                              child: _currentPageIndex == 0
                                  ? Image.asset(
                                      'assets/images/tutor1.png',
                                      width: 350,
                                      height: 350,
                                    )
                                  : _currentPageIndex == 1
                                      ? Image.asset(
                                          'assets/images/tutor2.png',
                                          width: 300,
                                          height: 300,
                                        )
                                      : Container()),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 100, 20, 0),
                            child: Container(
                              height: 40,
                              child: Text(
                                _tutorialPages2[_currentPageIndex],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    if (_currentPageIndex == 2)
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoadingScreen()),
                          );
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        child: Text(
                          'Start',
                          style: TextStyle(
                            color: Colors.black, // Change color here
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 40),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: _currentPageIndex > 0
                                ? () {
                                    _navigateToPage(_currentPageIndex - 1);
                                  }
                                : null,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                          child: InkWell(
                            onTap: () {
                              _navigateToPage(0);
                            },
                            child: Icon(
                              Icons.horizontal_rule_sharp,
                              color: _currentPageIndex == 0
                                  ? Color.fromARGB(255, 39, 39, 39)
                                  : Color.fromARGB(255, 201, 201, 201),
                              size: 40,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                          child: InkWell(
                            onTap: () {
                              _navigateToPage(0);
                            },
                            child: Icon(
                              Icons.horizontal_rule_sharp,
                              color: _currentPageIndex == 1
                                  ? Color.fromARGB(255, 39, 39, 39)
                                  : Color.fromARGB(255, 201, 201, 201),
                              size: 40,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                          child: InkWell(
                            onTap: () {
                              _navigateToPage(0);
                            },
                            child: Icon(
                              Icons.horizontal_rule_sharp,
                              color: _currentPageIndex == 2
                                  ? Color.fromARGB(255, 39, 39, 39)
                                  : Color.fromARGB(255, 201, 201, 201),
                              size: 40,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 50),
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward),
                            onPressed: _currentPageIndex < 2
                                ? () {
                                    _navigateToPage(_currentPageIndex + 1);
                                  }
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
