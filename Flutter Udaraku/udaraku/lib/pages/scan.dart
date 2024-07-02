import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udaraku/main.dart';
import 'package:udaraku/pages/history.dart';
import 'package:udaraku/pages/main_page.dart';
import 'statistik.dart'; // Tidak perlu direktori karena berada dalam satu direktori

void main() {
  runApp(ScanPage());
}

class ScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white, // Set the background color to white
        appBar: AppBar(
          backgroundColor: Color(0xFF49D3FF),
          title: Text(
            "Scanning",
            style: TextStyle(
              fontSize: 20.0, // Ukuran font
              fontWeight: FontWeight.bold, // Ketebalan teks
              color: Colors.white, // Warna teks
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white, // Mengubah warna ikon menjadi putih
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.history,
                color: Colors.white, // Mengubah warna ikon menjadi putih
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage()),
                );
              },
            ),
          ],
        ),
        body: ScanBody(),
      ),
    );
  }
}

class ScanBody extends StatefulWidget {
  @override
  _ScanBodyState createState() => _ScanBodyState();
}

class _ScanBodyState extends State<ScanBody> {
  bool isLoading = false;
  bool isCompleted = false;

  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 1080,
              height: 240,
              decoration: ShapeDecoration(
                color: Color(0xFF49D3FF), // Warna latar belakang Container
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(139),
                    bottomRight: Radius.circular(139),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 125.0), // Adjust the value as needed
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white, // Warna latar belakang Container
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 140.0), // Adjust the value as needed
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Color(0xFF49D3FF), // Warna latar belakang Container
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 160.0), // Adjust the value as needed
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(
                        255, 255, 255, 255), // Warna latar belakang Container
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.2), // Warna bayangan dengan opasitas
                        spreadRadius: 15, // Menyebar radius bayangan
                        blurRadius: 30, // Radius blur bayangan
                        offset: Offset(0, 3), // Menggeser bayangan (x, y)
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                        isCompleted = false;
                      });

                      // Mengirim data ke Firebase
                      await _database.child('Start').set({'Power': true});

                      // Tambahkan delay selama 1 detik sebelum menghentikan loading
                      Future.delayed(Duration(seconds: 5), () {
                        setState(() {
                          isLoading = false;
                          isCompleted = true;
                        });
                      });
                    },
                    icon: ImageIcon(
                      AssetImage('assets/images/power.png'),
                      size: 60.0,
                      color: Color(0xFF49D3FF),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                SizedBox(height: 20), // Jarak antara Container dan row pertama
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(161, 188, 255, 0.09),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.thermostat, color: Colors.black),
                            SizedBox(width: 10),
                            Text(
                              "Suhu",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        isLoading
                            ? Container(
                                width:
                                    20, // Atur lebar container loading sesuai keinginan Anda
                                height:
                                    20, // Atur tinggi container loading sesuai keinginan Anda
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.green),
                                ),
                              )
                            : isCompleted
                                ? Icon(
                                    Icons.check,
                                    color: Colors.blue,
                                  )
                                : Container(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20), // Jarak antara row pertama dan row kedua
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(161, 188, 255, 0.09),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.water_drop, color: Colors.black),
                            SizedBox(width: 10),
                            Text(
                              "Kelembapan",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        isLoading
                            ? Container(
                                width:
                                    20, // Atur lebar container loading sesuai keinginan Anda
                                height:
                                    20, // Atur tinggi container loading sesuai keinginan Anda
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.green),
                                ),
                              )
                            : isCompleted
                                ? Icon(
                                    Icons.check,
                                    color: Colors.blue,
                                  )
                                : Container(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20), // Jarak antara row kedua dan row ketiga
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(161, 188, 255, 0.09),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.speed, color: Colors.black),
                            SizedBox(width: 10),
                            Text(
                              "Tekanan",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        isLoading
                            ? Container(
                                width:
                                    20, // Atur lebar container loading sesuai keinginan Anda
                                height:
                                    20, // Atur tinggi container loading sesuai keinginan Anda
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.green),
                                ),
                              )
                            : isCompleted
                                ? Icon(
                                    Icons.check,
                                    color: Colors.blue,
                                  )
                                : Container(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20), // Jarak antara row kedua dan row ketiga
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(161, 188, 255, 0.09),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.co2, color: Colors.black),
                            SizedBox(width: 10),
                            Text(
                              "Carbon Dioksida",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        isLoading
                            ? Container(
                                width:
                                    20, // Atur lebar container loading sesuai keinginan Anda
                                height:
                                    20, // Atur tinggi container loading sesuai keinginan Anda
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.green),
                                ),
                              )
                            : isCompleted
                                ? Icon(
                                    Icons.check,
                                    color: Colors.blue,
                                  )
                                : Container(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: AnimatedOpacity(
                    opacity: isCompleted
                        ? 1.0
                        : 0.0, // Menentukan opacity berdasarkan status isCompleted
                    duration: Duration(milliseconds: 500), // Durasi animasi
                    child: TextButton(
                      child: Text("View More"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StatistikPage()),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
