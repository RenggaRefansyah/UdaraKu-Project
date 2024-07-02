import 'package:flutter/material.dart';
import 'package:udaraku/pages/main_page.dart';

class EducationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF49D3FF),
        title: Text(
          "Education",
          style: TextStyle(
            fontSize: 20.0, // Ukuran font
            fontWeight: FontWeight.bold, // Ketebalan teks
            color: Colors.white, // Warna teks
            // Tambahan gaya teks lainnya sesuai kebutuhan Anda
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
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints.expand(height: 50),
              child: TabBar(
                tabs: [
                  Tab(text: 'Suhu'),
                  Tab(text: 'Kelembapan'),
                  Tab(text: 'Tekanan'),
                  Tab(text: 'CO2'),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: TabBarView(
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 110,
                            height: 20,
                            child: Text(
                              'Sangat Rendah',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(70, 222, 255, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Suhu sangat rendah dapat menyebabkan ketidaknyamanan, kedinginan, menggigil, meriang, bahkan risiko hipotermia. Pastikan untuk mengenakan pakaian tebal atau selimut untuk menjaga suhu tubuh anda tetap hangat.',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 25,
                            child: Text(
                              'Rendah',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 133, 255, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Suhu rendah dapat menyebabkan kedinginan bagi sebagian orang, terutama jika anda tidak menggunakan pakaian yang cukup tebal dan hangat. Gunakan pakaian yang sesuai dan gunakan pemanas tambahan jika diperlukan.',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 65,
                            height: 25,
                            child: Text(
                              'Stabil',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(66, 255, 0, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Suhu di ruangan berada dalam kisaran yang nyaman bagi kebanyakan orang. Ini mendukung kenyamanan dan produktivitas. Anda dapat melakukan penyesuaian berdasarkan preferensi untuk kenyamanan suhu yang optimal.',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 65,
                            height: 25,
                            child: Text(
                              'Tinggi',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 92, 0, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Suhu di ruangan meningkat, melewati batas kenyamanan. Ini dapat menyebabkan kelelahan dan penurunan konsentrasi. Gunakan pakaian ringan, hindari aktivitas fisik berat, dan pastikan sirkulasi udara yang baik.',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 25,
                            child: Text(
                              'Sangat Tinggi',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 0, 0, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Suhu di ruangan sangat tinggi dapat menyebabkan dehidrasi, kelelahan, dan bahkan risiko kepanasan. Segera cari tempat yang lebih sejuk, minumlah air yang cukup, dan hindari paparan terus menerus terhadap suhu tinggi.',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 110,
                            height: 20,
                            child: Text(
                              'Sangat Rendah',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(70, 222, 255, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Kelembapan di ruangan sangat rendah dapat menyebabkan kulit kering, gangguan pernapasan, dan iritasi mata. Gunakan pelembap atau air penguap untuk meningkatkan kelembapan. Minum air yang cukup untuk mencegah dehidrasi.',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 25,
                            child: Text(
                              'Rendah',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 133, 255, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Kelembapan di ruangan rendah dapat menyebabkan ketidaknyamanan dan iritasi bagi beberapa orang, terutama mereka yang memiliki masalah pernapasan. Pertimbangkan penggunaan pelembap udara dan pastikan untuk tetap terhidrasi.',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 65,
                            height: 25,
                            child: Text(
                              'Stabil',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(66, 255, 0, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Kelembapan di ruangan berada dalam kisaran yang nyaman. Ini mendukung kesehatan dan kenyamanan. Pertahankan kelembapan dalam kisaran yang nyaman dan minumlah air yang cukup.',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 65,
                            height: 25,
                            child: Text(
                              'Tinggi',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 92, 0, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Kelembapan di ruangan tinggi dapat menyebabkan rasa lengket, berkeringat berlebihan, dan pertumbuhan jamur. Pastikan ventilasi yang baik, hindari aktivitas fisik berlebihan, dan pertimbangkan penggunaan pengering udara atau AC.',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 25,
                            child: Text(
                              'Sangat Tinggi',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 0, 0, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Kelembapan di ruangan sangat tinggi dapat menyebabkan pertumbuhan jamur, kerusakan pada bahan bangunan, dan masalah kesehatan asma dan alergi. Pastikan ventilasi yang optimal, kurangi kegiatan yang dapat meningkatkan kelembapan',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 110,
                            height: 20,
                            child: Text(
                              'Sangat Rendah',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(70, 222, 255, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Tekanan di ruangan sangat rendah mungkin terjadi pada ketinggian yang sangat tinggi atau dalam situasi darurat seperti kebocoran gas. Pastikan ventilasi yang baik dan hindari melakukan aktivitas fisik berlebihan',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 25,
                            child: Text(
                              'Rendah',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 133, 255, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Tekanan di ruangan rendah mungkin tidak terlalu berpengaruh pada kenyamanan, tetapi dapat mempengaruhi kinerja peralatan dan kenyamanan pernapasan. Pastikan ventilasi yang baik dan hindari aktivitas fisik berlebihan',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 65,
                            height: 25,
                            child: Text(
                              'Stabil',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(66, 255, 0, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Tekanan di ruangan berada dalam kisaran yang normal. Ini mendukung kesehatan dan kenyamanan. Pertahankan sirkulasi udara yang baik dan pastikan ventilasi tetap berfungsi dengan baik.',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 65,
                            height: 25,
                            child: Text(
                              'Tinggi',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 92, 0, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Tekanan di ruangan tinggi dapat menyebabkan ketidaknyamanan, sakit kepala, dan tekanan telinga. Pastikan ventilasi yang baik, hindari aktivitas fisik berat, dan periksa apakah ada masalah dengan sistem ventilasi.',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 25,
                            child: Text(
                              'Sangat Tinggi',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 0, 0, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Tekanan di ruangan sangat tinggi dapat menyebabkan ketidaknyamanan, sakit kepala, hingga kerusakan pada struktur bangunan. Segera cari tempat dengan tekanan udara yang normal dan Hindari kegiatan fisik yang berlebihan',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 110,
                            height: 20,
                            child: Text(
                              'Sangat Rendah',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(70, 222, 255, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Konsentrasi CO2 di ruangan sangat rendah menunjukkan sirkulasi udara yang baik dan lingkungan yang sehat. Tidak diperlukan tindakan khusus. Ini menunjukkan sirkulasi udara yang baik dan kualitas udara yang sehat.',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 25,
                            child: Text(
                              'Rendah',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 133, 255, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Konsentrasi CO2 di ruangan rendah juga menunjukkan kualitas udara yang baik. Pastikan ventilasi yang cukup, buka jendela atau pintu, dan pertimbangkan penggunaan purifier udara jika diperlukan.',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 65,
                            height: 25,
                            child: Text(
                              'Stabil',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(66, 255, 0, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Konsentrasi CO2 di ruangan berada dalam kisaran yang normal. Ini menunjukkan sirkulasi udara yang cukup dan lingkungan yang sehat. Pastikan ventilasi yang baik dan lakukan pemeriksaan berkala untuk memastikan kualitas udara tetap baik.',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 65,
                            height: 25,
                            child: Text(
                              'Tinggi',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 92, 0, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Konsentrasi CO2 di ruangan tinggi menunjukkan kurangnya ventilasi dan mungkin mengindikasikan penumpukan polutan lain dalam udara. Tingkatkan ventilasi, buka jendela atau pintu, dan hindari kegiatan yang meningkatkan emisi CO2.',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 25,
                            child: Text(
                              'Sangat Tinggi',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 0, 0, 100),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            width: 400,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 10, 20),
                              child: Text(
                                'Konsentrasi CO2 di ruangan sangat tinggi dapat menyebabkan gejala sakit kepala, kelelahan, dan kesulitan berkonsentrasi. Segera cari tempat dengan kualitas udara yang lebih baik, tingkatkan ventilasi, dan identifikasi dan kurangi sumber emisi CO2.',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
    home: EducationScreen(),
  ));
}
