<h1> Logs </h1>
</br>

Sistem üzerinde geçrçekleşen her işlem kayıt altına alınmaktadır (Aksi belirtilmedikçe). Tutulan kayıtlar kullanılarak da anomali tespiti yapılabilmektedir. Bunlara örnek olarak;

* Sisteme giriş yapmak için gerçekleştirilen hatalı giriş denemeleri "/var/log/audit/audir.log" dosyası altında tutulmaktadır. Bu dosya üzerinde "failed" kelimesi filtrelenerek hatalı giriş denemeleri kontrol edilebilir. Benzer şekilde "lastb" komutu kullanılarka hatalı giriş denemeleri yapılan kullanıcı hesapları görüntülenebilir.
   - Normalde farklı (sistemde tanımlı olmayan) username kullanılarak parola denemeleri yapılmışsa Bruteforce saldırısı olduğu anlaşılabiliyor.
     - Sisteme giriş yapan bir kullanıcının aktivitelerini görüntülemek için "/var/log/" dizini altında grep komutuyla kullanıcı adı filtrelenerek görütülenebilir.
