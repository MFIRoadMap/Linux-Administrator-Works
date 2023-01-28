3-	Günümüde bütün Linux dağıtımlarda varsayılanda gelen firewall uygulamalarıdır. Firewall uygulamalarının de sistem üzerinde aktif durumda olup olmadığının kontrol edilmesi gerekiyor (Bu uygulamalar arka planda iptables kullanmaktadır). 
-	Red Hat tabanlı sistemlerde bu işlem için Firewalld servisi kullanılmaktadır. 
o	Servisin çalışıp çalışmadığı belirli sıklıklarda “systemctl status firewalld” veya “systemctl (is-enabled | is-active) firewalld” komutu kullanılarak kontrol edilmesi gerekiyor. 
	Firewalld durdurmak için -> “systemctl stop firewalld.service” 
	Firewalld başlatmak için -> “systemctl start firewalld” 
	Firewalld devre dışı bırakmak için -> “systemctl disable firewalld”
	Firewalld devreye almak için -> “systemctl enable firewalld”
-	Debian tabanlı sistemlerde bu işlem için Ufw servisi kullanılmaktadır.
o	Servisin devrede olup olmadığı “sudo ufw status” veya “service ufw status” komutuyla kontrol edilmesi gerekiyor. Servisi devreye almak için “service ufw start”, durdrumak için “service ufw stop” komutu kullanılıyor.
o	Servis durumundaki değişimler belirli sıklıklarda ”/var/log/syslog” dosyası üzerinden belirli anahtar kelimeler kullanılarak kontrol edilmesi gerekiyor.
 
-	Iptables firewall tarafından gerçekleştirilen işlemlerin de izlenmesi/kontrol edilmesi gerekiyor. Bu işlem için kullanılabilecek bazı komutlar (Detaylı bilgi için “Iptables” notlarını inceleyebilirsin);
o	“sudo iptables -A INPUT –j LOG” komutu kullanılarak Iptables’ın log üretmeye başlaması sağlanabilir. Benzer şekilde “sudo iptables -A INPUT –s 192.168.50.0/24 –j LOG” gibi komutlar kullanılarak daha spesifik (belirli bir network/subnet için) loglar üretmesi ve ayrıca bu logların özelleştirilmesi sağlanabilir. 
o	Oluşan loglar Debian tabanlı sistemlerde “/var/log/kern.log”, Red Hat tabanlı sistemlerde “/var/log/messages” dosyası üzerinden veya “sudo journalctl –k |grep “IN.=*OUT=.*”” komutu kullanılarak takip edilebilir.
