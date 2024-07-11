import 'package:flutter/material.dart';
import 'package:udaraku/pages/main_page.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  String _getCurrentTime() {
    // Fungsi untuk mendapatkan waktu saat ini
    // Anda dapat menggantinya dengan logika untuk mendapatkan waktu aktual
    return DateTime.now().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF49D3FF),
        title: Text(
          "History",
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
      body: ListView.builder(
        itemCount: showcaseItems.length * 2 - 1,
        itemBuilder: (BuildContext context, int index) {
          if (index.isOdd) {
            return Divider(
              color: Colors.grey,
              height: 0,
              thickness: 1,
            );
          }
          final itemIndex = index ~/ 2;
          final item = showcaseItems[itemIndex];
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.title),
                Text(
                  _getCurrentTime(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            subtitle: Text(item.description),
            onTap: () {},
          );
        },
      ),
    );
  }
}

class ShowcaseItem {
  final String title;
  final String description;

  ShowcaseItem(this.title, this.description);
}

final List<ShowcaseItem> showcaseItems = [
  ShowcaseItem('Ruang Tamu', '12/12/2023'),
  ShowcaseItem('Toilet Lt.1', '15/11/2023'),
  ShowcaseItem('Kantor Admin', '25/09/2023'),
  ShowcaseItem('Kamar Tidur', '20/09/2023'),
  ShowcaseItem('Musholla', '15/09/2023'),
  ShowcaseItem('Ruang Guru', '29/08/2023'),
  ShowcaseItem('Ruang Kelas', '25/08/2023'),
  ShowcaseItem('Gudang', '22/08/2023'),
];
