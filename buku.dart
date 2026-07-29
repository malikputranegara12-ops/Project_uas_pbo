import 'item.dart';
import '../exceptions/data_tidak_valid_exception.dart';

/// Class turunan dari Item, merepresentasikan koleksi buku.
class Buku extends Item {
  String _penulis;
  String genre;

  Buku(String judul, int stok, double harga, String penulis, this.genre)
      : _penulis = penulis,
        super(judul, stok, harga) {
    if (_penulis.trim().isEmpty) {
      throw DataTidakValidException('Nama penulis tidak boleh kosong');
    }
  }

  String get penulis => _penulis;
  set penulis(String value) {
    if (value.trim().isEmpty) {
      throw DataTidakValidException('Nama penulis tidak boleh kosong');
    }
    _penulis = value;
  }

  @override
  void tampilkanInfo() {
    print(
        'Buku       | $judul | Penulis: $_penulis | Genre: $genre | Stok: $stok | Rp$harga');
  }
}
