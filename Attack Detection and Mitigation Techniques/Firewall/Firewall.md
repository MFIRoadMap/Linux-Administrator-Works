
<h1> Firewall </h1>
</br>

1 - Firewall uygulamaları bütün Linux dağıtımlarında varsayılanda gelmektedir. Firewall uygulamalarının de sistem üzerinde aktif durumda olup olmadığının kontrol edilmesi gerekiyor (Bu uygulamalar arka planda iptables kullanmaktadır). 

*   Red Hat tabanlı sistemlerde bu işlem için ***Firewalld*** servisi kullanılmaktadır. 
     - Servisin çalışıp çalışmadığı belirli sıklıklarda ***“systemctl status firewalld”*** veya ***“systemctl (is-enabled | is-active | show) firewalld”*** komutu kullanılarak kontrol edilmesi gerekiyor. 
        -	Firewalld hizmetini durdurmak için ***“systemctl stop firewalld.service”*** komutu,
        - Firewalld hizmetini aktive etmek için ***“systemctl start firewalld”*** komutu,
        -	Firewalld hizmetini devre dışı bırakmak ***“systemctl disable firewalld”*** komutu,
        -	Firewalld hizmetini devreye almak için ***“systemctl enable firewalld”*** komutu kullanılıyor.

*	 Debian tabanlı sistemlerde bu işlem için ***Ufw*** servisi kullanılmaktadır.
     - Servisin devrede olup olmadığı ***“sudo ufw status”*** veya ***“service ufw status”*** komutuyla kontrol edilmesi gerekiyor. 
        -	Ufw servisi devreye almak için ***“service ufw start”*** komutu,
        -	Ufw hizmetini durdrumak için ***“service ufw stop”*** komutu kullanılıyor.
      - Ufw hizmeti üzerinde gerçekleştirilen değişimler ***”/var/log/syslog”*** dosyası üzerinde belirli anahtar kelimeler kullanılarak kontrol edilmesi gerekiyor.
 
 
 </br></br>
 
 
2 - Linux dağıtımlarında Iptables kullanılarak gerçekleştirilen işlemlerin (kurallara takılan işlemler vs.) de izlenmesi/kontrol edilmesi gerekiyor. Bu işlem için kullanılabilecek bazı komutlar (Detaylı bilgi için “Iptables” yazımı inceleyebilirsin);
 * Iptables’ın log üretmeye başlaması için ***“sudo iptables -A INPUT –j LOG”*** komutu kullanılmalı. 
    - Benzer şekilde ***“sudo iptables -A INPUT –s 192.168.50.0/24 –j LOG”*** gibi komutlar kullanılarak daha spesifik (belirli bir network/subnet için) loglar üretmesi ve ayrıca bu logların özelleştirilmesi sağlanabilir. 
    - Oluşan loglar Debian tabanlı sistemlerde ***“/var/log/kern.log”***, Red Hat tabanlı sistemlerde ***“/var/log/messages”*** dosyası üzerinde tutulur. Bu dosyalar üzerinde  ***“sudo journalctl –k |grep “IN.=*OUT=.*”*** gibi komutlar kullanılarak takip edilebilir. Örnek olarak;
      -  "  iptables -A 192.168.1.0/24 -j LOG --log-prefix '*IOTNetwork*'  " tanımı yapılarak Debian tabanlı sistemlerde ***“/var/log/kern.log”*** dosyası altında "*IOTNetwork*" kelimesi grep komutuyla filtrelenebilir.


 </br></br>
 
 
