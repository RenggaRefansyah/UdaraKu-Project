import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatistikPage extends StatefulWidget {
  @override
  _StatistikPageState createState() => _StatistikPageState();
}

class _StatistikPageState extends State<StatistikPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF49D3FF),
        title: Text(
          "Statistik",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('UdaraKu')
            .doc('pUHXxWE4ViTk5lWjXlSz')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print("Error: ${snapshot.error}");
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            print("No data found");
            return Center(child: Text("No data found"));
          }

          var data = snapshot.data!.data() as Map<String, dynamic>;
          print("Data received: $data");

          double suhu = data['suhu']?.toDouble() ?? 0.0;
          double humidity = data['humidity']?.toDouble() ?? 0.0;
          double pressure = data['pressure']?.toDouble() ?? 0.0;
          double co2 = data['co2']?.toDouble() ?? 0.0;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildRadialGauge('Suhu (°C)', suhu, Colors.lightBlue,
                          Colors.blue, '°C'),
                      SizedBox(width: 20),
                      buildRadialGauge('Kelembapan (%)', humidity,
                          Colors.orange, Colors.orange, '%'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildRadialGauge('Tekanan (hPa)', pressure, Colors.purple,
                          Colors.purpleAccent, 'hPa'),
                      SizedBox(width: 20),
                      buildRadialGauge('CO2 (ppm)', co2, Colors.lightGreen,
                          Colors.green, 'ppm'),
                    ],
                  ),
                  SizedBox(height: 20),
                  buildAnalysisContainer(
                      'Hasil Analisa', suhu, humidity, pressure, co2),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildRadialGauge(
      String title, double value, Color color, Color rangeColor, String unit) {
    double maxValue;
    Color mainColor;

    switch (title) {
      case 'Suhu (°C)':
        maxValue = 100;
        mainColor = Colors.lightBlue;
        break;
      case 'Kelembapan (%)':
        maxValue = 100;
        mainColor = Colors.orange;
        break;
      case 'Tekanan (hPa)':
        maxValue = 120;
        mainColor = Colors.purple;
        break;
      case 'CO2 (ppm)':
        maxValue = 1000;
        mainColor = Colors.lightGreen;
        break;
      default:
        maxValue = 100;
        mainColor = Colors.grey;
    }

    return Flexible(
      child: Container(
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Stack(
                children: [
                  SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: maxValue,
                        showLabels: false,
                        showTicks: false,
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.12,
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        ranges: <GaugeRange>[
                          GaugeRange(
                            startValue: 0,
                            endValue: value,
                            color: mainColor.withOpacity(0.5),
                          ),
                          GaugeRange(
                            startValue: value,
                            endValue: maxValue,
                            color: Colors.grey.withOpacity(0.5),
                            startWidth: 0.1,
                            endWidth: 0.1,
                          ),
                        ],
                        pointers: <GaugePointer>[
                          MarkerPointer(
                            value: value,
                            markerType: MarkerType.circle,
                            color: mainColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        '$value $unit',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAnalysisContainer(
      String title, double suhu, double humidity, double pressure, double co2) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Colors.grey,
            height: 20,
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
          Container(
            width: 275,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildAnalysisResult('Suhu', suhu),
                SizedBox(height: 10),
                buildAnalysisResult('Kelembapan', humidity),
                SizedBox(height: 10),
                buildAnalysisResult('Tekanan', pressure),
                SizedBox(height: 10),
                buildAnalysisResult('CO2', co2),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildAnalysisResult(String title, double value) {
    String result;
    if (value < 20) {
      result = 'Sangat Rendah';
    } else if (value < 40) {
      result = 'Rendah';
    } else if (value < 60) {
      result = 'Stabil';
    } else if (value < 80) {
      result = 'Tinggi';
    } else {
      result = 'Sangat Tinggi';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: _getBackgroundColorBasedOnResult(result),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: _getColorBasedOnResult(result),
                width: 1,
              ),
            ),
            child: Text(
              result,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Color _getColorBasedOnResult(String result) {
    switch (result) {
      case 'Sangat Rendah':
        return Color.fromRGBO(70, 222, 255, 1);
      case 'Rendah':
        return Color.fromRGBO(0, 133, 255, 1);
      case 'Stabil':
        return Color.fromRGBO(66, 255, 0, 1);
      case 'Tinggi':
        return Color.fromRGBO(255, 92, 0, 1);
      case 'Sangat Tinggi':
        return Color.fromRGBO(255, 0, 0, 1);
      default:
        return Colors.black;
    }
  }

  Color _getBackgroundColorBasedOnResult(String result) {
    switch (result) {
      case 'Sangat Rendah':
        return Color.fromRGBO(70, 222, 255, 1);
      case 'Rendah':
        return Color.fromRGBO(0, 133, 255, 1);
      case 'Stabil':
        return Color.fromRGBO(66, 255, 0, 1);
      case 'Tinggi':
        return Color.fromRGBO(255, 92, 0, 1);
      case 'Sangat Tinggi':
        return Color.fromRGBO(255, 0, 0, 1);
      default:
        return Colors.black;
    }
  }
}
