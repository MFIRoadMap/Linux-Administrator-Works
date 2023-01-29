<h1> FIM (File Integrity Monitoring) </h1>
</br>

FIM, sistem üzerinde dosya ve dizinler üzerinde gerçekleştirilen değişimleri tespit etme izleme/kontrol etme sürecidir. Linux sistemlerde bu süreç dosya ve dizinlerin Hash'leri üzerinden kontrol ediebilmektedir. Bu kontrollere örnek olarak;
* Sistem üzerinde güncelleme yapılmadığı sürece değişiklik göstermesi beklenmeyen dizinler ve dosyalar vardır. Bu dizinler ve içerisindeki dosyaların Hash'leri alınarak belirli aralıklarda değişip değişmediği kontrol edilebilmektedir.
* Sistem üzerinden gerçekleştirilen işlemlerin kayıtlarının tutulduğu log dosyalarının Hash bilgileri alınarak belirli aralıklarda değişiklik gösterip göstermediği kontrol edilebilir (belirli bir süre içerisinde Hash bilgisi değişiklik göstermemesi bir anomali olabileceğini gösterir). Bu sayede sistem üzeirnde loglamanın devre dışı bırakılıp bırakkılmadığı anlaşşılabilir.
