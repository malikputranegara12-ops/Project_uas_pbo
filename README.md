# UAS Pemrograman Berorientasi Objek (Dart) — Sistem Perpustakaan

**Nama :** (isi nama Anda)
**NIM  :** (isi NIM Anda)

## Tema Aplikasi
Sistem Perpustakaan — aplikasi CLI sederhana untuk mengelola koleksi buku dan
majalah perpustakaan (tambah data, lihat data, cari data, hitung total nilai
koleksi, dan simpan data).

## Konsep OOP yang Diterapkan
- **Class & Object**: `Item` (induk, abstract), `Buku` dan `Majalah` (turunan), `Manager` (controller).
- **Encapsulation**: field private (`_judul`, `_stok`, `_harga`, `_penulis`, `_edisi`) dengan getter/setter yang memvalidasi input (judul tidak boleh kosong, stok/harga tidak boleh negatif, edisi harus > 0).
- **Inheritance**: `Buku` dan `Majalah` merupakan turunan dari `Item`.
- **Polymorphism**: method `tampilkanInfo()` di-override berbeda pada `Buku` dan `Majalah`, disimpan bersama dalam `List<Item>`.
- **Collection**: `List<Item>` untuk koleksi, `Set<String>` untuk daftar genre unik.
- **Higher Order Function**: `.where()` (cari), `.fold()` (hitung total), `.map()` (ambil genre), `.any()` (cek duplikat judul).
- **Exception**: `DataTidakValidException` (custom exception), digunakan pada validasi setter dan input di `main.dart` dengan `try-catch`.
- **Async/Await**: `Future<void> simpanData()` mensimulasikan proses penyimpanan data dengan delay 2 detik.

## Struktur Folder
```
project_uas/
├── bin/
│   └── main.dart
├── lib/
│   ├── models/
│   │   ├── item.dart
│   │   ├── buku.dart
│   │   └── majalah.dart
│   ├── controllers/
│   │   └── manager.dart
│   └── exceptions/
│       └── data_tidak_valid_exception.dart
└── README.md
```

## Fitur Program
```
===== MENU PERPUSTAKAAN =====
1. Tambah Data
2. Lihat Semua Data
3. Cari Data
4. Hitung Total
5. Simpan Data
6. Keluar
```
Saat program pertama kali dijalankan, tiga data contoh (2 buku, 1 majalah)
otomatis dimuat agar menu langsung bisa dicoba.

## Cara Menjalankan Program
1. Pastikan Dart SDK sudah terpasang (`dart --version`).
2. Masuk ke folder proyek:
   ```
   cd project_uas
   ```
3. Jalankan program:
   ```
   dart run bin/main.dart
   ```
4. Ikuti menu yang muncul di terminal.

## Catatan
Program ini fokus pada penerapan konsep OOP secara benar (bukan pada
banyaknya fitur), sesuai arahan soal UAS.
