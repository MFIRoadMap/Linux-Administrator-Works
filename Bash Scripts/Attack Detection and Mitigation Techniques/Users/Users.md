5-	Sistem üzerinde parola bilgisi atanmamış kullanıcı profilleri bulunabiliyor. Bu hesapları tespit edilerek kaldırılması veya parola atanması gerekiyor. 
-	Parola bilgisi verilmeyen kullanıcı profillerini tespit edebilmek için “sudo cat /etc/shadow| awk -F: '($2 == "!" ) { print $1 " does not have a password "}'” komutu kullanılıyor (birçok kaynakta $2==”” kullanılarak arama yapılıyordu ama kullanıcı oluşturup shadow dosyasına baktığımda boşluk yerine ünlem koyulduğunu gördüm).
-	Parola atanmayan hesaplar “sudo userdel <UserName>” komurutla silinebilir veya “sudo passwd <UserName>” komurutla parola atanabilir.