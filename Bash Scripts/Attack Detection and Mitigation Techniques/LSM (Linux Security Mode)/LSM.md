2-	Linux sistemlerde dikkat edilmesi gereken ikinci bir nokta da LSM (Linux Security Modules)’dür. 
-	Red Hat tabanlı sistemlerde bunun için SELinux kullanılıyor. SELinux, bir MAC (Mandatory Access Control) uygulamasıdır. Sistem üzerindeki nesne ve konular için erişim denetimi sağlayan kontrol mekanizması olarak tanımlanabilir (Detaylı bilgi için “RBAC and ABAC in Linux” yazımı inceleyebilirsin). SELinux yapısını genel olarak özetlemek gerekirse;
o	SELinux hizmetinin durumunu görüntüleyebilmek için “sestatus” veya “getenforcing” komutu kullanılıyor. 
o	SELinux, Disabled, Enable-Enforcing ve Enable-Permissive olmak üzere üç farklı modda bulunabiliyor. 
	Enable-Enforcing, SELinux politikalarının uygulandığı moddur. İzinsiz bütün erişimler yasaklanır.
	Enable-Permissive, SELinux devrededir ve izinsiz erişimler loglanır ama yetkisiz erişimler engellenmez. 
	Disabled, SELinux tamamen devre dışıdır ve uyarısız bütün erişimlere izin verilir.
o	SELinux’u her oturumda devre dışı bırakmak için ”/etc/sysconfig/selinux” dosyasında “SELINUX= Enable” ifadesini “SELINUX=Disabled” ifadesiyle değiştirmek gerekiyor. 
o	SELinux özelliğini devreye almak için ”/etc/sysconfig/selinux” dosyasında “SELINUX= Disabled” ifadesini “SELINUX=Enable” ifadesiyle değiştirip ardından “sudo reboote” komutuyla sistemin yeniden başlatılması gerekiyor. SELinux özelliği aktive edildikten sonra permissive moduna almak için “sudo setenforce 0”, enforcing moduna almak için “sudo setenforce 1” komutu kullanılıyor. 
o	SELinux modunun Enforcing olduğu görüldükten sonra SELinux modundaki değişimlere önlem olarak belirli aralıklarda “/var/log/audit/audit.log” dosyası kullanırak “enforcing” değeri üzerinde veya “/etc/sysconfig/selinux” dosyası üzerinde değişim yapılıp yapılmadığının kontrol edilmesi gerekiyor (Örnek olarak “sudo cat /var/log/audit/audit.log |grep “enforcing=0”).
 

-	Debian tabanlı sistemlerde bu işlem için APPARMOR kullanılıyor. AppArmor, Red Hat tabanlı sistemlerde bulunan Mandatort Access Control uygulamasıdır. SELinux’a kıyasla aynı işi farklı yöntemle gerçekleştirmektedir (Detaylı bilgi için “RBAC and ABAC in Linux” yazımı inceleyebilirsin). SELinux yapısını genel olarak özetlemek gerekirse;
o	AppArmor hizmetinin durumu görüntüleyebilmek için “service apparmor status” komutu kullanılarak kontrol ediliyor. Bu komut kullanılarak AppArmor hizmetinin aktif olduğundan emin olunması gerekiyor.
o	AppArmor hizmetinin devrede olduğu görüldükten sonra “sudo aa-status” komutu kullanılarak ayarlanan profillerin devrede olup olmadığı kontrol edilmeli. 
o	Son olarak da SELinux’da da olduğu gibi AppArmor hizmeti için meydana gelen değişimler “/var/log/audit/audit.log” dosyasından belirli sıklıklarda kontrol edilmesi gerekiyor.
