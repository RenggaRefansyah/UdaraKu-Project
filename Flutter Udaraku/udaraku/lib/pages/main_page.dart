import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:udaraku/pages/education.dart';
import 'package:udaraku/pages/history.dart';
import 'package:udaraku/pages/scan.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    _showPopupAd();
  }

  void _showPopupAd() {
    Future.delayed(Duration(seconds: 1), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return PopupAd();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScanPage()),
          );
        },
        shape: CircleBorder(),
        backgroundColor: Color(0xFF49D3FF),
        child: Icon(
          Icons.play_arrow,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryPage()),
                  );
                },
                icon: Icon(Icons.history)),
            SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EducationScreen()),
                  );
                },
                icon: Icon(Icons.book))
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Image.asset(
              'assets/images/main_header.png',
              width: 125,
            ),
            backgroundColor: Color(0xFF49D3FF),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    'Have you checked your air quality today?',
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 190,
                    child: CarouselSlider(
                      items: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/C2.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/C1.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/C3.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        initialPage: 0,
                        viewportFraction: 0.8,
                        disableCenter: true,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.25,
                        enableInfiniteScroll: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 50, 20, 0),
                    child: Container(
                      width: 400,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('UdaraKu')
                            .doc('pUHXxWE4ViTk5lWjXlSz')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            print("Error: ${snapshot.error}");
                            return Center(
                                child: Text("Error: ${snapshot.error}"));
                          } else if (!snapshot.hasData ||
                              !snapshot.data!.exists) {
                            print("No data found");
                            return Center(child: Text("No data found"));
                          }

                          var data =
                              snapshot.data!.data() as Map<String, dynamic>;
                          print("Data received: $data");

                          double suhu = data['suhu']?.toDouble() ?? 0.0;
                          double humidity = data['humidity']?.toDouble() ?? 0.0;
                          double pressure = data['pressure']?.toDouble() ?? 0.0;
                          double co2 = data['co2']?.toDouble() ?? 0.0;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Recent Scanning',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'UdaraKu',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 30),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildIconColumn(Icons.thermostat, 'Suhu',
                                      '${suhu.toStringAsFixed(1)}°C'),
                                  SizedBox(height: 16),
                                  _buildIconColumn(
                                      Icons.water_damage,
                                      'Kelembapan',
                                      '${humidity.toStringAsFixed(1)}%'),
                                  SizedBox(height: 16),
                                  _buildIconColumn(Icons.speed, 'Tekanan',
                                      '${pressure.toStringAsFixed(1)} hPa'),
                                  SizedBox(height: 16),
                                  _buildIconColumn(Icons.co2, 'Carbon Dioksida',
                                      '${co2.toStringAsFixed(1)} ppm'),
                                  SizedBox(height: 16),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconColumn(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 30),
        SizedBox(width: 10),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class PopupAd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Image.asset(
              'assets/images/iklan.jpg', // Path to your ad image
              fit: BoxFit.cover, // Adjust fit as needed
              width: double.infinity,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.6),
                ),
                child: Icon(Icons.close, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}
