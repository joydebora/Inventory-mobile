# TUGAS 7
**Nama: Joy Debora Sitorus**\
**NPM: 2206082991**\
**Kelas: PBP D**

# CHECKLIST TUGAS
![App1](https://i.postimg.cc/43Fs3RGb/Whats-App-Image-2023-11-08-at-09-32-11.jpg)
## 1. Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.
Buka Terminal atau Command Prompt.

Masuk ke direktori "inventory" tempat menyimpan proyek flutter nantinya.

Generate proyek Flutter baru dengan nama inventory, kemudian masuk ke dalam direktori proyek tersebut.
```
flutter create <APP_NAME>
cd <APP_NAME>
```

Jalankan proyek melalui Terminal atau Command Prompt dengan `flutter run`

## 2. Membuat tiga tombol sederhana dengan ikon dan teks untuk: Melihat daftar item (Lihat Item), Menambah item (Tambah Item), Logout (Logout)
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

## 3. Memunculkan Snackbar dengan tulisan: "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan, "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan, "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.
![App2](https://i.postimg.cc/3JBRH6k9/Whats-App-Image-2023-11-08-at-09-32-53.jpg)
![App3](https://i.postimg.cc/5tvWfYP1/Whats-App-Image-2023-11-08-at-09-32-53-1.jpg)
![App4](https://i.postimg.cc/B6skshLc/Whats-App-Image-2023-11-08-at-09-32-53-2.jpg)

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

**Karakteristik**: 
- Tidak dapat berubah setelah pembuatan.
- Mewakili bagian dari antarmuka pengguna yang tidak bergantung pada perubahan data internal.
- Berguna untuk tampilan statis yang tidak memerlukan pembaruan berdasarkan input atau interaksi pengguna.

**Contoh penggunaan**: \
Menampilkan teks statis, ikon, gambar, atau komponen UI yang tidak memerlukan perubahan dinamis.

#### Stateful Widget:
**Deskripsi**: \
Stateful widget adalah jenis widget di Flutter yang memiliki data internal yang dapat berubah. Dapat memperbarui tampilan berdasarkan perubahan data internal atau input pengguna.

**Karakteristik**: 
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

# TUGAS 8
**Nama: Joy Debora Sitorus**\
**NPM: 2206082991**\
**Kelas: PBP D**

# CHECKLIST TUGAS
![App1](https://i.postimg.cc/Yqsfb5nZ/Screenshot-1837.png)

## 1. Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:
Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.\
Memiliki sebuah tombol Save.\
Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:
- Setiap elemen input tidak boleh kosong.
- Setiap elemen input harus berisi data dengan tipe data atribut modelnya.

![App1](https://i.postimg.cc/0jNDCnp9/Screenshot-1827.png)
![App2](https://i.postimg.cc/7YfSGBHV/Screenshot-1825.png)
![App3](https://i.postimg.cc/G2LycKgv/Screenshot-1826.png)

Membuat berkas `inventory_form.dart` pada direktori screens yang mengimplementasikan formulir untuk menambahkan item ke dalam inventaris. membuat class ShopFormPage yang menggunakan StatefulWidget karena memiliki state yang berubah selama waktu (nilai _name, _price, _description).
```
import 'package:flutter/material.dart';
// Impor drawer yang sudah dibuat sebelumnya
import 'package:inventory/widgets/left_drawer.dart';

class ShopFormPage extends StatefulWidget {
    const ShopFormPage({super.key});

    @override
    State<ShopFormPage> createState() => _ShopFormPageState();
}
```
Menerapkan metode createState() untuk membuat instance dari _ShopFormPageState.

Membuat class _ShopFormPageState yang mengelola state dari ShopFormPage dan mendefinisikan tata letak dan perilaku formulir.
```
class _ShopFormPageState extends State<ShopFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _price = 0;
    String _description = "";
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Center(
                child: Text(
                    'Form Tambah Item',
                ),
                ),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
            ),
            // Tambahkan drawer yang sudah dibuat di sini
            drawer: const LeftDrawer(),
            
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                hintText: "Nama Item",
                                labelText: "Nama Item",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                                ),
                                onChanged: (String? value) {
                                setState(() {
                                    _name = value!;
                                });
                                },
                                validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Nama tidak boleh kosong!";
                                }
                                return null;
                                },
                            ),
                            ),

                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                hintText: "Harga",
                                labelText: "Harga",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                                ),
                                // Tambahkan variabel yang sesuai
                                onChanged: (String? value) {
                                setState(() {
                                    _price = int.parse(value!);
                                });
                                },
                                validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Harga tidak boleh kosong!";
                                }
                                if (int.tryParse(value) == null) {
                                    return "Harga harus berupa angka!";
                                }
                                return null;
                                },
                            ),
                            ),

                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                hintText: "Deskripsi",
                                labelText: "Deskripsi",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                                ),
                                onChanged: (String? value) {
                                setState(() {
                                    // Tambahkan variabel yang sesuai
                                    _description = value!;
                                });
                                },
                                validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Deskripsi tidak boleh kosong!";
                                }
                                return null;
                                },
                            ),
                            ),

                        ],
                    ),
                ),
            ),
        );
    }
}
```
Implementasi program:
- Mendeklarasikan `GlobalKey<FormState>` sebagai kunci untuk mengakses dan memanipulasi status formulir.
- Menyimpan nilai _name, _price, dan _description sebagai bagian dari state.
- Menerapkan metode build yang menghasilkan tampilan halaman formulir.
- Menggunakan widget AppBar sebagai bagian atas halaman.
- Menggunakan widget LeftDrawer (drawer yang sudah dibuat sebelumnya) sebagai drawer di sebelah kiri halaman.
- Menggunakan widget Form sebagai wadah untuk elemen formulir.
- Menerapkan widget SingleChildScrollView dan Column untuk mengatasi masalah overflow saat keyboard muncul.
- Menambahkan tiga buah TextFormField untuk mengambil input nama item, harga, dan deskripsi.
- Menggunakan onChanged untuk memperbarui state setiap kali nilai input berubah.
- Menambahkan validasi untuk masing-masing input.

Membuat tombol "Save" (ElevatedButton) yang ketika ditekan akan memvalidasi formulir.
```
...
Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Colors.indigo),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {}
      },
      child: const Text(
        "Save",
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
),
```

## 2. Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
Membuat berkas `inventory_card.dart` pada direktori widgets untuk menampilkan kartu item dalam inventaris. Membuat class ShopItem untuk merepresentasikan model item dengan properti nama (name), ikon (icon), dan warna (color).
```
import 'package:flutter/material.dart';
import 'package:inventory/screens/inventory_form.dart';

class ShopItem {
  final String name;
  final IconData icon;
  final Color color; // Menambahkan properti warna

  ShopItem(this.name, this.icon, this.color);
}
```

Membuat class ShopCard untuk menampilkan kartu item toko dengan properti yang ditentukan oleh ShopItem.
```
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Tambah Item") {
            // Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ShopFormPage()));
          }
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
}
```
Implementasi program:
- Konstruktor ShopCard menerima sebuah objek ShopItem dan memberikan key opsional.
- Widget ini menggunakan Material sebagai latar belakang dengan warna sesuai dengan properti color dari ShopItem.
- InkWell digunakan untuk memberikan efek respons saat kartu ditekan.
- Pada setiap onTap, ScaffoldMessenger menampilkan SnackBar memberikan umpan balik bahwa tombol telah ditekan dan kemudian, tergantung pada jenis tombol (item.name), melakukan navigasi ke halaman formulir untuk menambahkan item baru ke dalam inventaris menggunakan Navigator.push.

## 3. Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
![App4](https://i.postimg.cc/1zH8Y6RX/Screenshot-1828.png)

Menambahkan fungsi pada berkas `inventory_form.dart` yang bertujuan untuk menangani aksi yang terkait dengan tombol "Save" di dalam formulir.
```
...
Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Colors.indigo),
      ),
      onPressed: () {
          if (_formKey.currentState!.validate()) {
              showDialog(
                  context: context,
                  builder: (context) {
                  return AlertDialog(
                      title: const Text('Item berhasil tersimpan'),
                      content: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                          Text('Nama: $_name'),
                          //Munculkan value-value lainnya
                          Text('Harga: $_price'),
                          Text('Deskripsi: $_description'),
                          ],
                      ),
                      ),
                      actions: [
                      TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                          Navigator.pop(context);
                          },
                      ),
                      ],
                  );
                  },
              );
              }
          _formKey.currentState!.reset();
      },
      child: const Text(
          "Save",
          style: TextStyle(color: Colors.white),
      ),
      ),
  ),
),
...
```
Implementasi program:
- Align dan Padding digunakan untuk mengatur posisi widget anaknya, dalam hal ini, tombol "Save", ke bagian bawah tengah layar.
- ElevatedButton digunakan sebagai tombol "Save" yang akan memicu aksi saat ditekan.
- Pengecekan apakah formulir saat ini valid menggunakan _formKey.currentState!.validate():\
Jika formulir valid, sebuah showDialog ditampilkan untuk memberi tahu pengguna bahwa item berhasil tersimpan.\
Di dalam showDialog, sebuah AlertDialog dibuat dengan judul "Item berhasil tersimpan" dan konten berupa Column dari Text yang menampilkan nama, harga, dan deskripsi yang diisi pengguna.\
Terdapat pula tombol "OK" yang ketika ditekan akan menutup dialog menggunakan Navigator.pop(context).\
Setelah menampilkan dialog, formulir di-reset ke kondisi awal menggunakan _formKey.currentState!.reset().

## 4. Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.\
Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.\
Ketika memiih opsi (Tambah Item), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.

![App4](https://i.postimg.cc/d0q1d1RY/Screenshot-1838.png)

Membuat berkas `left_drawer.dart` pada direktori widgets, untuk membuat drawer (menu geser) di aplikasi. Drawer ini berisi beberapa item menu, seperti "Halaman Utama" dan "Tambah Item," yang memungkinkan pengguna untuk berpindah ke halaman-halaman yang berbeda.
```
import 'package:flutter/material.dart';
import 'package:inventory/screens/menu.dart';
// Impor halaman ShopFormPage jika sudah dibuat
import 'package:inventory/screens/inventory_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
            // Bagian drawer header
            const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.indigo,
            ),
            child: Column(
                children: [
                Text(
                    'Inventory',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Catat seluruh barang inventorymu di sini!",
                    // Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    ),
                    ),
                ],
            ),
            ),
          // Bagian routing
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                    ));
            },
            ),
            ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                    builder: (context) => ShopFormPage(),
                    ));
            },
            ),
        ],
      ),
    );
  }
}
```
Implementasi program:
- Konstruktor LeftDrawer digunakan untuk membuat instance dari drawer.
- Menggunakan Drawer sebagai wadah utama untuk item-menu.
- Menggunakan ListView untuk menampung daftar item-menu dengan opsi scroll jika terlalu banyak item.
- Membuat bagian header drawer (DrawerHeader) yang memiliki tulisan "Inventory" dan deskripsi singkat tentang pencatatan barang inventory.
- Menyertakan icon dan teks untuk opsi navigasi, seperti "Halaman Utama" dan "Tambah Item."

## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
**Method push()** menambahkan suatu route ke dalam stack route yang dikelola oleh Navigator. Method ini menyebabkan route yang ditambahkan berada pada paling atas stack, sehingga route yang baru saja ditambahkan tersebut akan muncul dan ditampilkan kepada pengguna.

Contoh penggunaan:
```
...
    if (item.name == "Tambah Produk") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ShopFormPage()));
    }
...
```

**Method pushReplacement()** menghapus route yang sedang ditampilkan kepada pengguna dan menggantinya dengan suatu route. Method ini menyebabkan aplikasi untuk berpindah dari route yang sedang ditampilkan kepada pengguna ke suatu route yang diberikan. Pada stack route yang dikelola Navigator, route lama pada atas stack akan digantikan secara langsung oleh route baru yang diberikan tanpa mengubah kondisi elemen stack yang berada di bawahnya.

Contoh penggunaan:
```
...
    onTap: () {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(),
        ));
    },
...
```

**Perbedaan keduanya:**\
Terletak pada apa yang dilakukan kepada route yang berada pada atas stack. push() akan menambahkan route baru diatas route yang sudah ada pada atas stack, sedangkan pushReplacement() menggantikan route yang sudah ada pada atas stack dengan route baru tersebut.

## Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

![App1](https://i.postimg.cc/s2vF238G/sample-flutter-layout.png)

1. `Container` adalah widget dasar untuk mengatur layout. Ini dapat menentukan ukuran, padding, margin, dan dekorasi dari elemen anaknya.\
**Konteks Penggunaan**: Digunakan ketika ingin mengatur tata letak elemen-elemen anak dengan lebih rinci, seperti menentukan ukuran atau memberikan dekorasi.
2. `Row dan Column` adalah widget untuk menempatkan elemen-elemen anak secara horizontal (Row) atau vertikal (Column).\
**Konteks Penggunaan**: Digunakan untuk mengatur tata letak elemen-elemen anak secara berderet atau berkolom.
3. `ListView` adalah widget untuk menampilkan daftar elemen anak secara bergulir.\
**Konteks Penggunaan**: Ideal untuk menampilkan daftar panjang data, seperti daftar kontak atau pesan.
4. `Stack` adalah widget yang menempatkan elemen-elemen anak di atas satu sama lain.\
**Konteks Penggunaan**: Digunakan ketika ingin menumpuk beberapa elemen, seperti menempatkan teks di atas gambar.
5. `Expanded dan Flexible` adalah widget untuk memberikan ruang tambahan pada elemen anak di dalam Row, Column, atau Flex.\
**Konteks Penggunaan**: Digunakan ketika ingin memberikan proporsi ruang tambahan pada elemen anak, misalnya, dalam distribusi ruang di dalam Row atau Column.
6. `GridView` adalah widget untuk menampilkan elemen anak dalam bentuk grid.\
**Konteks Penggunaan**: Cocok untuk menampilkan data dalam bentuk grid, seperti galeri foto atau tampilan produk dalam aplikasi e-commerce.
7. `Wrap` adalah widget yang mengatur elemen-elemen anak ke dalam baris atau kolom berdasarkan ruang yang tersedia. Jika elemen-anak melebihi lebar atau tinggi yang tersedia, mereka akan dipindahkan ke baris atau kolom berikutnya.\
**Konteks Penggunaan**: Digunakan ketika terdapat sejumlah elemen yang ingin ditampilkan dalam area yang terbatas, dan kita ingin mengelola penataan otomatisnya.
8. `Positioned` adalah widget yang memposisikan elemen anaknya relatif terhadap kotak yang mengandungnya.\
**Konteks Penggunaan**: Cocok untuk secara eksplisit mengatur posisi suatu widget dalam suatu tata letak, misalnya, dalam tumpukan (stack) di mana kita ingin menentukan posisi elemen child.
9. `SizedBox` adalah widget yang memberikan dimensi tetap pada elemen anaknya. Ini dapat digunakan untuk memberikan batasan ukuran pada widget di dalamnya.\
**Konteks Penggunaan**: Berguna untuk memberikan ukuran tetap pada suatu widget, misalnya, untuk memberikan jarak atau ruang kosong.

## Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
1. `TextFormField` untuk Nama Item:\
**Alasan Penggunaan:** TextFormField digunakan untuk mengambil input teks seperti nama item. Dekorasi dan validasi ditambahkan untuk memberikan panduan kepada pengguna dan memastikan bahwa nama item tidak boleh kosong.

2. `TextFormField` untuk Harga:\
**Alasan Penggunaan:** TextFormField juga digunakan untuk mengambil input teks, tetapi pada kasus ini, nilai yang dimasukkan diharapkan berupa angka (harga). Validasi dilakukan untuk memastikan bahwa input adalah angka.

3. `TextFormField` untuk Deskripsi:\
**Alasan Penggunaan:** Seperti elemen input sebelumnya, TextFormField digunakan untuk mengambil input teks. Deskripsi adalah data teks yang lebih panjang, dan penggunaan TextFormField memungkinkan validasi untuk memastikan deskripsi tidak boleh kosong.

4. `ElevatedButton` untuk Simpan:\
**Alasan Penggunaan:** ElevatedButton digunakan sebagai tombol "Simpan" untuk menyimpan data input. Digunakan untuk mengirimkan data ke fungsi _formKey.currentState!.validate() saat ditekan, dan jika valid, data akan ditampilkan dalam AlertDialog dan ditambahkan ke dalam daftar item.

## Bagaimana penerapan clean architecture pada aplikasi Flutter?
Clean Architecture adalah pendekatan desain perangkat lunak yang bertujuan untuk memisahkan konsep bisnis dari implementasi teknis dan infrastruktur. Dalam konteks Flutter atau pengembangan aplikasi mobile, implementasi Clean Architecture dapat membantu memisahkan logika bisnis dari detail implementasi seperti tata letak UI atau sumber daya luar.

Contoh implementasi pembagian struktur proyek sebagai penerapan Clean Architecture pada aplikasi petkeeper inventory-mobile:
1. **Entities (Entitas):** Menempatkan model atau kelas yang mewakili konsep bisnis dalam direktori lib/models. Contohnya, kelas Item yang digunakan untuk merepresentasikan data item.
2. **Interface atau UI:** Menempatkan tata letak UI, widget, dan logika interface di dalam lib/screens dan lib/widgets. Hal ini bertujuan untuk memisahkan logika interface sebisa mungkin dari logika bisnis.
3. **Main.dart:** Menerapkan file utama aplikasi yang mungkin memuat dependency injection dan membuat instansiasi objek yang dibutuhkan (seperti repository atau kasus penggunaan) di dalam lib/main.dart.

## Bonus:  
Membuat sebuah halaman baru, yaitu halaman daftar item yang sudah dibuat dengan isi halamannya adalah setiap data produk yang sudah pernah dibuat.\
Mengarahkan pengguna ke halaman tersebut jika menekan tombol Lihat Produk pada halaman utama atau drawer.

![App1](https://i.postimg.cc/SQXWjTNG/Screenshot-1831.png)

Membuat direktori models pada lib dan membuat berkas baru `item.dart` untuk merepresentasikan item dalam inventaris.
```
class Item {
  String name;
  int price;
  String description;

  Item({
    required this.name,
    required this.price,
    required this.description,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      price: json['price'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'description': description,
      };
}
```
Implementasi program:
- Properti name, price, dan description digunakan untuk menyimpan informasi mengenai suatu item.
- Konstruktor Item digunakan untuk membuat instance dari kelas Item dengan menginisialisasi nilai properti.
- Metode fromJson digunakan sebagai factory method untuk membuat instance Item dari data yang diberikan dalam format JSON. Ini sering digunakan saat mengonversi data dari sumber eksternal, seperti respons API, menjadi objek Dart.
- Metode toJson digunakan untuk mengonversi instance Item menjadi format JSON. Ini sering digunakan saat mengirim data dari aplikasi Flutter ke sumber eksternal, seperti API.

Membuat data sementara untuk pengujian dan pengembangan aplikasi sebelum diimplementasikan dengan data sebenarnya dari API atau sumber eksternal lainnya.
```
List<Item> items = [
  Item(
    name: 'Organic Cat Food',
    price: 150000,
    description:
        'Premium organic cat food with real chicken',
  ),
  Item(
    name: 'Cat Litter Box',
    price: 300000,
    description: 'Large, easy-to-clean litter box for cat',
  ),
];
```

Pada direktori screens, membuat berkas baru `inventory_detail.dart` untuk menampilkan detail suatu item dalam inventaris. 
```
import 'package:flutter/material.dart';
import 'package:inventory/models/item.dart';

class ItemDetail extends StatelessWidget {
  final Item item;

  const ItemDetail({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(8)),
              Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF00071f),
                  border: Border.all(color: const Color(0xFF1D3E67)),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name: ${item.name}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                      "Price: ${item.price}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                      "Description: ${item.description}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
Implementasi program:
- Konstruktor ItemDetail menerima parameter item yang merupakan instance dari kelas Item. Hal ini memungkinkan kelas ItemDetail untuk menampilkan detail dari item yang spesifik.
- Dengan meng-extend StatelessWidget, ItemDetail digunakan untuk membuat tampilan UI yang statis (tanpa keadaan yang berubah).
- Di dalam metode build, dibangun struktur tampilan menggunakan widget Scaffold sebagai kerangka tampilan utama.
- AppBar digunakan sebagai bagian atas tampilan dan menampilkan judul yang sesuai dengan nama item.
- SingleChildScrollView digunakan untuk memastikan bahwa tampilan dapat digulir jika kontennya melebihi ukuran layar.
- Align dengan Alignment.topCenter digunakan untuk memposisikan konten ke bagian atas tengah layar.
- Dalam Column, terdapat widget-container yang menampilkan informasi detail item seperti nama, harga, dan deskripsi.
- Bagian ini menggunakan Container untuk styling dengan warna latar belakang, border, dan padding tertentu untuk meningkatkan estetika tampilan.
- Setiap informasi item ditampilkan menggunakan widget Text dengan gaya tertentu (ukuran font, warna teks, dll.).

Pada direktori screens, membuat berkas baru `inventory_list.dart` untuk menampilkan daftar item dalam bentuk grid.
```
import 'package:flutter/material.dart';
import 'package:inventory/widgets/left_drawer.dart';
import 'package:inventory/models/item.dart';
import 'package:inventory/widgets/inventory_card.dart';

class ItemListPage extends StatelessWidget {
  final List<Item> items;

  const ItemListPage({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LeftDrawer(),
      appBar: AppBar(
        title: const Text('Item List'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return ItemCard(items[index]);
        },
      ),
    );
  }
}
```
Implementasi program:
- Konstruktor ItemListPage menerima parameter items, yang merupakan daftar item yang akan ditampilkan.
- Dengan meng-extend StatelessWidget, kelas ini digunakan untuk membuat tampilan UI yang statis.
- Tampilan utama dibungkus dalam widget Scaffold, yang menyediakan kerangka kerja untuk halaman.
- Drawer (LeftDrawer) ditambahkan ke halaman sebagai menu geser di sebelah kiri layar.
- AppBar digunakan sebagai bagian atas tampilan dan menampilkan judul "Item List".
- Body dari tampilan adalah GridView.builder yang digunakan untuk menampilkan daftar item dalam bentuk grid yang dapat digulir.
- SliverGridDelegateWithFixedCrossAxisCount digunakan untuk menentukan tata letak grid dengan jumlah kolom tetap (2 kolom) dan rasio aspek child (item) sebesar 0.7.
- Dalam GridView.builder, setiap item diambil dari daftar item menggunakan ItemCard, yang merupakan widget untuk menampilkan kartu item.

Pada direktori widget, membuat berkas baru `menu_card.dart` untuk menampilkan kartu menu pada aplikasi. 
```
import 'package:flutter/material.dart';
import 'package:inventory/widgets/menu_item.dart';

class MenuCard extends StatelessWidget {
  final MenuItem item;

  const MenuCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        onTap: () {
          item.onTap(context);
        },
        child: Container(
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
                  item.title,
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
}
```
Implementasi program:
- Konstruktor MenuCard menerima parameter item yang merupakan instance dari kelas MenuItem. MenuItem berisi informasi tentang ikon, judul, warna latar belakang, dan fungsi yang akan dijalankan saat item ditekan.
- Dengan meng-extend StatelessWidget, MenuCard digunakan untuk membuat tampilan UI yang statis.
- Dalam metode build, dibangun struktur tampilan menggunakan widget Material sebagai wadah utama dengan warna latar belakang yang sesuai.
- InkWell digunakan sebagai area yang responsif terhadap sentuhan pengguna. Ketika area ini ditekan, fungsi yang ditentukan dalam MenuItem akan dijalankan.
- Container digunakan untuk menata elemen-elemen dalam kartu dengan memberikan padding.
- Di dalam Container, terdapat Column yang berisi Icon dan Text. Icon menampilkan ikon menu, dan Text menampilkan judul menu.

Pada direktori widget, membuat berkas baru `menu_item.dart` untuk merepresentasikan satu item pada menu dalam aplikasi Flutter.
```
import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final Color color;
  final Function(BuildContext context) onTap;

  MenuItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}
```
Implementasi program:
- Kelas MenuItem memiliki empat properti:\
title: Menyimpan judul atau label dari item menu.\
icon: Menyimpan ikon yang akan ditampilkan untuk item menu.\
color: Menyimpan warna latar belakang dari kartu menu yang sesuai dengan item.\
onTap: Menyimpan fungsi yang akan dijalankan saat item menu ditekan. Fungsi ini menerima parameter BuildContext untuk memungkinkan navigasi atau interaksi dengan elemen UI lainnya.
- Kelas ini menggunakan parameter bertipe required pada semua propertinya, sehingga saat membuat instance dari MenuItem, semua properti harus diberikan.
- Properti-properti ini digunakan untuk mengkonfigurasi dan membangun tampilan kartu menu yang sesuai.

Modifikasi class `_ShopFormPageState` pada berkas inventory_form.dart didalam direktori screens untuk menampilkan dialog yang berisi informasi dari item yang telah diisi oleh pengguna.

```            
body: Form(
    key: _formKey,
    child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                          showFormData(context, item);
                          items.add(item);
                          _formKey.currentState!.reset();
                        }
                      },
                    child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                    ),
                    ),
                ),
            ),
        ],
    ),
  ),
)
```
Implementasi program:
- Program membangun antarmuka pengguna untuk formulir yang memungkinkan pengguna mengisi informasi item.
- Ketika tombol "Save" ditekan, dilakukan pengecekan validasi formulir (_formKey.currentState!.validate()).
- Jika formulir valid, fungsi showFormData(context, item) dipanggil untuk menampilkan dialog yang berisi informasi item yang telah diisi.
- Setelah itu, item baru (item) ditambahkan ke dalam daftar items.
- Terakhir, formulir di-reset ke keadaan awal menggunakan _formKey.currentState!.reset().

Menambahkan method `showFormData` pada berkas inventory_form.dart untuk menampilkan dialog yang berisi informasi dari item yang telah diisi oleh pengguna.
```
...
void showFormData(BuildContext context, Item item) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Card Saved Successfully'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Card Name: ${item.name}'),
              Text('Amount: ${item.price}'),
              Text('Description: ${item.description}'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}
```
Ketika dipanggil, fungsi ini membuka AlertDialog yang berisi informasi seperti nama item, harga, dan deskripsi.\
Dialog ini memiliki tombol "Close" yang, ketika ditekan, akan menutup dialog.

# TUGAS 9
**Nama: Joy Debora Sitorus**\
**NPM: 2206082991**\
**Kelas: PBP D**

# CHECKLIST TUGAS
## 1. Membuat halaman login pada proyek tugas Flutter.
Membuat django-app bernama authentication pada project Django yang telah dibuat sebelumnya dengan menjalankan:
```
python manage.py startapp authentication
```

Menambahkan `authentication` ke INSTALLED_APPS pada main project settings.py aplikasi Django.

Menjalankan perintah untuk menginstal library yang dibutuhkan:
```
pip install django-cors-headers
```

Menambahkan `corsheaders` ke INSTALLED_APPS pada main project settings.py aplikasi Django.

Menambahkan `corsheaders.middleware.CorsMiddleware` ke MIDDLEWARE pada main project settings.py aplikasi Django.

Menambahkan beberapa variabel berikut ini pada main project settings.py aplikasi Django.
```
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```

Membuat sebuah metode view untuk login pada authentication/views.py
```
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
```

Membuat berkas `urls.py` pada direktori authentication dan tambahkan URL routing terhadap fungsi yang sudah dibuat dengan endpoint login
```
from django.urls import path
from authentication.views import login

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
]
```
Terakhir, tambahkan path('auth/', include('authentication.urls')), pada file shopping_list/urls.py.

## 2. Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
Menginstal package yang telah disediakan oleh tim asisten dosen dengan menjalankan perintah berikut di Terminal.
```
flutter pub add provider
flutter pub add pbp_django_auth
```

Memodifikasi root widget untuk menyediakan CookieRequest library ke semua child widgets dengan menggunakan Provider.
```
class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Flutter App',
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                    useMaterial3: true,
                ),
                home: MyHomePage()),
            ),
    }
}
```
Membuat berkas baru `login.dart` pada direktori screens
```
import 'package:shopping_list/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
const LoginApp({super.key});

