if(playerside in [west,independent]) exitWith {};

hint parseText format
["
<t color='#00ff00'><t size='2'>Karma:</t></t><br/>
<t color='#EC891D'><t size='1.5'>%1</t></t><br/><br/>
<t color='#00ff00'><t size='2'>Deine Skillpunkte</t></t><br/><br/>
<t color='#EC891D'><t size='1.5'>Nahrungsmittel</t></t><br/><br/>
<t color='#EC891D'><t size='1'>Apfel:</t></t> %2<br/>
<t color='#EC891D'><t size='1'>Pfirsich:</t></t> %3<br/>
<t color='#EC891D'><t size='1'>Fleisch:</t></t> %4<br/>
<t color='#EC891D'><t size='1'>Fischen:</t></t> %18<br/>
<t color='#EC891D'><t size='1'>Krabben:</t></t> %5<br/><br/>
<t color='#9bbc57'><t size='1.5'>Abbau</t></t><br/><br/>
<t color='#9bbc57'><t size='1'>Bruchstein:</t></t> %6<br/>
<t color='#9bbc57'><t size='1'>Ton:</t></t> %7<br/>
<t color='#9bbc57'><t size='1'>Kohle:</t></t> %8<br/>
<t color='#9bbc57'><t size='1'>Diamanten:</t></t> %9<br/>
<t color='#9bbc57'><t size='1'>Kupfererz:</t></t> %10<br/>
<t color='#9bbc57'><t size='1'>Eisenerz:</t></t> %11<br/>
<t color='#9bbc57'><t size='1'>Salz:</t></t> %12<br/>
<t color='#9bbc57'><t size='1'>Sand:</t></t> %13<br/>
<t color='#9bbc57'><t size='1'>Öl:</t></t> %14<br/><br/>
<t color='#ff0000'><t size='1.5'>Illegales</t></t><br/><br/>
<t color='#ff0000'><t size='1'>Marijuhana:</t></t> %15<br/>
<t color='#ff0000'><t size='1'>Kokain:</t></t> %16<br/>
<t color='#ff0000'><t size='1'>Heroin:</t></t> %17<br/>
<t color='#ff0000'><t size='1'>Meth:</t></t> %19<br/>
",
life_D41_Karma,
life_skillApple,
life_skillPeach,
life_skillRawmeat,
life_skillKrabben,
life_skillBruchstein,
life_skillTon,
life_skillcoalu,
life_skillDiamond,
life_skillCopperore,
life_skillIronore,
life_skillSalt,
life_skillSand,
life_skillOilu,
life_skillCannabis,
life_skillCocaine,
life_skillHeroinu,
life_skillFischen,
life_skillMeth
];