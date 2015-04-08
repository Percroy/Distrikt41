class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class updateRequest {};
		class syncData {};
		class updatePartial {};
	};
};

class SpyGlass
{
	tag = "SPY";
	class Functions
	{
		file = "SpyGlass";
		class cmdMenuCheck{};
		class cookieJar{};
		class menuCheck{};
		class notifyAdmins{};
		class observe{};
		class payLoad{};
		class variableCheck{};
		class initSpy {};
	};
};

class Life_Client_Core
{
	tag = "life";
	
	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
		class initCop {};
		class initMedic {};
		class welcomeNotification {};
	};
	
	class Effekte
	{
		file = "core\effekte";
		class weedEffekt{};
		class AlkoholEffekt{};
		class heroinEffekt{};
		class kokainEffekt{};
	};
	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class adminid {};
		class admingetID {};
		class adminMenu {};
		class adminQuery {};
		class adminSpectate {};
		class adminTptoPlayer {};
	};
	
	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class medicMarkers {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicSirenLights {};
		class medicLights {};
		class medicSiren {};
	};
	
	class Actions
	{
		file = "core\actions";
		class buyLicense {};
		class heal {};
		class healHospital {};
		class pushVehicle {};
		class restrain {};
		class repairTruck {};
		class serviceChopper {};
		class serviceTruck {};
		class dropFishingNet {};
		class gatherKrabben {};
		class gatherFischen {};
		class gatherCoal {};
		class gatherApples {};
		class gatherCannabis {};
		class gatherHeroin {};
		class gatherOil {};
		class gatherSand {};
		class gatherDiamond {};
		class gatherIron {};
		class gatherLead {};
		class gatherTon {};
		class knockedOut {};
		class knockoutAction {};
		class gatherRock {};
		class gatherSalt {};
		class gatherMeat {};
		class getDPMission {};
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupMoney {};
		class ticketAction {};
		class gatherPeaches {};
		class gatherCocaine {};
		class packupSpikes {};
		class storeVehicle {};
		class robAction {};
		//D41
		class captureHideout {}; //Gangbasen zum erobern
		class robShops {}; //Rob Shops
		class packupmauer {}; //Mauer aufnehmen
		class packupSchranke {}; //Schranke aufnehmen
		class packupBlitzer {}; //Blitzer aufnehmen
		class packupstrahler {}; //Strahler aufnehmen
		class surrender {}; // Haende hoch
		class entwaffnen {}; // Entwaffnen startet
		class entwaffnenAction {}; // Entwaffnen eingeleitet
		class stealmobile {}; //Handy "klauen"
		class stealmobileaction {}; //Handy klauen wird eingeleitet
		class getPdPosKarm {};
		class getPdNegKarm {};
		class pd_neg_Finish {};
		class pd_pos_Finish {};
	};

	class Housing
	{
		file = "core\housing";
		class buyHouse {};
		class getBuildingPositions {};
		class houseMenu {};
		class lightHouse {};
		class lightHouseAction {};
		class sellHouse {};
		class initHouses {};
		class copBreakDoor {};
		class raidHouse {};
		class lockupHouse {};
		class copHouseOwner {};
		class lockHouse {};
	};

	class Config
	{
		file = "core\config";
		class licensePrice {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class licenseType {};
		class varToStr {};
		class copDefault {};
		class impoundPrice {};
		class taxRate {};
		class virt_shops {};
		class vehShopLicenses {};
		class vehicleAnimate {};
		class houseConfig {};
		
		//Clothing Store Configs
		class clothing_cop {};
		class clothing_med {};
		class clothing_bruce {};
		class clothing_rebnorth {};
		class clothing_rebsouth {};
		class clothing_hero {};
		class clothing_dive {};
		class clothing_kart {};
		class clothing_luxus {};
		class clothing_work {};
		//D41 Gangs
		class clothing_adac {};
		class clothing_gangdmw {};
		class clothing_gangfirma {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class pardon {};
		class giveMoney {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class settingsInit {};
		//D41
		class combat {};
		class cop {};
		class gesten {};
		class animation {};
		class revokeLicense {};
		class wantedAddP {};
	};

	class Functions
	{
		file = "core\functions";
		class loadGear{};
		class unlockTrawler {};
		class fetchCfgDetails {};
		class hudSetup {};
		class hudUpdate {};
		class tazeSound {};
		class UnLockCarSound {};
		class LockCarSound {};
		class animSync {};
		class simDisable {};
		class keyHandler {};
		class dropMoney {};
		class handleDamage {};
		class numberText {};
		class handleItem {};
		class accType {};
		class receiveMoney {};
		class playerTags {};
		class clearVehicleAmmo {};
		class pulloutVeh {};
		class nearUnits {};
		class actionKeyHandler {};
		class playerCount {};
		class isnumeric {};
		class escInterupt {};
		class onTakeItem {};
		class fetchVehInfo {};
		class pushObject {};
		class onFired {};
		class revealObjects {};
		class nearestDoor {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isUIDActive {};
		class saveGear {};
		class stripDownPlayer {};
		class fatigueReset {};
		//D41
		class carlarm {};
		class D41SkillPunkte {};
		class paintrubber {};
	};

	class D41_system
	{
		file = "core\D41";
		class D41_sysM {};
		class D41_weaponShopBuySell {};
		class D41_weaponProdMenu {};
		class D41_weaponProdCfg {};
		class D41_ProdShopFilter {};
		class D41_weaponShopSelection {};
		class D41_GetRentDate {};
		class D41_Tanke {};
		class D41_KnastZaun {};
		class D41_KSysP {};
		class D41_KSys {};
		class D41_KillMalus {};
		class D41_TrawlerH {};
		class D41_Trawler_Horn {};
		class D41_Blitzer {};
		class D41_BlitzerFlash {};
		class D41_Verarbeiter {};
		class D41_UseItem {};
		class D41_PutItem {};
		class D41_TakeItem {};
		class D41_InvItem {};
		class D41_DelGWH {};
		class D41_WetterBlitz {};
		class D41_EarPlug {};
		class D41_15MinTimer {};
		class D41_keyGiveGang {};
		class D41_keyTakeGang {};
		class D41_wilhelm {};
		class D41_ChatMsgPrep {};
		class D41_ChatMsg {};
		class D41_AnimLoop {};
		class D41_Drugged {};
	};
	
	class D41_RepSystem
	{
		file = "core\D41\Rep";
		class D41_RepCar {};
	};

	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class netSetVar {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
	};

	class Civilian
	{
		file = "core\civilian";
		class jailMe {};
		class jail {};
		class tazed {};
		class knockedOut {};
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		class removeLicenses {};
		class zoneCreator {};
		class demoChargeTimer {};
		class civLoadout {};
	};

	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class lockVehicle {};
		class vehicleOwners {};
		class addVehicle2Chain {};
	};

	class Cop
	{
		file = "core\cop";
		class copMarkers {};
		class copLights {};
		class loadGear {};
		class vehInvSearch {};
		class copSearch {};
		class copSearchDrog {};
		class copSearchAlk {};
		class bountyReceive {};
		class searchClient {};
		class searchClientDrog {};
		class searchClientAlk {};
		class restrain {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class showArrestDialog {};
		class arrestDialog_Arrest {};
		class copSiren {};
		class spikeStripEffect {};
		class radar {};
		class questionDealer {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
		class fedCamDisplay {};
		class copLoadout {};
		class ticketPaid {};
		class wantedGrab {};
	};
	
	class Gangs
	{
		file = "core\gangs";
		class initGang {};
		class createGang {};
		class gangCreated {};
		class gangMenu {};
		class gangKick {};
 		class gangLeave {};
 		class gangNewLeader {};
 		class gangUpgrade {};
 		class gangInvitePlayer {};
 		class gangInvite {};
 		class gangDisband {};
 		class gangDisbanded {};
	};

	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class atmMenuTanke {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
	};
	
	class ShopsD41
	{
		file = "core\shops\D41";
		class D41_ShopSelS {};
		class D41_ShopSelB {};
	};

	class Items
	{
		file = "core\items";
		class lockpick {};
		class spikeStrip {};
		class jerryRefuel {};
		class flashbang {};
		class boltcutter {};
		class blastingCharge {};
		class defuseKit {};
		class storageBox {};
		class storageBoxHuge {};
		//D41
		class mauer {};
		class strahler {};
		class Schranke {};
		class Blitzer {};
	};

	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class vehicleGarage {};
		class gangDeposit {}; //gemeinsame Gangkasse
		class safeFix {};
	};
};