@override
Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        theme: ThemeData(
            primarySwatch: Colors.blue,
    ),
    home: const LoginPage(),
    );
    }
}

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password = _passwordController.text;

                                // Cek kredensial
                                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                // gunakan URL http://10.0.2.2/
                                final response = await request.login("http://127.0.0.1:8000/auth/login/", {
                                'username': username,
                                'password': password,
                                });
                    
                                if (request.loggedIn) {
                                    String message = response['message'];
                                    String uname = response['username'];
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Login Gagal'),
                                            content:
                                                Text(response['message']),
                                            actions: [
                                                TextButton(
                                                    child: const Text('OK'),
                                                    onPressed: () {
                                                        Navigator.pop(context);
                                                    },
                                                ),
                                            ],
                                        ),
                                    );
                                }
                            },
                            child: const Text('Login'),
                        ),
                    ],
                ),
            ),
        );
    }
}
```
Mengubah home: MyHomePage() menjadi home: LoginPage() pada berkas `main.dart`

## 3.  Membuat model kustom sesuai dengan proyek aplikasi Django.
```
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Product> welcomeFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String welcomeToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String model;
    int pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int amount;
    String description;
    String category;
    int price;

    Fields({
        required this.user,
        required this.name,
        required this.amount,
        required this.description,
        required this.category,
        required this.price,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
        category: json["category"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "description": description,
        "category": category,
        "price": price,
    };
}
```

## 4.  Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
- Tampilkan name, amount, dan description dari masing-masing item pada halaman ini.
- Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
- Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.
- Tampilkan seluruh atribut pada model item kamu pada halaman ini.
- Tambahkan tombol untuk kembali ke halaman daftar item.

Membuat berkas baru `list_product.dart` pada folder lib/screens
```
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:inventory/models/product.dart';

import 'package:inventory/widgets/left_drawer.dart';

class ProductPage extends StatefulWidget {
    const ProductPage({Key? key}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
Future<List<Product>> fetchProduct() async {
    var url = Uri.parse(
        'http://127.0.0.1:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    print("tes");
    // melakukan konversi data json menjadi object Product
    List<Product> list_product = [];
    for (var d in data) {
        if (d != null) {
            list_product.add(Product.fromJson(d));
        }
    }
    return list_product;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.amount}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}"),
                                    Text(
                                        "${snapshot.data![index].fields.category}"),
                                    Text("${snapshot.data![index].fields.price}"),
                                    const SizedBox(height: 10),
                                ],
                                ),
                            ));
                    }
                }
            }));
    }
}
```

Menambahkan kode pada halaman list_product.dart ke widgets/left_drawer.dart.
```
// Kode ListTile Menu
...
ListTile(
    leading: const Icon(Icons.shopping_basket),
    title: const Text('Daftar Produk'),
    onTap: () {
        // Route menu ke halaman produk
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductPage()),
        );
    },
),
...
```

Mengubah fungsi tombol Lihat Produk pada halaman utama agar mengarahkan ke halaman ProductPage. Melakukan redirection dengan menambahkan else if di bagian akhir onTap yang ada pada berkas `shop_card.dart` di direktori widgets.
```
...
else if (item.name == "Lihat Produk") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductPage()));
      }
