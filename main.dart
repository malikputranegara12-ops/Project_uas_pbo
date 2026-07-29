import 'dart:io';
import '../lib/models/item.dart';
import '../lib/models/buku.dart';
import '../lib/models/majalah.dart';
import '../lib/controllers/manager.dart';
import '../lib/exceptions/data_tidak_valid_exception.dart';

final Manager manager = Manager();

void main() async {
  // Isi beberapa data contoh agar program tidak kosong saat pertama dijalankan
  _isiDataContoh();

  bool jalan = true;
  while (jalan) {
    _cetakMenu();
    stdout.write('Pilih menu (1-6): ');
    String? pilihan = stdin.readLineSync();

    try {
      switch (pilihan) {
        case '1':
          _tambahData();
          break;
        case '2':
          _lihatSemuaData();
          break;
        case '3':
          _cariData();
          break;
        case '4':
          _hitungTotal();
          break;
        case '5':
          await manager.simpanData();
          break;
        case '6':
          jalan = false;
          print('Terima kasih, sampai jumpa!');
          break;
        default:
          print('Pilihan tidak dikenali, silakan coba lagi.\n');
      }
    } on DataTidakValidException catch (e) {
      print('Gagal: ${e.pesan}\n');
    } on FormatException {
      print('Input angka tidak valid, silakan coba lagi.\n');
    } catch (e) {
      print('Terjadi kesalahan: $e\n');
    }
  }
}

void _cetakMenu() {
  print('===== MENU PERPUSTAKAAN =====');
  print('1. Tambah Data');
  print('2. Lihat Semua Data');
  print('3. Cari Data');
  print('4. Hitung Total');
  print('5. Simpan Data');
  print('6. Keluar');
}

void _tambahData() {
  stdout.write('Jenis koleksi (1=Buku, 2=Majalah): ');
  String? jenis = stdin.readLineSync();

  stdout.write('Judul       : ');
  String judul = stdin.readLineSync() ?? '';

  stdout.write('Stok        : ');
  int stok = int.parse((stdin.readLineSync() ?? '0').trim());

  stdout.write('Harga       : ');
  double harga = double.parse((stdin.readLineSync() ?? '0').trim());

  Item item;
  if (jenis == '1') {
    stdout.write('Penulis     : ');
    String penulis = stdin.readLineSync() ?? '';
    stdout.write('Genre       : ');
    String genre = stdin.readLineSync() ?? '';
    item = Buku(judul, stok, harga, penulis, genre);
  } else if (jenis == '2') {
    stdout.write('Edisi       : ');
    int edisi = int.parse((stdin.readLineSync() ?? '0').trim());
    stdout.write('Kategori    : ');
    String kategori = stdin.readLineSync() ?? '';
    item = Majalah(judul, stok, harga, edisi, kategori);
  } else {
    throw DataTidakValidException('Jenis koleksi tidak dikenali');
  }

  manager.tambah(item);
  print('Data berhasil ditambahkan.\n');
}

void _lihatSemuaData() {
  print('--- Daftar Koleksi ---');
  manager.tampilkanSemua();
  print('');
}

void _cariData() {
  stdout.write('Masukkan kata kunci judul: ');
  String keyword = stdin.readLineSync() ?? '';
  var hasil = manager.cari(keyword);
  if (hasil.isEmpty) {
    print('Tidak ditemukan koleksi dengan kata kunci "$keyword".\n');
    return;
  }
  print('--- Hasil Pencarian ---');
  for (var item in hasil) {
    item.tampilkanInfo();
  }
  print('');
}

void _hitungTotal() {
  print('Total item     : ${manager.jumlahItem}');
  print('Total stok     : ${manager.hitungTotalStok()}');
  print('Total nilai    : Rp${manager.hitungTotalNilai()}');
  print('Genre buku     : ${manager.daftarGenreUnik()}\n');
}

void _isiDataContoh() {
  manager.tambah(Buku('Pemrograman Dart Dasar', 5, 75000, 'Andi Wijaya', 'Teknologi'));
  manager.tambah(Buku('Laskar Pelangi', 3, 65000, 'Andrea Hirata', 'Novel'));
  manager.tambah(Majalah('Tempo Edisi Khusus', 10, 25000, 12, 'Berita'));
}
