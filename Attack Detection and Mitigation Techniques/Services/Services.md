<h1> Services </h1>
</br>

1 - Sistem üzerinde çalışan servisler düzenli olarak kontrol edilmelidir. Çalışan bir servis durdurulmuş (stoped) veya devre dışı bırakılmış (disable) olabilirken, çalışmaması gereken bir servis devreye alınmış (enable) veya çalıştırılmış (started) olabilir.
 * Devrede olan servisleri görüntüleyebilmek için ***"systemctl list-unit-files | grep enabled"*** komutu kullanılıyor.
 * Aktif çalışan servisleri görüntülemek için ***"systemctl systemd-sgtop"*** komutu kullanılıyor.


</br></br>


2 - Sistemde kullanılan (açılan-aktif) portların da değişimleri belirli aralıklarla kontrol edilmesi gerekiyor. Herhangi bir yeni servis devreye alınmadığı veya bilgi dahilinde olmadığı sürece yeni bir portun açılması normal karşılanmayacaktır.











