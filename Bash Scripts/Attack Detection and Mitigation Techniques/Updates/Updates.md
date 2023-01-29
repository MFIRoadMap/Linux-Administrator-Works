<h1> Updates </h1>
</br>

1 - Linux sistemlerde güvenliği sağlayabilmek için dağıtım üzerinde kulanılan uygulamaların güncel tutulması gerekiyor Bunun için paket yöneticilerinde düzenli olarak kontroller yapılmalı. 
Dağıtımlar üzerinde kontroller yapabilmek için RPM tabanlı sistemlerde ***“sudo dnf check-update”***, DEB tabanlı sistemlerde ***“sudo apt list -upgradable”*** komutları kullanlarak sistem üzerinde yapılabilecek güncellemeler listelenebiliyor. Bu güncellemelerin düzenli olarak kontrol edilmesi ve yapılması/otomatize hale getirilmesi gerekiyor. 
*	Sistem üzerinde paket yöneticisi kullanılarak kurulmayan uygulamalar da olabilir. Bu uygulamaların güncellemelerin paket yöneticisi tarafından kontrol edilmeyecektir. Bu uygulamaların güncellemeleri ayrıca kontrol edilmelidir.


</br></br>


2 - Gerçekleştirilen güncellemelerin kayıtları da düzenli olarak kontrol edilmeli. Sistem üzerinde gerçekleştirilen güncelleme işlemleri RPM tabanlı sistemlerde ***"var/log/dnf.log"***, DEB tabanlı sistemlerde ***"/var/log/apt/history.log.1.gz"*** dosyasında tutulmaktadır. Bu kayıtların belirli aralıklarla kontrol edilmesi ve uzun süre güncelleme yapılmamiş sistemlerin tespit edilmesi gerekiyor. Sistemin uzun süre güncelleme yapmamış olması kullanılan  güncelleme sisteminde bir problem olduğunu gösterir.


 </br></br>
 
 
