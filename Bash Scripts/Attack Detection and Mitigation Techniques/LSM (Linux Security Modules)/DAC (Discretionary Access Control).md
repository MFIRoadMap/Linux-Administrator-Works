<h1> DAC (Discretionary Access Control) </h1>
</br>

Linux dosya sistemi üzerinde her dosya ve dizin için üzerinde işlem yapabilecek kullanıcı kontrol mekanizması vardır. Bu kontrol mekanizması DAC (Discretionary access control) modülü kullanılarak sağlanıyor. Bu sayede dosyalara müdahale edilebilecek kullanıcı kapsamı ve yetkileri belirlenebiliyor (Detaylı bilgi için “RBAC and ABAC in Linux” yazımı inceleyebilirsin). 


</br></br>


1 - Sistem üzerinde Other Users için "rwx" (okuma - yazma - çalıştırma) yetkilerine sahip dosyaların tespit edilip (özel bir durum olmadığı sürece) bu yetkinin kaldırılması gerekiyor. Nedeni, saldırganlar bu tür dosyaların içerisinde değişiklikler yapıp çalıştırılarak çeşitli aktiviteler gerçekleştirebiliyor. 
* Disk üzerisnde bu durumda bulunan dosyaları tespit edebilmek için kullanılan iki komut (Komut içerisinde kontrol edilmek istenen yetkilere bağlı olarak 1, 2, 4, 6 veya 7 gibi değerler de kullanılabilir);
   - “sudo df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type f -perm -0002”


</br></br>


2 -	Sistem üzerinde SUID ve SGID bitleri set edilmiş dosya ve dizinlerin tespit ediilmesi gerekiyor. Bu dosya ve dizinlerin, kontrol altında tutulması veya bu yetkilerinin kaldırılması gerekiyor. 
* Bu bitlerin işlevleri özetle;
 	- STICKY (1), dosyayı sadece sahibinin silebileceğini gösterir.
   - SGID (2), herhangi bir kullanıcı dosyayı uygulama sahibinin dahil olduğu grup haklarıyla çalıştırabileceğini gösterir.
   - SUID (4), herhangi bir kullanıcının dosyayı uygulama sahibinin haklarıyla çalıştırabileceğini gösterir. 

- SUID ve SGID bitlerin set edilmiş dosya ve dizinlerin sistemde minimum seviyede olması gerekiyor (Privilege Escalation gibi çeşitli işlemler için kullanılabiliyor). Bu bitlerin set edildiği dosyaları tespit edebilmek için kullanılan komutlar (Komutlar üzerinde SUID = -4000, SGID = -2000 veya SUID+SGID = -6000 değerleriyle ifade ediliyor) ;
   - “sudo df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type f -perm -4000”


 </br></br>


3 -	Sistem üzerinde herhangi bir kullanıcıya veya gruba dahil olmayan dosyalar olabiliyor. Bu dosyaların tespit edilip kaldırılması gerekiyor. 
* Herhangi bir kullanıcıya sahip olmayan dosyaların tespit edebilmek için kullanılan komutlar;
  - sudo df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -nouser
* Herhangi bir gruba sahip olmayan dosyaların tespit edebilmek için kullanılan komutlar;
  - sudo df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -nogroup
  
  
</br></br>