...
```
Mengimpor path file yang dibutuhkan saat menambahkan ProductPage ke `left_drawer.dart` dan `shop_card.dart`

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Ya, kita dapat melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Ini sering disebut sebagai "parsing JSON secara dinamis" atau "dynamic JSON parsing". Sebagai contoh, jika kita bekerja dengan bahasa pemrograman yang mendukung tipe data dinamis atau memiliki fitur parsing JSON dinamis, seperti JavaScript atau Python, kita dapat langsung mengurai data JSON tanpa membuat struktur data atau model terlebih dahulu.

Namun, hal tersebut tidak lebih baik maupun lebih buruk daripada membuat model terlebih dahulu. Karena, jika kita membuat model terlebih dahulu, maka kita bisa melakukan type checking pada data yang kita ambil dan ketika data JSON yang diambil memiliki struktur yang kompleks, maka kita bisa mengambil data tersebut dengan lebih mudah.

**Perbedaan Implementasi:** Pengambilan data JSON tanpa membuat model terlebih dahulu dapat menjadi pilihan yang baik untuk kasus sederhana. Di lain sisi, membuat model seringkali memberikan keuntungan tambahan dalam hal keamanan, keterbacaan kode, dan pemeliharaan untuk aplikasi yang lebih kompleks.

## Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest adalah sebuah class yang, berdasarkan pernyataan yang diberikan, digunakan untuk melakukan permintaan (request) ke server dengan menggunakan cookie yang telah disimpan pada shared preferences. Fungsi utama dari CookieRequest adalah memfasilitasi pengelolaan state cookie antara aplikasi Flutter dan server.

Beberapa alasan mengapa instance CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter:
1. **Konsistensi State Cookie:**\
Dengan menggunakan instance CookieRequest yang dibagikan, kita dapat memastikan konsistensi state cookie di seluruh komponen aplikasi. Hal ini penting terutama ketika ada kebutuhan untuk menyimpan atau menggunakan cookie di berbagai bagian aplikasi.
2. **Pengelolaan Otentikasi:**\
Instance CookieRequest dapat digunakan untuk mengelola proses otentikasi, terutama dalam skenario di mana cookie digunakan untuk menjaga status otentikasi pengguna. Dengan berbagi instance, kita dapat dengan mudah menyimpan dan mengirim cookie saat melakukan permintaan terkait otentikasi.
3. **Perilaku Kustom:**\
Dengan instance yang dibagikan, kita memiliki kontrol penuh terhadap perilaku kustom atau pengaturan tambahan yang mungkin diperlukan dalam setiap permintaan. Ini termasuk manipulasi header, penanganan kesalahan, atau pemrosesan respons khusus.
4. **Manajemen Cookie yang Efisien:**\
Dengan mengelola satu instance CookieRequest, kita dapat menghindari duplikasi objek dan memastikan penggunaan sumber daya yang lebih efisien, terutama jika instance tersebut melibatkan proses seperti pembuatan koneksi atau inisialisasi objek yang mahal.
5. **Memudahkan Pemeliharaan:**\
Pemeliharaan dan pembaruan pada manajemen cookie dapat lebih mudah dilakukan karena hanya perlu dilakukan pada satu instance CookieRequest. Hal ini mengurangi potensi kesalahan dan membuat perubahan lebih terpusat.

## Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
Proses pengambilan data dari JSON hingga ditampilkan pada aplikasi Flutter dapat dijelaskan dalam beberapa langkah:
1. **Melakukan Request ke Server:**\
Pertama, kita melakukan permintaan (request) ke server menggunakan metode get pada CookieRequest atau metode lainnya. Permintaan ini dapat berisi informasi seperti endpoint atau URL yang menyediakan data JSON yang diinginkan.
2. **Menerima Data JSON dari Server:**\
Setelah melakukan permintaan, server memberikan respons yang berisi data dalam format JSON. Respons ini dapat berisi informasi yang diperlukan untuk ditampilkan di aplikasi Flutter.
3. **Decode Data JSON:**\
Data JSON yang diterima perlu di-decode agar dapat digunakan di dalam aplikasi. Kita menggunakan fungsi jsonDecode dari pustaka dart:convert untuk mengubah string JSON menjadi struktur data Dart yang dapat dioperasikan.
4. **Mapping Data JSON ke Model atau Struktur Data:**\
Setelah proses decode, kita melakukan mapping data JSON ke dalam model atau struktur data yang telah dibuat sebelumnya. Ini bisa berupa objek atau kumpulan objek sesuai dengan struktur data yang diharapkan.
Alternatifnya, jika tidak menggunakan model, kita dapat memasukkan data JSON ke dalam List atau Map sesuai dengan kebutuhan aplikasi.
5. **Menampilkan Data pada Aplikasi Flutter:**\
Dengan data yang telah di-decode dan dimapping, kita dapat menampilkan informasi tersebut pada antarmuka pengguna aplikasi Flutter. Ini bisa melibatkan penggunaan widget seperti ListView, GridView, atau widget kustom sesuai dengan kebutuhan UI.

## Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Proses autentikasi dari input data akun pada Flutter ke Django hingga tampilnya menu pada Flutter dapat dijelaskan dalam beberapa langkah:
1. **Mengambil Data Username dan Password:**\
Pengguna memasukkan data username dan password melalui antarmuka pengguna di aplikasi Flutter.
2. **Melakukan Request ke Server:**\
Dengan menggunakan CookieRequest atau metode lainnya, Flutter melakukan permintaan (request) ke server Django dengan mengirimkan data login, yaitu username dan password.
3. **Proses Autentikasi oleh Django:**\
Django menerima permintaan login dan melakukan proses autentikasi dengan memeriksa data username dan password yang diterima.
Jika autentikasi berhasil, Django menghasilkan respons yang mencakup informasi pengguna (misalnya, username) dan memberikan token atau cookie sebagai tanda bahwa pengguna berhasil diotentikasi.
4. **Menerima Response dari Server:**\
Flutter menerima respons dari server Django dalam format JSON yang berisi pesan (misalnya, konfirmasi login berhasil) dan informasi pengguna (seperti username).
5. **Menyimpan Cookie pada Shared Preferences:**\
Setelah menerima respons, Flutter menyimpan cookie atau token yang diterima dari server ke dalam Shared Preferences. Ini memungkinkan Flutter untuk menyimpan informasi autentikasi dan menggunakannya untuk permintaan berikutnya.
6. **Menampilkan Pesan dan Menu pada Aplikasi Flutter:**\
Flutter menanggapi respons dari server dengan menampilkan pesan yang diterima (misalnya, pesan sukses login) kepada pengguna.\
Selanjutnya, Flutter menavigasi pengguna ke layar menu atau mengaktifkan fitur-fitur tertentu dalam aplikasi yang hanya dapat diakses setelah autentikasi berhasil.

## Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.Widget	Fungsi
**Widget:** ItemCard. Fungsi: Menampilkan data item dalam bentuk card.\
**Widget:** MenuCard. Fungsi: Menampilkan menu dalam bentuk card.\
**Widget:** LeftDrawer. Fungsi: Menampilkan drawer berisi menu.