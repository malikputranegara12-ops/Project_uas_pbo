import '../exceptions/data_tidak_valid_exception.dart';

/// Class induk (abstract) untuk seluruh koleksi perpustakaan.
/// Menerapkan Encapsulation (field private + getter/setter + validasi)
/// dan menjadi dasar Inheritance & Polymorphism.
abstract class Item {
  String _judul;
  int _stok;
  double _harga;

  Item(this._judul, int stok, double harga)
      : _stok = stok,
        _harga = harga {
    // Validasi awal saat object dibuat
    if (_judul.trim().isEmpty) {
      throw DataTidakValidException('Judul tidak boleh kosong');
    }
    if (_stok < 0) {
      throw DataTidakValidException('Stok tidak boleh negatif');
    }
    if (_harga < 0) {
      throw DataTidakValidException('Harga tidak boleh negatif');
    }
  }

  // ---------- Getter ----------
  String get judul => _judul;
  int get stok => _stok;
  double get harga => _harga;

  // ---------- Setter dengan validasi ----------
  set judul(String value) {
    if (value.trim().isEmpty) {
      throw DataTidakValidException('Judul tidak boleh kosong');
    }
    _judul = value;
  }

  set stok(int value) {
    if (value < 0) {
      throw DataTidakValidException('Stok tidak boleh negatif');
    }
    _stok = value;
  }

  set harga(double value) {
    if (value < 0) {
      throw DataTidakValidException('Harga tidak boleh negatif');
    }
    _harga = value;
  }

  /// Total nilai koleksi untuk item ini (harga satuan x stok)
  double get totalNilai => _harga * _stok;

  /// Method yang wajib di-override oleh setiap class turunan (Polymorphism)
  void tampilkanInfo();
}
