waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};


player createDiarySubject ["changelog","Changelogs"];
player createDiarySubject ["mainrules","Hauptregeln"];
player createDiarySubject ["illegalitems","Illegale Gegenstände"];
player createDiarySubject ["carrules","Fahrzeugregeln"];
player createDiarySubject ["spawnrules","RDM, VDM und Safezones"];
player createDiarySubject ["policerules","Polizeiregeln"];
player createDiarySubject ["Security","Security - Die Firma"];
player createDiarySubject ["gangrules","Gangregeln"];
player createDiarySubject ["bußgeld","Bußgeldkatalog"];
player createDiarySubject ["distriktinfo","Forum und Teamspeak"];
player createDiarySubject ["controls","Steuerung"];




	player createDiaryRecord["changelog",
		[
			"Changelog",
				"
					Der offizielle Changelog von Tonic kann im BIS forums gefunden werden(nach Altis Life RPG suchen).<br/>
					Für den Distrikt41 Changelog schaut bei uns im Forum vorbei: www.distrikt41.de
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Credits Distrikt41",
				"
					Danke an:
					• RobertHammer für sein M4/M16 und Pistolen Pack<br/>
					• Robalo für ASDG Joint Rails<br/>
					• toadie2k für sein HLC Waffen Pack<br/>
					• Cunico für sein Hidden Identity Pack<br/>
					• MrEwok und Aplion für das HAFM Pack<br/>
					• Alwarren für das FHQ Accessories Pack<br/>
					• Red Hammer Studios für RHS: Escalation <br/>
					• Reyhard für sein RDS A2 Civilian Pack<br/>
					• RedPhoenix für Refined Vehicles  <br/>
					• EgilSandfeld für Bornholm<br/>
					• Gnat für die Cessna 185 Skywagon<br/>
					• SpectreRSG für TFAx - International Units  <br/>
					• CUP Team für das Community Upgrade Project - Weapon Pack  <br/>
					• Leight für Leights OPFOR Pack  <br/><br/>
					Keep Rocking ;)<br/>
				"
		]
	];

	player createDiaryRecord["mainrules",
		[
			"Kick- und Bangründe",
				"
				Die folgenden Gründe werden mit einem Kick bzw. einem Ban bestraft:<br/>
				• Hacking<br/>
				• Cheating<br/>
				• Exploiting<br/>
				• Beleidigungen außerhalb des RP's<br/>
				• Random Death Matching (siehe RDM Sektion)<br/>
				• Vehicle Death Matching (siehe VDM Sektion)<br/>
				• Combat Logging (Bei Flucht / im Kampfgeschehen ausloggen)<br/>
				• Sounds und Musik in der Direct Kommunikation oder anderen Sidechannels abspielen führt nach einmaliger Verwarnung zum Ban.<br/>
				• Andere Spieler zu Regelverstößen animieren wird ebenfalls mit einem permanenten Ban bestraft<br/>
				• Scripte und Makros jeglicher Art sind Verboten.<br/>
				• Trolling.<br/><br/>
				
				Exploits/Bugs:<br/>
				1. Aus dem Gefängnis, durch exploiten/buggen zu fliehen! Außer man zahlt seine Kaution, sitzt die Strafe ab oder man wird von anderen rausgeholt. Versucht man auszubrechen wird man erneut auf die Fahndungsliste gesetzt.<br/>
				2. Sich selber umbringen oder das Spiel verlassen um einer Gefängnisstrafe oder dem Role Play zu entgehen (Kidnapping, etc.) (siehe Combatlogging)<br/>
				3. Items und/oder Geld verdoppelt durch ausnutzen der Spielmechanik oder Hacks. Ausloggen (Alt + F4 etc.) während des Respawntimers ist nicht gestattet. Wenn einem eine hohe Menge Geld überwiesen wird, muss dies sofort einem Admin gemeldet und übergeben werden. Falls dies nicht geschieht werdet IHR anstatt des Versenders gebannt.<br/>
				4. Gehackte Items benutzen, auch wenn diese nicht von euch kommen.<br/>
				5. Bugs in den Spielmechaniken zum eigenen (fiesen) Vorteil ausnutzen (jegliche Arten)<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["mainrules",
		[
			"Sonderregeln", 
				"
				Sonstiges:<br/>
				1. Selbstmord schützt vor Strafe nicht. Sich von einem Teammitglied töten zu lassen schützt ebenfalls nicht.<br/>
				2. Wenn man Respawnt ist man nicht vor Verfolgung oder strafrechtlichen Konsequenzen geschützt.<br/>
				3. Nur durch Festnahme/Tötung durch Polizei ist man wieder vollkommen Straffrei.<br/>
				4. Waffen die im Zusammenhang mit einer Straftat stehen, müssen dem Verdächtigen abgenommen und beschlagnahmt werden.<br/>
				5. Übermäßiges Trollen von Spielern und Cops. (z.B. beständiges Hupen, am Marktplatz trollen, vor Autos legen etc) Rollenspiel ist gut, stumpfes Rollenspiel nicht. <br/>
				6. Öffentliche Gebäude oder von Spielern angemietete Häuser absichtlich zu zerstören ist verboten und wird hart bestraft.<br/>
				7. Medics und ADAC sind sichere Personen. Es ist verboten diese zu töten, zu überfallen oder ähnliches.<br/>
				
				Sonderregelungen: Rebellenangriffe, Belagerungen, Aufstände und Geiselnahmen<br/>
				1. Alle Personen die sich am Ort des Geschehens aufhalten oder sich in die Handlung einmischen müssen damit rechnen getötet, oder gefangen genommen zu werden.<br/>
				2. Sind nicht mindestens 5 Polizisten online, wird jegliche Belagerungen,Rebellenangriffe, Aufstände oder Geiselnahmen als Regelwidrig angesehen. Unterscheidet bitte zwischen Polizisten und der Firma die ein [A.S.A.] im Namen hat.<br/>
				3. Vor einer Belagerung, Rebellenangriff bzw. Aufstand muss man der Polizei eine Liste mit teilnehmenden Spielern zukommen lassen.<br/>
				4. Die Bank darf von Spielergruppen max. 2 x pro Serverzeit ausgeraubt werden. Hier spielt es keine Rolle wie die Gruppe heißt, sondern jeder Spieler darf maximal 2 x teilnehmen!<br/>
				"
		]
	];
	
	player createDiaryRecord ["mainrules",
		[
			"Interaktion mit der Polizei", 
				"
				Den Anweisung der Polizei ist unbedingt Folge zu leisten. Geschieht dies nicht, wird ein Bußgeld ausgesprochen (siehe Bußgeldkatalog) oder im wiederholten Fall mit Arrest bestraft.<br/><br/>
				
				Die gesamten Polizeiareale und Firmen Grundstücke sind Sperrgebiet für Zivilisten. Das betreten ist strikt verboten und wird bestraft (siehe Bußgeldkatalog). Von der Schusswaffe wird nach Warnung gebrauch gemacht!<br/><br/>
				
				- In Städten Waffen aufnehmen und Polizisten erschießen ohne jeglichen Role Play Grund hat einen temporären Ban zur Folge. (siehe Sektion RDM)<br/>
				- Absichtliches Blocken oder sonstige Störungen von Polizisten, um sie an der Ausübung ihrer Pflicht zu hindern, wird mit Arrest bestraft.<br/>
				- Falschaussagen gegenüber der Polizei werden mit Bußgeld bestraft.<br/>
				- Nur weil ihr von der Polizei mit Blaulicht verfolgt werdet dürft ihr nicht ohne Kommunikation das Feuer eröffnen. Beachtet die Verhältnismäßigkeit.<br/>
				"
		]
	];
	
	player createDiaryRecord ["mainrules",
		[
			"Grundregeln", 
				"
				Bevor ein ziviler Spieler überfallen, beraubt, getötet oder anderes wird, ist eine Kommunikation erforderlich und zwar JEDES MAL, egal wie oft der Spieler zu der Stelle zurück kehrt. Eine allgemeine Nachricht im Chat zählt nicht als Vorwarnung. Jeder Spieler ist vor jedem Angriff auf sein Hab und Gut an zu sprechen bzw. anzuschreiben und ihm Zeit zu lassen auf die Nachricht bzw. die Ansprache zu reagieren. Denkt daran das es zu Übertragunsverzögerungen kommen kann und der Direkt nur eine begrenzte Reichweite hat.<br/><br/>

				DIESER REGELBRUCH WIRD SOFORT MIT KICK UND BAN BESTRAFT!!<br/><br/>

				Es gibt keine New-Life Regelung mehr!<br/><br/>
				Es gibt keine Warnungen, keinen Kick sondern nur einen permanenten Ban. Diese Regeln sind die einzige Warnung.<br/><br/>
				

				Wenn du glaubst, dass du zu Unrecht gebannt wurdest, komm auf unseren Teamspeak und spreche einen Admin an.<br/>
				Beachtet bitte, dass dieser Server, also unsere Map und Features, in einem Beta Stadium sind. Aus diesem Grund kann es immer wieder zu unerwarteten Spielsituationen oder auch zu Serverabstürzen kommen, welche von uns nicht beeinflusst werden können. In diesem Zusammenhang mit Bugs, Hackerangriffen etc. erstatten wir Gelder bzw. Fahrzeuge nur in Einzelfällen, die vorher von einem Admin genau geprüft wurden. Grundsätzliche Erstattungen von verlorenem Gut gibt es nicht.<br/>
				Wir dulden keine Beleidigungen, Rechtsextremismus, Linksextremismus, Verurteilung aufgrund von Religion oder sexueller Orientierung. Desweitern ist übertrieben gebrauch von Caps Lock und Shift nicht geduldet. Dies gilt auch für Spielernamen.<br/><br/>
				
				!!! UNWISSENHEIT SCHÜTZ NICHT VOR STRAFE !!!<br/><br/>
				
				Sollten wir mitbekommen wie Ihr einen Admin verarschen wollt, wird dies einen Permaban nach sich ziehen.<br/><br/>
				"
		]
	];
	
	
	player createDiaryRecord["illegalitems",
		[
			"Illegale Gegenstände",
				"
				Folgende Gegenstände und Fahrzeuge sind als illegal angesehen und der Besitz wird mit einer Geldstrafe sowie die Beschlagnahmung der Fahrzeuge/Gegenstände belangt. Sollten diese Fahrzeuge mehrfach für Straftaten jeglicher Art genutz werden, werden diese von der Polizei fachgerecht entsorgt. Das Urteil über das Fahrzeug fällt der ranghöhste Polizist und übernimmt die Verantwortung über seine Taten.<br/><br/>
				
				Illegale Fahrzeuge:<br/>
				- Alle bewaffneten Fahrzeuge<br/>
				- Alle gepanzerten Fahrzeuge (LKws wie Tempest und HEMMT zählen nicht dazu)<br/>
				- Alle Polizeifahrzeuge<br/>
				- Alle Sanitätsfahrzeuge<br/><br/>

				Illegale Waffen<br/>
				Jede Waffe und die dazugehörige Munition, die NICHT beim Waffenhändler oder Herotrader erhältlich ist wird als illegal eingestuft. Für eine genaue Auflistung schaut bei uns im Forum vorbei.<br/><br/>

				Illegale Waren und Gegenstände<br/>
				- Heroin ( auch Schlafmohn )<br/>
				- Kokain ( auch Kokablätter )<br/>
				- Marihuana ( auch Hanfblatt )<br/>
				- Alle Arten von Masken, Halstüchern, Ghillie-Suits oder sonstigen Gegenständen die die Identität verschleiern</br>
				- Polizeibekleidung, -ausrüstung und -waffen<br/><br/>
				"
		]
	];
					
	
	player createDiaryRecord ["carrules",
		[
			"Wasserfahrzeuge", 
				"
				1. Boote ohne Erlaubnis durch die Gegend zu schieben ist ein Verstoß und wird geahndet.<br/>
				2. Boote durch die Gegend schieben mit der Absicht, jemanden zu verletzen wird geahndet.<br/>
				3. Schwimmende Leute überfahren ist verboten und wird bestraft.<br/>
				4. Ein Polizei-Speedboot stehlen wird bestraft.<br/><br/>
				"
		]
	];
	
		player createDiaryRecord ["carrules",
		[
			"Luftfahrzeuge", 
				"
				1. Andere Luftfahrzeuge absichtlich rammen wird mit einem Ban bestraft.<br/>
				2. Das Fliegen von Hubschraubern ist nur mit einer Fluglizenz erlaubt. Fliegen ohne eine Fluglizenz wird mit Bußgeld geahndet.<br/>
				3. Um auf dem Landeplatz in der Hauptstadt Pyrgos zu landen, muss in jedem Fall eine Landeerlaubnis von der Polizei erfragt werden. (In Athira, Kavala und Paros kann ohne Anfrage auf den markierten Landeplätzen gelandet werden)<br/>
				4. Kein ziviles Luftfahrzeug darf innerhalb von Stadtgrenzen landen. Der Landeversuch wird genau wie eine Landung geahndet. (Ausnahmen sind die markierten, zivilen Landeplätze in den 4 Städten oder man hat eine besondere Erlaubnis eines Polizisten.)<br/>
				5. Das Schweben/ Fliegen über einer Stadt unter 150m ist verboten und wird mit einer Geldbuße bestraft. Tiefes schweben über der Stadt um einen anderen Spieler aufzunehmen zählt als Landeversuch.<br/>
				6. Alle Polizeistationen, die Staatsbank, die Areale der Firma und das Staatsgefängnis sind Flugverbotszonen.<br/>
				"
		]
	];
	
	player createDiaryRecord ["carrules",
		[
			"Bodenfahrzeuge", 
				"
				1. Personen zu überfahren ist IMMER verboten, egal in welcher Situation, und wird mit einem Bann bestraft. (siehe VDM ). Im Falle eines Unfalls wird dies von der Polizei untersucht und im Unschuldsfall wird keine Strafe verhängt.<br/>
				2. Absichtliches positionieren vor Autos um überfahren oder verletzt zu werden wird mit einem Bußgeld/Ban belegt.<br/>
				3. Fremde leere Fahrzeuge zu zerstören ist verboten und wird mit Kick bzw. Ban bestraft.<br/>
				4. Es gilt die StVO auf allen Straßen und Plätzen.Den Verkehrszeichen ist Folge zu leisten.<br/>
				5. Die Geschwindigkeiten in Spawn-Städten ist 30km/h, in anderen Städten 50km/h. Außerorts 100km/h für PKW`s und 80km/h für LKW`s.<br/>
				6. Straßen sind da um bentuzt zu werden, solltet ihr Offroad erwischt werden wird dies mit einem Bußgeld geahndet.<br/>
				7. Um Fahrzeuge im Game zu führen braucht ihr einen Führerschein. Das Fahren ohne den speziellen Führerschein wird mit Bußgeld bestraft.<br/>
				8. Hupen dienen NUR als Warnsignal (etwa bei Kurven oder dem Einfahren auf Hauptstraßen). Permanentes Hupen wird als Trollen betrachtet, verwarnt und bei nicht befolgen mit Ban bestraft.<br/><br/>
				"
		]
	];
	

	
	
	
	player createDiaryRecord ["spawnrules",
		[
			"RDM und VDM", 
				"
				Random und Vehicle Deathmatching<br/><br/>
				
				1. Spieler töten ohne jedgliches Role Play ist verboten und wird mit Ban bestraft. Es muss IMMER eine Kommunikation stattfinden. Ist dies nicht der Fall ist es RDM und führt zum Kick/Ban. (z.B. Eine klar ersichtlicher Straßenspeere gilt als Kommunikation.) Lasst den Spielern genug Zeit zum Reagieren 10-30sec.<br/>
				2. Spieler ohne Grund aus einem Hinterhalt zu erschießen führt ebenfalls zum Ban.<br/>
				3. Wenn man nicht Teil eines Konflikts ist, hat man das Gebiet zu verlassen. Solltet ihr trotz dieser Info bei einem Feuergefecht getötet werden habt ihr keinen Anspruch auf Schadensersatz. Mischt ihr euch ein und tötet jemanden zählt dies als RDM.<br/>
				4. Gangkriege müssen der Polizei mitgeteilt werden.
				5. Jemanden durch Notwehr zu töten wird nicht geahndet. Dies muss nachweisbar sein. Wenn der Angreifer polizeilich bekannt ist, oder ihr dies anschließend der Polizei mitteilt und euch stellt werdet ihr nicht bestraft.<br/><br/>
				6. Wird man in einer Role Play Aktion / Gefecht getötet, muss man 15 Minuten lang an dem Ort verweilen, an dem man gespawnt ist. Erst nach Ablauf der 15 Minuten darf man sich dem Spielgeschehen wieder nähern. Es sollte klar sein das man nicht bei seinem Todesort wieder Spawnen darf.<br/>
				7. Polizisten dürfen sich ihrem alten Einsatz bei dem Sie gestorben sind für die dauer der 15 Minuten Regel nicht anschließen. Sie dürfen aber an anderen Einsätzen agierten oder/und reguläre Streife fahren.<br/>
				8. Zivilisten/Rebellen an ihrem Spawnpunkt.<br/>
				Bei Missachtung dieser Regelung wird strikt geahnet: Verwarnung -> Kick -> Ban<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["spawnrules",
		[
			"Spawngebiete und Safezones", 
				"
				In Safezones darf nicht geschossen, wird nichts gestohlen, geraubt, gefangen genommen oder überfallen werden. Es darf nicht von einer oder in eine Safezone(Rebellenaußenposten etc.), auf Polizei oder andere Spieler, geschossen werden. Die Polizei hat sich aus Rebellenaußenposten fern zu halten, außer man ist in einer aktiven Verfolgung. Dann dürfen Polizisten den Außenposten betreten.<br/>
				1. Alle Polizeistationen und Areale der Firma sind Spawn- und Safezones<br/>
				2. Alle Außenposten und Areale der Rebellen sind Safezones<br/>
				3. Die Städte Nexoe, Svaneke, Roenne und Aakirvkeby gelten als Safe und Spawnzonen<br/>
				4. Alle Stützpunkte von festen Spielergruppen gelten als Safe und Spawnzonen (siehe Kartenmarkierungen)<br/>
				5. Safezones und Spawngebiete sind mit schwarzen oder grünen Ovalen makiert.<br/>
				6. Bei Missachtung dieser Regelung wird strikt geahnet: Verwarnung -> Kick -> Ban<br/>
				7. Die Safezoneregelung ist für Spieler, DIE in einer AKTIVEN Verfolgung/Kampf involviert sind in der Zeit aufgehoben!<br/>
				8. Safezonen können nach Absprache mit der Polizei bzw der betroffenen Gang aufgehoben werden (für Terrorwarnungen und große Gefechte z.B.). Hierzu ist mind. 15min vorher eine Ankündigung zu machen! Details dazu siehe Forum distrikt41.de <br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Verwendung von tödlichen Waffen", 
				"
				1. In Städten darf generell nur mit Tazern geschossen werden, außer das eigene Leben ist unmittelbar bedroht. In diesem Fall darf auf tödliche Waffengewalt zurückgegriffen werden.<br/>
				2. In Städten müssen tödliche Waffen geschultert getragen werden. Desweiteren dürfen Waffen nur dann im Anschlag getragen werden, wenn es die Situation erfordert. (Doppelt Strg drücken um die Waffen aus dem Anschlag runter zu nehmen.)<br/>
				3. Um einen flüchtigen zu stoppen der versucht in einem Fahrzeug oder Hubschrauber zu fliehen, darf auf das Fahrzeug bzw. den Hubschrauber geschossen werden um ihn an der Flucht zu hindern. Primärziel Reifen/Rotor.<br/>
				4. Gestohlene Polizeifahrzeuge dürfen mit allen der Polizei verfügbaren Mitteln gestoppt und/oder außer Gefecht gesetzt werden!<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Gefängnis / Strafzettel", 
				"
				1. Ein Bußgeld muss in voller Höhe bezahlt werden. Dies wird automatisch von euren Konten abgezogen.<br/>
				2. Sollte das Bußgeld nicht gezahlt werden, wird von einem Beamten eine angemessene Gefängnisstrafe erteilt.<br/>
				3. Besonders schwerwiegende Straftaten oder bei akuter Fluchtgefahr wird eine Isolatiosnhaft angeordnet.<br/>
				4. Personen müssen informiert werden, warum sie kontrolliert werden und warum sie ein Ticket ausgestellt bekommen.<br/>
				5. Wenn man auf einer Verfolgung ist und an ein Rebellencamp kommt, muss Backup angefordert werden, sofern vorhanden.<br/>
				6. Bußgelder werden nach der Fahndungsliste und dem Bußgeldkatalog berechnet (Situationsabhängig )<br/>
				7. Alle Bußgelder oder Beutegelder müssen im Team geteilt werden um Streit über Gefangennahmen zu vermeiden. Geschieht dies nicht, wird eine Verwarnung erteilt.<br/>
				8. Nach 2 Verwarnungen ist man vom Dienst suspendiert und kann erst nach einer gewissen Zeit einen Antrag auf Wiederaufnahme in die Polizei stellen.<br/>
				9. Personen, welche Polizei Equipment besitzen/führen, müssen mit verschärften Maßnahmen (z.B. sofortige Festnahme) rechnen.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Razzien (Haus / Drogengebiete)", 
				"
				1. Eine Durchsuchung mussen aus mindestens 3 Polizisten und einen hochrangigen Polizisten bestehen.<br/>
				2. Bei Durchsuchungen sind alle teilnehmenden Polizisten von der 15 Minuten Regel betroffen.
				3. Eine Durchsuchung ist nur erlaubt wenn die betroffene Person online ist.<br/>
				4. Orte für eine Durchsuchung sind Spielerhäuser und Ganggebiete.<br/>
				5. Alle Zivilisten in der Gegend müssen festgehalten und durchsucht werden.<br/>
				6. Wenn nichts Illegales gefunden wurde, müssen die festgehaltenen Personen wieder freigelassen werden.<br/>
				7. Wenn etwas Illegales gefunden wurde, müssen die Personen mit Strafen belegt oder ins Gefängnis gesteckt werden.<br/>
				8. Tödliche Waffen dürfen bei einer Bedrohung sofort eingesetzt werden.<br/>
				9. Vor Ort schwer bewaffnete Personen dürfen zur Eigensicherung unschädlich gemacht werden, wenn von diesen eine Bedrohung ausgeht, auch ohne Vorwarnung.<br/>
				10. Wenn eine Durchsuchung beendet wurde, muss die Gegend von der Polizei geräumt werden.<br/>
				11. Nach einer Durchsuchung darf derselbe Punkt für 4 Stunden nicht mehr durchsucht werden.<br/>
				12. Backup kann jederzeit angefordert werden.<br/>
				13. Für einen Raid werden mindestens 2 Polizisten benötig, von denen einer mindestens Patrol Officer ist.<br/>
				14. Raidorte die aufgesucht werden dürfen sind: Drogenfelder, Verarbeiter.<br/>
				15. Der Dealer darf jederzeit aufgesucht werden.<br/>
				16. Diese Regeln gelten nur bei direktem Kontakt mit Spieler oder bei vorrangegangener Handlungen.<br/>
				17. Wenn bei Ankunft keine Personen am Raidort anzutreffen sind, darf maximal 10 Minuten gewartet werden.<br/>
				18. Es ist zwischen einer Durchsuchung(Haus) und einem Raid zu unterscheiden.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Streifen", 
				"
				1. Streifen dürfen zu Fuß durchgeführt werden.<br/>
				2. Fahrzeugstreifen müssen mit mindestens 2 Polizisten durchgeführt werden.<br/>
				3. Die Geschwindigkeitsbegrenzung gilt auch für Polizisten auf Streifen. Außnahmen sind Alarmfahrten (Blaulicht)<br/>
				4. Streifen müssen regelmäßig einen Statusbericht durchgeben. <br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Impounding (Beschlagnahmung)", 
				"
				1. Alle Fahrzeuge dürfen grundsätzlich NICHT beschlagnahmt werden! (Auch Cop-Fahrzeuge nicht!)<br/>
				2. Ausnahmen bestehen nur wenn das Fahrzeug direkt die Durchfahrt auf einer Straße oder Einfahrt behindert oder wenn es einen Spawnpunkt blockiert (z.B. Händler u. Garagen)<br/>
				3. Bei Gefangennahmen werden Fahrzeuge nicht beschlagnahmt. Jeder Straftäter ist selbst verantwortlich für das was er verliert und riskiert.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Luft- und Bodenunterstützung", 
				"
				1. Helikopter dürfen nur nach Absprache bzw. Erlaubnis des im Dienst höchstrangigen Polizisten eingesetzt werden.<br/>
				2. Es darf maximal 1 Blackhawk aktiv sein. Dieser darf nur zur Zerstörung bewaffneter bzw gepanzerter Fahrzeuge eingesetzt werden oder um Hubschrauber und Flugzeuge zum Landen zu zwingen. Flüchtige Fahrzeuge können auch zum Stop gezwungen werden.<br/>
				3. Es darf maximal 2 Tigr/HMMWV aktiv sein. Dieser darf nur in besonderen Fällen (Geiselnahme, Banküberfall, Großrazia, Event) eingesetzt werden.<br/>
				4. Bei längerer Verfolgungsjagd (15min+) darf der Blackhawk eingesetzt werden.<br/>
				5. Cal 50 HMMWVs und Blackhawks sind nicht für die Bekämpfung von Personen gedacht. Sollten diese beschossen werden haben sie das Recht sich zu verteidigen.<br/>
				6. Sollte eine unmittelbare Bedrohung des Lebens eines Polizisten oder Zivilisten bestehen, darf der Blackhawk oder der HMMWV cal50 gegen Personen eingestzt werden. Die Entscheidung obliegt dem Dienstgradhöchsten und ältesten.<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Checkpoints", 
				"
				1. Checkpoints und Straßensperren dürfen jederzeit errichtet werden.<br/>
				2. Ein Checkpoint muss aus mindestens 2 Polizisten und 2 Fahrzeugen bestehen.<br/>
				3. Checkpoints müssen nicht auf der Karte markiert werden.<br/>
				4. Checkpoints müssen ausreichend abgesichert werden mit Blaulicht, Strahlern etc um Umfälle zu vermeiden.<br/>
				5. Es wird bei jeder durchfahrt des Checkpoints kontrolliert.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Polizeigrundregeln", 
				"
				1. Polizeiautos müssen IMMER abgeschlossen werden. Die Polizeisirene darf nur im Notfall eingeschaltet werden.<br/>
				2. Sollte es die Situation erfordern, ist ein hochrangiger Beamter autorisiert, einem Rekruten scharfe Waffen zu übergeben. (Bsp. Es gibt einen Überfall auf eine der Hauptstädte, nur ein hochrangiger Beamter ist online und sonst nur Rekruten. Dann ist es dem Beamten gestattet, für diesen Einsatz Rekruten mit besseren Waffen auszustatten.)<br/>
				Als hochrangig gelten: Alle Ränge ab M.P. Officer.<br/>
				3. Sind weniger als 6 Polizeibeamte aktiv im Dienst sind diese von der 15 Minuten Spawnregel befreit. Beachtet das die Firma nicht als Polizei angesehen wird. Sie haben IMMER ihre 15 Minuten.<br/>
				4. Der Chief bzw Chief Assistent hat das letzte Wort (Gesetzt, Richter und Henker)<br/>
				5. Befehl und Gehorsam ist zu beachten.<br/>
				6. Es müssen immer mind. 6 Polizistenslots belegt sein, bevor ein Zivilistenslot belegt wird!<br/>
				7. Nach längeren Gefechten - mit mind. 4 gefallenen Polizisten - wird offiziell eine Amoklage ausgerufen.<br/>
				7.1. Somit steht es der Polizei frei, erheblich stärker bewaffnete Verstärkung zu rufen, welche auch gepanzerte Fahrzeuge/Hubschrauber beinhaltet.<br/>
				7.2 Waffenausgabe erst ab Rang: Sergeant. Nach dem Einsatz sind ALLE WAFFEN UNVERZÜGLICH in die WaKa zu legen!<br/>
				7.3 Der Polizei steht frei, ob sie den Einsatz einer Spezialeinheit (Die Firma) genehmigen. Diese Einheit wird temporär in den offiziellen Polizeidienst gehoben und untersteht der Polizeiführung vor Ort.<br/>
				"
		]
	];
	
	player createDiaryRecord ["Security",
		[
			"Die Firma", 
				"
				
				1. Jeder beabsichtigte Regelverstoß wird mit Rauswurf aus der Firma geahndet!<br/><br/>

				2. Wir sind in erster Linie eine Sicherheitsfirma und keine Polizisten (Fahrzeug bzw. Personenkontrollen, etc.).<br/><br/>

				3. Die Unterstützung der Polizei erfolgt NUR nach Aufforderung seitens der Polizei. Andernfalls gilt das Jedermannsrecht.<br/><br/>

				4. Die MK200, sowie die MXM werden/wird nur dann aus dem Arsenal genommen, wenn ein Ranghoher Offizier der Firma es gestattet und die Situation es erfordert
				(Oberst, Major). Sollte niemand anwesend sein, dann Rangsystem abwärts. Die Verantwortung mit dem sachgemäßen Umgang liegt stets beim Ranghöchsten. Standard ist die MP5!<br/><br/>

				5. Das tragen der Polizeiuniform, das benutzen des Polizei Fuhrpark und der Polizeiwaffen ist strengstens untersagt. (siehe Punkt 1)<br/><br/>

				5.1 Ausnahmeregel (Punkt5). Um flüchtige Personen zu stellen und/oder zu verfolgen tritt Regel 5 (ausgenommen Polizeiuniform) ausser Kraft (Nutzung des Fuhrparks der Polizei).
				Jedoch nur nach Absprache mit der Polizei.<br/><br/>

				6. Der Polizeifunkkanal wird nur in Ausnahmefällen und/oder Gefahrensituationen benutzt. Wenn die Situation es zulässt nur nach Absprache mit dem ranghöchsten Polizisten.<br/><br/>

				7. Die einzelnen Polizeichannels bitte nicht willkürlich betreten! Immer erst den ranghöchsten Polizisten informieren, bzw. kurz anfragen ob es in Ordnung ist.<br/><br/>
				
				8. Die Firma darf sich unter keinen Umständen selbst in den Polizeidienst versetzen (und somit Sonderrechte erhalten).
				"
		]
	];
	
	player createDiaryRecord ["gangrules",
		[
			"Gruppenregeln", 
				"
				1. Feste Gruppen sind als diese offiziell anerkannt, wenn diese beim Serverteam einen Teamspeak-Channel beantragt haben und aus mindesten 4 Personen bestehen.<br/>
				2. Feste Gruppen müssen sich strikt an die Serverregeln halten, da sie immer mit mehreren Spielern unterwegs sind.<br/>
				3. Alle Gruppenbasen sind Spawn und Safezones!<br/>
				4. Alle Gruppenmitglieder müssen klar ersichtliche und einheitliche Tag's nutzen.<br/>
				5. Es ist VERBOTEN das sich Gangs über einen längeren Zeitraum und Allgemein verbünden. Gangs dürfen sich für einmalige Aktionen verbünden Bank, Geiselnahme, Terrorakt etc.<br/>
				"
		]
	];
	
	player createDiaryRecord ["gangrules",
		[
			"Gebietsübernahme", 
				"
				1. Alle einnehmbaren Ganggebiete sind jederzeit von allen Gruppen einnehmbar.<br/>
				"
		]
	];
	
	player createDiaryRecord ["bußgeld",
		[
			"Schifffahrt", 
				"
				1. Boote grundlos schieben: 1000€<br/>
				2. Schwimmende Leute behindern: 1250€<br/>
				3. Personen mit einem Boot 'überfahren' -> VDM<br/>
				4. Illegale Gewässer befahren (Schwarzmarkt): 2500e<br/>
				5. Kein Bootsführerschein: 5000€<br/>
				6. Fahren unter Alkohol oder Drogeneinfluss: 5000€<br/>
				
				"
		]
	];
	
	player createDiaryRecord ["bußgeld",
		[
			"LuftVO", 
				"
				1. Versuchte Landung ohne Landeerlaubnis: 5000€<br/>
				2. Landung ohne Landeerlaubnis: 10000€<br/>
				3. Landen auf nicht gekennzeichneten Flächen: 8500€<br/>
				4. Fliegen ohne Kollisionslichter: 3000€<br/>
				5. Absichtliche Kollision -> VDM<br/>
				6. Zu niedriges Fliegen: 8000€<br/>
				7. Fliegen ohne Pilotenschein: 30000€ <br/>
				8. Fliegen unter Alkohol oder Drogeneinfluss: 10000€<br/>
				"
		]
	];
	
	player createDiaryRecord ["bußgeld",
		[
			"StVO", 
				"
				1. Zu schnelles fahren: 3000€<br/>
				2. Fahren ohne Licht: 1000€<br/>
				3. Falsch geparkt: 500€<br/>
				4. Verkehrsbehinderung: 1000€<br/>
				5. Fahrlässiges Fahren: 5000€<br/>
				6. Verursachen eines Unfalls: 7500€<br/>
				7. Fahrerflucht: 7500€<br/>
				8. Fahrzeugtötung -> VDM<br/>
				9. Offroad: 2500€<br/>
				10. Kein Verbands- oder Werkzeugkasten: 300€<br/>
				11. Hupen ohne triftigen Grund: 500€ pro Hupen<br/>
				12. Missachtung der Anschnallpflicht: 1000€<br/>
				13. Fahren ohne PKW-Führerschein: 1500€<br/>
				14. Fahren ohne LKW-Führerschein: 15000€<br/>
				15. Fahren unter Alkohol oder Drogeneinfluss: 5000€<br/>
				
				"
		]
	];
	
	player createDiaryRecord ["bußgeld",
		[
			"Zivilrecht II", 
				"
				1. Besitz von Waffen ohne Lizenz: 20000€ + Beschlagnahmung<br/>
				2. Besitz von Illegalen Waffen: 50000€ + Beschlagnahmung<br/>
				3. Benutzen von illegalen Fahrzeugen: 50000€ + Beschlagnahmung oder fachgerechte Entsorgung<br/>
				4. Mit gezogener Waffe in der Stadt: 5000€<br/>
				5. Illegaler Schusswaffen gebrauch: 25000€<br/>
				6. Mord: 20min Gefängnis<br/>
				7. Beschuss auf einen Polizeibeamten: 5min Gefängnis<br/>
				8. Widerstand gegen die Staatsgewalt: 10000€ + 5min Gefängnis<br/>
				9. Überfall: 10000€ + 5min Gefängnis <br/>
				10. Bankraub: 30min Gefängnis<br/>
				11. Geiselnahme: 15min Gefängnis<br/>
				12. Drogenbesitz/Handel: 15000$ + Wert der Sichergestellten Drogen -> Max. 100k sonst Gefängnis<br/>
				13. Gefängnisausbruch: 15min Isolationshaft<br/>
				14. Beteiligung an einer illegalen Straßensperre: 8000€<br/>
				15. Falschaussage: 10000€<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["bußgeld",
		[
			"Zivilrecht I", 
				"
				1. Diebstahl: 5000€<br/>
				2. Sachbeschädigung: 3000€.<br/>
				3. Sich als Polizist ausgeben: 10000€<br/>
				4. Missachtung polizeilicher Anordnungen: Gefängnisstrafe<br/>
				5. Behinderung der Staatsgewalt: 2500€<br/>
				6. Betreten von abgesperrten Bereichen: 5000€ + Platzverweis<br/>
				7. Belästigung und/oder Beamtenbeleidigung: 1000€<br/>
				8. Illegales Straßenrennen: 3000€<br/>
				9. Vermummungsverbot: 500€<br/>
				10. Einnahme von bewusstseinserweiternden Substanzen: 2500€
				"
		]
	];
	
	player createDiaryRecord ["distriktinfo",
		[
			"Forenadresse und TS-IP", 
				"
				Unser Forum findet Ihr unter: www.distrikt41.de<br/>
				Feedback und Verbesserungsvorschläge sind gerne erwünscht. Bugmeldungen ebenso.<br/><br/>
				
				Unser Teamspeak erreicht ihr über: 85.10.207.69<br/><br/>
				"
		]
	];
	
// Controls Section

	player createDiaryRecord ["controls",
		[
			"Steuerung und Sondertasten",
				"
				Z oder ^: Spielermenu öffnen<br/>
				U: Auf-/Abschließen von Autos und Haustüren<br/>
				Left Shift + G: Niederschlagen (Nur Zivis)<br/>
				Left Shift + O: Fesseln mit Kabelbindern/Handschellen (nach Niederschlagen möglich)<br/>
				Left Windows: Interaktionstaste (Hausmenü)<br/>
				Left Windows + T: Geld aufheben<br/>
				Left Shift + Num_0: Ergeben<br/><br/>
				
				Für Cops:<br/>
				1: Blaulicht<br/>
				2: Sirene<br/>
				F: Hupgeräusch wechseln<br/>
				Left Shift + R: Festnehmen<br/><br/>
				"
		]
	];