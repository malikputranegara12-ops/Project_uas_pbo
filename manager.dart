import '../models/item.dart';
import '../models/buku.dart';
import '../exceptions/data_tidak_valid_exception.dart';

/// Controller utama yang mengelola koleksi perpustakaan.
/// Menerapkan Collection (List, Set), Higher Order Function
/// (.where, .fold, .map, .any), dan Async/Await.
class Manager {
  final List<Item> _koleksi = [];

  /// Menambahkan item baru ke koleksi.
  void tambah(Item item) {
    // Cegah judul duplikat menggunakan .any() (Higher Order Function)
    bool sudahAda = _koleksi.any(
        (i) => i.judul.toLowerCase() == item.judul.toLowerCase());
    if (sudahAda) {
      throw DataTidakValidException(
          'Judul "${item.judul}" sudah terdaftar di koleksi');
    }
    _koleksi.add(item);
  }

  /// Menampilkan seluruh data koleksi (Polymorphism: setiap item
  /// memanggil tampilkanInfo() versinya masing-masing).
  void tampilkanSemua() {
    if (_koleksi.isEmpty) {
      print('Belum ada data koleksi.');
      return;
    }
    for (var item in _koleksi) {
      item.tampilkanInfo();
    }
  }

  /// Mencari item berdasarkan judul menggunakan .where() (HOF).
  List<Item> cari(String keyword) {
    return _koleksi
        .where((i) => i.judul.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }

  /// Menghitung total nilai seluruh koleksi menggunakan .fold() (HOF).
  double hitungTotalNilai() {
    return _koleksi.fold(0.0, (total, item) => total + item.totalNilai);
  }

  /// Menghitung total stok seluruh koleksi menggunakan .fold() (HOF).
  int hitungTotalStok() {
    return _koleksi.fold(0, (total, item) => total + item.stok);
  }

  /// Mengambil kumpulan genre unik dari seluruh buku menggunakan
  /// .whereType(), .map(), dan Set (Collection).
  Set<String> daftarGenreUnik() {
    return _koleksi.whereType<Buku>().map((b) => b.genre).toSet();
  }

  bool get isEmpty => _koleksi.isEmpty;
  int get jumlahItem => _koleksi.length;

  /// Simulasi penyimpanan data secara asynchronous.
  Future<void> simpanData() async {
    print('Menyimpan data ke penyimpanan...');
    await Future.delayed(Duration(seconds: 2));
    print('Data berhasil disimpan.');
  }
}
