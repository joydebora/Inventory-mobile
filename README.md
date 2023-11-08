# TUGAS 7
**Nama: Joy Debora Sitorus**\
**NPM: 2206082991**\
**Kelas: PBP D**

# CHECKLIST TUGAS
![App1](https://i.postimg.cc/Gt5JBdcP/Whats-App-Image-2023-09-19-at-18-11-23.jpg)
## 1. Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.
Buka Terminal atau Command Prompt.

Masuk ke direktori "inventory" tempat menyimpan proyek flutter nantinya.

Generate proyek Flutter baru dengan nama inventory, kemudian masuk ke dalam direktori proyek tersebut.
```
flutter create <APP_NAME>
cd <APP_NAME>
```

Jalankan proyek melalui Terminal atau Command Prompt dengan `flutter run`

## 2. Membuat tiga tombol sederhana dengan ikon dan teks untuk:
#### Melihat daftar item (Lihat Item)
#### Menambah item (Tambah Item)
#### Logout (Logout)
Membuat berkas baru `menu.dart` dan mengimpor paket (package) flutter/material.dart, yang merupakan paket utama untuk mengembangkan aplikasi Flutter dengan menggunakan material design.
```
import 'package:flutter/material.dart';
```

Mendefinisikan kelas dan konstruktor MyHomePage yang merupakan turunan dari StatelessWidget. Kelas ini akan digunakan untuk membuat tampilan halaman utama dari aplikasi Flutter.
```
class MyHomePage extends StatelessWidget {
MyHomePage({Key? key}) : super(key: key);
}
```

Membuat sebuah list items yang berisi objek-objek ShopItem. Setiap ShopItem memiliki sebuah judul dan ikon yang akan ditampilkan di halaman utama.
```
final List<ShopItem> items = [
  ShopItem("Lihat Item", Icons.checklist),
  ShopItem("Tambah Item", Icons.add_shopping_cart),
  ShopItem("Logout", Icons.logout),
];
```

Membuat metode untuk membangun dan mengembalikan widget yang akan ditampilkan di layar. Menggunakan widget Scaffold sebagai kerangka (scaffold) untuk tata letak halaman. Menggunakan widget AppBar yang akan ditampilkan di bagian atas halaman.
```
@override
Widget build(BuildContext context) {
return Scaffold(
    appBar: AppBar(
        title: const Text(
            'Inventory',
        ),
        backgroundColor: Colors.indigo, //App Bar background color
        foregroundColor: Colors.white, //Text color
    ),
)
}
```

Menggunakan widget SingleChildScrollView untuk membuat area konten dapat discroll jika konten melebihi ukuran layar.\
Menggunakan Padding untuk memberikan jarak antara konten dengan tepi layar.\
Menggunakan widget text untuk menampilkan teks "Petkeeper Inventory"\
Menggunakan widget GridView.count untuk menampilkan grid layout.\
Menggunakan widget ShopCard untuk menampilkan setiap ShopItem dalam bentuk kartu di dalam grid.
```
body: SingleChildScrollView(
    child: Padding(
        padding: const EdgeInsets.all(10.0), // Set padding dari halaman
        child: Column(
        // Widget untuk menampilkan children secara vertikal
        children: <Widget>[
            const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
            child: Text(
                'Petkeeper Inventory', // Text yang menandakan toko
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                ),
            ),
            ),
            // Grid layout
            GridView.count(
            // Container pada card kita.
            primary: true,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            shrinkWrap: true,
            children: items.map((ShopItem item) {
                // Iterasi untuk setiap item
                return ShopCard(item);
            }).toList(),
            ),
        ],
        ),
    ),
)
```

## 3. Memunculkan Snackbar dengan tulisan:
#### "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.
#### "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.
#### "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.
Membuat kelas ShopItem untuk mendefinisikan model data untuk item-item dalam toko. Setiap ShopItem memiliki dua atribut: name (nama item) dan icon (ikon yang merepresentasikan item tersebut).
```
class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}
```

Membuat kelas ShopCard yang merupakan turunan dari StatelessWidget dan digunakan untuk membuat kartu (card) yang menampilkan informasi dari ShopItem.
```
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    // ...
  }
}
```

Didalam kelas ShopCard, Mendeklarasikan konstruktor untuk kelas ShopCard yang menerima sebuah objek ShopItem dan optional parameter key dari superclass.
```
const ShopCard(this.item, {super.key}); // Constructor
```

Membuat metode build yang digunakan untuk membangun tampilan widget ShopCard. Di dalamnya terdapat widget Material sebagai latar belakang kartu dengan warna indigo. InkWell digunakan untuk membuat area kartu responsif terhadap sentuhan pengguna. Ketika kartu ditekan, sebuah SnackBar akan muncul dengan pesan yang menyatakan nama item yang ditekan.
```
@override
Widget build(BuildContext context) {
  return Material(
    color: Colors.indigo,
    child: InkWell(
      // Area responsive terhadap sentuhan
      onTap: () {
        // Memunculkan SnackBar ketika diklik
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
              content: Text("Kamu telah menekan tombol ${item.name}!")));
      },
      child: Container(
        // Container untuk menyimpan Icon dan Text
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                item.icon,
                color: Colors.white,
                size: 30.0,
              ),
              const Padding(padding: EdgeInsets.all(3)),
              Text(
                item.name,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
```

## Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
#### Stateless Widget:
**Deskripsi**: \
Stateless widget adalah jenis widget di Flutter yang tidak memiliki data internal yang berubah. Tampilan statis dan tidak bergantung pada perubahan data internal.

**Karakteristik**: \
- Tidak dapat berubah setelah pembuatan.
- Mewakili bagian dari antarmuka pengguna yang tidak bergantung pada perubahan data internal.
- Berguna untuk tampilan statis yang tidak memerlukan pembaruan berdasarkan input atau interaksi pengguna.

**Contoh penggunaan** \
Menampilkan teks statis, ikon, gambar, atau komponen UI yang tidak memerlukan perubahan dinamis.

#### Stateful Widget:
**Deskripsi**: \
Stateful widget adalah jenis widget di Flutter yang memiliki data internal yang dapat berubah. Dapat memperbarui tampilan berdasarkan perubahan data internal atau input pengguna.

**Karakteristik**: \
- Dapat memiliki data yang berubah (mutable) yang memengaruhi tampilan widget.
- Menggunakan objek State terpisah untuk mengelola data yang dapat berubah.
- Cocok untuk tampilan yang membutuhkan pembaruan berdasarkan input pengguna, data dinamis, atau interaksi.

**Contoh penggunaan** \
Formulir interaktif, daftar dinamis, animasi, atau komponen UI yang membutuhkan respons terhadap input pengguna.

## Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
1. Widget Material:\
Fungsi: Digunakan sebagai latar belakang kartu (card) dengan warna indigo. Material adalah konsep desain dalam Flutter yang menyediakan tata letak visual yang sesuai dengan panduan Material Design.

2. Widget InkWell:\
Fungsi: Mengubah area widget menjadi responsif terhadap sentuhan pengguna. Dalam konteks program, digunakan untuk membuat area kartu responsif terhadap sentuhan. Saat kartu ditekan, fungsi yang didefinisikan dalam onTap akan dijalankan.

3. Widget Container:\
Fungsi: Menyediakan kotak (box) yang dapat menampung dan mengatur tata letak widget di dalamnya. Dalam program ini, Container digunakan untuk mengatur padding serta menempatkan ikon dan teks item di dalamnya.

4. Widget Icon:\
Fungsi: Menampilkan ikon grafis. Dalam konteks program, Icon digunakan untuk menampilkan ikon yang sesuai dengan ShopItem yang ditetapkan. Ikon ini diberi warna putih dan memiliki ukuran 30.0.

5. Widget Text:\
Fungsi: Menampilkan teks. Dalam program ini, Text digunakan untuk menampilkan nama item dari ShopItem. Teks ini memiliki warna putih dan diatur menjadi rata tengah (textAlign: TextAlign.center).

6. Widget Scaffold:\
Fungsi: Menyediakan kerangka dasar untuk aplikasi Flutter, termasuk app bar, body, dan banyak komponen antarmuka pengguna lainnya. Dalam program ini, Scaffold digunakan untuk membungkus seluruh tata letak aplikasi, termasuk app bar dan konten utama.

7. Widget AppBar:\
Fungsi: Menampilkan bilah aplikasi (app bar) di bagian atas tata letak. Dalam program ini, AppBar digunakan untuk menampilkan judul "Inventory" dengan latar belakang warna indigo dan teks berwarna putih.

8. Widget SingleChildScrollView:\
Fungsi: Membungkus widget-child dan memungkinkan konten dapat discroll jika konten melebihi ukuran layar. Dalam program ini, SingleChildScrollView digunakan untuk memastikan bahwa konten di dalamnya dapat discroll jika diperlukan.

9. Widget Padding:\
Fungsi: Menambahkan jarak antara tepi widget-child dan tepi widget induk. Dalam program ini, Padding digunakan untuk memberikan jarak antara konten dengan tepi layar dan untuk membuat ruang di sekitar elemen-elemen tata letak.

10. Widget Column:\
Fungsi: Menyusun widget-child secara vertikal. Dalam program ini, Column digunakan untuk menyusun elemen-elemen vertikal, termasuk teks judul dan grid dari ShopItem.

11. Widget GridView.count:\
Fungsi: Menampilkan anak-anak dalam bentuk grid dengan jumlah kolom yang tetap. Dalam program ini, GridView.count digunakan untuk menampilkan item-item dari ShopItem dalam bentuk grid dengan 3 kolom.

12. Widget SnackBar:\
Fungsi: Menampilkan pesan notifikasi yang muncul sementara di bagian bawah layar. Dalam program ini, SnackBar digunakan untuk menampilkan pesan saat item di kartu ditekan.

## Bonus: mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Item, Tambah Item, dan Logout)
Menambahkan properti color ke dalam kelas ShopItem untuk menyimpan warna yang akan digunakan untuk tombol tersebut.
```
class ShopItem {
  final String name;
  final IconData icon;
  final Color color; // Menambahkan properti warna

  ShopItem(this.name, this.icon, this.color);
}
```

Menyertakan parameter warna pada setiap objek ShopItem di dalam list items.
```
final List<ShopItem> items = [
  ShopItem("Lihat Item", Icons.checklist, Colors.blue), // Menggunakan warna biru
  ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.green), // Menggunakan warna hijau
  ShopItem("Logout", Icons.logout, Colors.orange), // Menggunakan warna oranye
];
```
Menggunakan properti color dari objek ShopItem sebagai warna latar belakang kartu (Material). Setiap tombol akan memiliki warna latar belakang yang berbeda sesuai dengan nilai yang disetel pada properti color di dalam list items.
```
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color, // Menggunakan warna yang disimpan dalam objek ShopItem
      child: InkWell(
        // ... (bagian lain tetap sama)
      ),
    );
  }
}
```