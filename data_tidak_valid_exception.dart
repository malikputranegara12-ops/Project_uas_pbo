/// Custom exception yang dilempar ketika data koleksi perpustakaan
/// tidak memenuhi aturan validasi (judul kosong, stok/harga negatif, dll).
class DataTidakValidException implements Exception {
  final String pesan;
  DataTidakValidException(this.pesan);

  @override
  String toString() => 'DataTidakValidException: $pesan';
}
