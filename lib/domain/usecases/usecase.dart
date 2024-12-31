//R tipe data hasil yang akan dikembalikan oleh use case <Result<User>>

//P tipe data parameter yang digunakan dalam use case untuk menjalankan operasi contoh LoginParams, CreateUserParams, 

abstract interface class Usecase<R, P> {
  //Future<R> hasil dari pemanggilan metode call bersifat asynchronous(memerlukan waktu)
  //call menerima parameter bertipe P
  //R adalah tipe data hasil yang akan di kembalikan
  Future<R> call(P params);
}