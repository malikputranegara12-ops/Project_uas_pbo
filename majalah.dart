import 'item.dart';
import '../exceptions/data_tidak_valid_exception.dart';

/// Class turunan dari Item, merepresentasikan koleksi majalah.
class Majalah extends Item {
  int _edisi;
  String kategori;

  Majalah(String judul, int stok, double harga, int edisi, this.kategori)
      : _edisi = edisi,
        super(judul, stok, harga) {
    if (_edisi <= 0) {
      throw DataTidakValidException('Edisi harus lebih besar dari 0');
    }
  }

  int get edisi => _edisi;
  set edisi(int value) {
    if (value <= 0) {
      throw DataTidakValidException('Edisi harus lebih besar dari 0');
    }
    _edisi = value;
  }

  @override
  void tampilkanInfo() {
    print(
        'Majalah    | $judul | Edisi: $_edisi | Kategori: $kategori | Stok: $stok | Rp$harga');
  }
}
