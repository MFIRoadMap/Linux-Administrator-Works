<h1> Users </h1>
</br

1 -	Sistem üzerinde parola bilgisi atanmamış kullanıcı profilleri bulunabiliyor. Bu hesapları tespit edilerek kaldırılması veya parola atanması gerekiyor. 
*	Parola bilgisi verilmeyen kullanıcı profillerini tespit edebilmek için;
    - ***“sudo cat /etc/shadow| awk -F: '($2 == "!" )”*** komutu kullanılıyor (birçok kaynakta $2==”” kullanılarak arama yapılıyordu ama kullanıcı oluşturup shadow dosyasına baktığımda boşluk yerine ünlem koyulduğunu gördüm).
 * Parola atanmayan hesaplar için alınabilecek aksiyonlar;
   - ***“sudo userdel -User Name-”*** komutu kullanılarak kullanıcı hesabı silinebilir.
      -  Eğer ki kullanıcı hesabı ***“sudo deluser-User Name-”***  komutuyla silinirse, kullanıcının  oluşturduğu dosya ve dizinler silnmez.
    - ***“sudo passwd -User Name-”*** komurutu kullanılarak kulanıcı hesabına parola ataması yapılabilir.


</br></br>


2 - UID 0 değeri, varsayılanda Root hesabı için ayrılmıştır. Root, Linux sistemlerde süper kullanıcı (Superuser) hesabıdır ve sistemdeki en yüksek erişim haklarına sahiptir. Bir kullanıcı hesabının UID 0 olarak yapılandırılması, kullanıcıya Root düzeyinde ayrıcalıklar sağlayacaktır.
* Sistem üzerinde UID (UserID) değeri 0 olan birden fazla hesap olmamalı. Sadece Root kullanıcısı olmalı ya da Root kullanıcısı devre dışı bırakılıp farklı bir yetkili kullanıcı hesabı oluşturulmalı. 
  - UID değeri 0 olan kullanıcıları listeleyebilmek için ***“cat /etc/passwd | awk -F: '($3==0) { print $1 }'”*** komutu kullanılabilir.
  - Sistem üzerindeki birden fazla UID = 0 değerine sahip kullanıcı hesapları kaldırılmalı veya UID değeri deiştirilmelidir.
  

</br></br>


3 - Root dizini altında bulunan herhangi bir dosyanın Other Users'lar için x (Execute) yetkisi olmamalıdır. Bu  dosyaların bulunup kaldırılması gerekiyor.


</br></br>


4 - Sistem üzerinde Home dizini olmayan kullanıcılar bulunabiliyor. Bu durum genelde saldırganlar sisteme erişim sağladıktan sonra sistem üzerinde illegal yollarla yeni bir hesap oluşturduğunda görülüyor. Bu aktivitelerin belirli aralıklarda kontrol edilmesi, saldırganın hesabı nasıl oluşturulduğunun belirlenerek gerekli önlemlerin alınması ve tespit edilen hesapların kaldırılması gerekiyor.


</br></br>


5 - Sistem üzerinde kullanıcıların Home dizinleri kullanıcılara özel olmalıdır. Yani farklı bir kullanıcı tarafından erişilememelidir. Bunun için kullnıcıların Home dizinine erişim yetkisinin 770'den büyük olması istenmez. Bu durumda olan Home dizinlerinin tespit edilerek düzeltilmesi gerekiyor.


</br></br>


6 - 





