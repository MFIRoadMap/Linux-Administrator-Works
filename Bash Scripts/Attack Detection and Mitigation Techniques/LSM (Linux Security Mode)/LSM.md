<h3> LSM (Linux Security Model)</h3>

Linux sistemlerde LSM (Linux Security Modules) modülünün devrede olup olmadığı kontrol edilmelidir (Detaylı bilgi için ***“RBAC and ABAC in Linux(SELinux and AppArmor)”*** yazımı inceleyebilirsin).

*	Red Hat tabanlı sistemlerde bunun için SELinux kullanılıyor. SELinux, bir MAC (Mandatory Access Control) uygulamasıdır. SELinux yapısını genel olarak özetlemek gerekirse;
    - SELinux hizmetinin durumunu görüntüleyebilmek için ***“sestatus”*** veya ***“getenforcing”*** komutu kullanılıyor. SELinux, Disabled, Enable-Enforcing ve Enable-Permissive olmak üzere üç farklı modda bulunabiliyor. 
      -	***Enable-Enforcing***, SELinux politikalarının uygulandığı moddur. İzinsiz bütün erişimler yasaklanır.
      -	***Enable-Permissive***, SELinux devrededir ve izinsiz erişimler loglanır ama yetkisiz erişimler engellenmez. 
      -	***Disabled***, SELinux tamamen devre dışıdır ve uyarısız bütün erişimlere izin verilir.
    -	SELinux’u her oturumda devre dışı bırakmak için ***”/etc/sysconfig/selinux”*** dosyasında ***“SELINUX= Enable”*** ifadesini ***“SELINUX=Disabled”*** ifadesiyle değiştirmek gerekiyor. Hizmetl devreye almak için ***”/etc/sysconfig/selinux”*** dosyasında ***“SELINUX= Disabled”*** ifadesini ***“SELINUX=Enable”*** ifadesiyle değiştirdikten sonra ***“sudo reboote”*** komutuyla sistemin yeniden başlatılması gerekiyor. SELinux hizmeti aktive edildikten sonra permissive moduna almak için ***“sudo setenforce 0”***, enforcing moduna almak için ***“sudo setenforce 1”*** komutu kullanılıyor. 
    -	SELinux hizmetinin Enforcing modunda çalıştığı görüldükten sonra SELinux üzerinde meydana değişimlerin tutulduğu ***“/var/log/audit/audit.log”*** dosyası  belirli aralıklarda kontrol edilmelidir (***“/var/log/audit/audit.log”*** dosyasınde “enforcing” değeri üzerinde veya ***“/etc/sysconfig/selinux”*** dosyası üzerinde herhangi bir değişim yapılıp yapılmadığı kontrol edilmelidir - Örnek olarak “sudo cat /var/log/audit/audit.log |grep “enforcing=0”).
 


*	Debian tabanlı sistemlerde bu işlem için APPARMOR kullanılıyor. AppArmor, Red Hat tabanlı sistemlerde bulunan Mandatort Access Control uygulamasıdır. SELinux’a kıyasla aynı işi farklı yöntemle gerçekleştirmektedir. AppArmor hizmetinin kontrol için;
    -	AppArmor hizmetinin durumu görüntüleyebilmek için ***“service apparmor status”*** komutu kullanılır. Bu komut kullanılarak AppArmor hizmetinin aktif olup olmadığı kontrol edilmeli. Akitif olmadığı durumlarda devreye alınmalıdır.
        - AppArmor hizmetini durdurmak için ***"sudo systemctl stop apparmor.service"*** komutu,
        - AppArmor hizmetini devre dışı bırakmak için ***"sudo systemctl disable apparmor.service"*** komutu, 
        - AppArmor hizmetini aktifleştirmek için ***"sudo systemctl enable apparmor.service"*** komutu,
        - AppArmor hizmetini devreye almak için ***"sudo systemctl start apparmor.service"*** komutu kullanılıyor.
    -	AppArmor hizmetinin devrede olduğu görüldükten sonra ***“sudo aa-status”*** komutu kullanılarak ayarlanan profillerin devrede olup olmadığı kontrol edilmelidir. 
    -	AppArmor üzerinde meydana gelen değişimlerin tutulduğu ***“/var/log/audit/audit.log”*** dosyası belirli sıklıklarda kontrol edilmelidir.
