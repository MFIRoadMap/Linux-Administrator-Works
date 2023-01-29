<h1> Users </h1>
</br

1 -	Sistem üzerinde parola bilgisi atanmamış kullanıcı profilleri bulunabiliyor. Bu hesapları tespit edilerek kaldırılması veya parola atanması gerekiyor. 
*	Parola bilgisi verilmeyen kullanıcı profillerini tespit edebilmek için;
  - ***“sudo cat /etc/shadow| awk -F: '($2 == "!" )”*** komutu kullanılıyor (birçok kaynakta $2==”” kullanılarak arama yapılıyordu ama kullanıcı oluşturup shadow dosyasına baktığımda boşluk yerine ünlem koyulduğunu gördüm).
  -	Parola atanmayan hesaplar için;
    - ***“sudo userdel -User Name-”*** komutu kullanılarak kullanıcı hesabı silinebilir.
      -  Eğer ki kullanıcı hesabı ***“sudo deluser-User Name-”***  komutuyla silinirse, kullanıcının  oluşturduğu dosya ve dizinler silnmez.
    - ***“sudo passwd -User Name-”*** komurutu kullanılarak kulanıcı hesabına parola ataması yapılabilir.


</br></br>


2 - UID = '0' değeri, varsayılanda Root hesabı için ayrılmıştır. Root, Linux sistemlerde süper kullanıcı (Superuser) hesabıdır ve sistemdeki en yüksek erişim haklarına sahiptir. Diğer kullanıcı hesablarının UID' = '0' olarak yapılandırılması, onlara Root düzeyinde ayrıcalıklar sağlayacaktır.
* Sistem üzerinde UID (UserID) değeri 0 olan birden fazla hesap olmamalı. Sadece Root kullanıcısı olmalı ya da Root kullanıcısı devre dışı bırakılıp farklı bir yetkili kullanıcı hesabı oluşturulmalı. 
  - Sistem üzerindeki birden fazla UID = 0 değerine sahip kullanıcı hesapları kaldırılmalı veya UID değeri deiştirilmelidir.
  - UID değeri 0 olan kullanıcıları listeleyebilmek için ***“cat /etc/passwd | awk -F: '($3==0) { print $1 }'”*** komutu kullanılabilir.


</br></br>

