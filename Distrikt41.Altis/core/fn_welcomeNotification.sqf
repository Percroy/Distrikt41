/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/

format ["Hallo %1!", profileName] hintC [
    parseText "<t align='left'>Willkommen im Distrikt 41!</t>",
    "",
    parseText "<t align='left'>Wenn das Dein erster Besuch auf unserem Server ist, bitten wir Dich, die Regeln genauestens durchzulesen. Gehe dazu entweder auf http://www.net4players.eu oder auf die Karte, indem du <t color='#FF8000'>M</t> drückst.</t>",
    parseText "<t align='left'>TS3-IP: ts3.net4players.eu</t>",
    "",
    parseText "<t align='left'><t color='#ff1111'>Der Server befindet sich derzeit noch in der Testphase!</t>",
    parseText "<t align='left'>Bitte melde alle Fehler und Bugs im Forum unter http://www.net4players.eu</t>",
    "",
    parseText "<t align='left'>Wir wünschen Dir viel Spaß auf unserem Server!</t>"
];    