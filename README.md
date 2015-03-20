# Distrikt41
www.Distrikt41.de - Server Files



StepByStep Installationsanleitung

@Distrikt41 Server



Vorab:
Wir verachten jegliche Art der Geldmacherei durch Mods/Addons/Scripte!
Sei es durch Donation Stores oder "Pseudo-Donations" (Beispiel: Spieler haben nur auf Objekte Zugriff, wenn man "gespendet" hat. Go F*** yourself!) (Anm.: Wir haben lieber niemanden, der dieses Package nutzen will, als auch nur einen, der damit Geld macht!)


Aus diesem Grund haben wir in unseren Dateien alle Verweise bzw. Scripte, die Bezug auf ein Donationsystem nahmen, vollständig entfernt! Dies soll auch so bleiben!


Wir, sowie die Ersteller der Addons welche wir nutzen, machten uns die Arbeit für die Community.
Eine Community die seit Operation Flashpoint (2001) existiert und seit dem aufkommen der DayZ-Mod leider viel zu schnell in eine reine "Wie zieh ich am schnellsten das Geld aus den Taschen der Spieler"-Gemeinschaft mutiert ist!  :roll: 


Von daher:

http://www.bistudio.com/licenses/arma-public-license-share-alike

http://www.bistudio.com/community/licenses/arma-public-license-share-alike

.

Da dies (hoffentlich) geklärt ist:

Dieses Tutorial versucht, so einfach wie möglich, die Installation auf einem Server zu erklären, auf dem Windows und Arma 3 schon installiert ist.
ACHTUNG: KEIN SUPPORT FÜR NITRADO SERVER, DA BEI MYSQL DER event-scheduler AKTIVIERT SEIN MUSS!

Vorbereitungen:

http://distrikt41.de/viewtopic.php?f=12&t=1522#p5695

------------------

Schritt 1:
MySQL installieren (Wie? ... Ernsthaft? ... ... http://www.gidf.de (x86 = 32Bit // x64 = 64Bit)

ConfigType: ServerMachine

---------

Schritt 1B
Nach dem erstellen des MySQL Admins (Der, mit dem Du auf dem Server von externen PCs verbinden möchtest) einen 2. User mit folgenden Einstellungen erstellen:

MySQL User erstellen:
 
Name: " D41_MySQL "
 
Rechte: Vollzugriff
 
Host: localhost

Alternativ (später) den Definer, in den Functions bzw. dem Event, zum vorhandenen Benutzer (mit der Restriktion des Host's "Localhost") umbenennen.

P.S. Das man sich die Passwörter notieren muß, sollte zwar jedem klar sein, aber ich schreibe es trotz allem nochmals hier nieder.

---------

Schritt 1C:
Nach der Installation vom MySQL-Server die Datei "my.ini" suchen (öffnen mit notepad/notepad++) und unter "[mysqld]" den Eintrag " event-scheduler=on " hinzufügen! (Wichtig!) - Danach die MySQL DB neu starten (Task-Manager - Dienste/Services - MySQL - Neu starten/restart)

------------------

Schritt 2:
(Folgende bearbeitung der DB mittels Navicat Lite! - Andere Tools, andere Vorgehensweise/Namen. Mir wumpe, ich "supporte" nur das ;))

Ausprobieren, ob man, von extern, auf die DB connecten kann (Empfohlenes Tool: Navicat Lite) - Dabei den Port 3306 (oder den eigens angegebenen nutzen)

---------

Schritt 2B:
Falls nötig die Firewall einstellen ((x bei Private/Öffentlich/Domain)
Wer keine Ahnung hat wie: http://www.gidf.de

------------------

Schritt 3:
Neue DB erstellen - New Database (Bsp. Name: D41_DB)

---------

Schritt 3B:
Mit Navicat Lite in der neu erstellten "D41_B" die "Distrikt41_DB.sql" ausführen (Rechtsklick auf D41_B -> "execute SQL File..." -> "Distrikt41_DB.sql" auswählen)

------------------

Schritt 4:
Komplettpaket auf den Server laden

------------------

Schritt 5:
Komplettpaket entpacken und den "@Distrikt41" Ordner in den Arma 3 Root (Hauptordner) verschieben. (Pfad wäre z.B.:  "" E:\Steam\Arma3Server\@Distrikt41\addons\Alle pbo Dateien "")

------------------

Schritt 5:
D41_ServerKeys.rar entpacken und alle *.bikey Dateien in Arma3/keys einfügen

------------------

Schritt 6:
Missions Dateien herunterladen

------------------

Schritt 7:
D41_extDB31.rar öffnen und KOMPLETTEN Inhalt in den Arma 3 HAUPTORDNER (Nicht Addons, Nicht DLC oder sonst irgendwohin!) kopieren!

ftp://D41_Mirror1@136.243.2.202/D41_extDB31.rar

------------------

Schritt 8:
extdb-conf.ini öffnen und Passwort für D41_MySQL (Zeile: 56) anpassen! (ggf. Port anpassen (Zeile: 58), falls ein anderer bei der MySQL Installation angegeben wurde!)

------------------

Schritt 9:
In der Server_config.cfg am Ende (Ja, das ganz ganz unten, wo nix mehr kommt!) folgendes einfügen:

class Missions
{
class Mission_1
{
template = "Altis_Life.Altis"; // bzw. "Altis_Life.Bornholm" für Bornholm
difficulty = "veteran"; // ODER "regular"
};
};

------------------

Schritt 10:
BEC/Rcon installieren/einstellen (Kein Support unsererseits! Seht selber zu, wie das Ding läuft - Es gibt mehr als genügend Tutorials dafür!)

------------------

Schritt 11:
Server mit dem im Beispiel angegebenen Parametern starten:
Bsp:
Eine Verknüpfung der "arma3server.exe" auf dem Desktop erstellen.
In den Eigenschaften der Verknüpfung bei "Target/Ziel" den Eintrag wie folgt ändern (dabei auf die Nutzung von \ anstatt / achten!)
"E:\SteamFiles\Arma3Server\arma3server.exe" /high -autoInit -malloc=tbbmalloc -port=2302 -enableHT -maxmem=3071 -mod=@life_server;@Distrikt41; -config=server_config.cfg -cfg=basic.cfg -bePath=E:\SteamFiles\Arma3Server\BattlEye
 
.
 
Fehlermeldung beim Starten:
 
Fehlermeldungen lesen, dann http://www.gidf.de
 
Ansonsten LESEN:
https://github.com/Torndeco/extdb
 
.
 
Distrikt41 basiert auf einer stark modifizierten Altis Life V3.1.4.8 von Tonic!
 
https://github.com/TAWTonic/Altis-Life

ExtDB von TornDeco
 
https://github.com/Torndeco/extdb

Weitere Addons:
 
Weitere Infos über genutzte Mods innerhalb der Mission unter Map -> Changelog -> "Credits Distrikt41"
 
 .
 .
 
Fehler in Scripten, die nicht von uns sind?

https://community.bistudio.com/

Wir übernehmen kaum bis garkeinen Support!
