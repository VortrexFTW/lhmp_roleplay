// ================================================
// == Life in Lost Heaven
// == Created By: VortrexFTW
// == Started On: December 31st 2015
// ================================================

function onServerInit() {
	iServerTicks <- 0;
	iServerSecondTicks <- 0;
	
	iLastServerSaveTick <- 0;
	GlobalConfig <- { };
	GlobalConfig.VehicleSpawn <- { };
	GlobalConfig.NewCharacter <- { };
	GlobalConfig.iMaxVehicles <- 250;
	PedSkins <- { };
	PedSkins.Detectives <-[52, 53, 54];
	PedSkins.Police <-[34, 35, 36, 127, 128, 240, 241, 242, 243, 244, 245, 246];
	PedSkins.Normal <-[3, 4, 8, 14, 16, 20, 21, 23, 24, 25, 26, 27, 29, 30, 32, 33, 37, 38, 39, 40, 41, 44, 46, 47, 48, 49, 50, 51, 55, 56, 57, 58, 59, 60, 61, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 75, 76, 79, 81, 88, 90, 91, 92, 93, 94, 95, 96, 97, 99, 101, 102, 103, 104, 105, 106, 107, 108, 110, 111, 113, 114, 115, 116, 118, 119, 120, 121, 122, 126, 129, 130, 131, 133, 134, 135, 136, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 151, 152, 153, 160, 162, 165, 167, 168, 169, 171, 172, 173, 174, 175, 181, 182, 183, 184, 185, 186, 188, 189, 190, 191, 192, 194, 195, 196, 198, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 215, 216, 217, 219, 220, 221, 223, 225, 227, 229, 230, 231, 232, 233, 235, 236, 237, 239, 247, 248, 249, 251, 253, 254, 256, 258, 260, 261, 262, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 277, 279, 281, 282, 283, 284, 285, 287, 288, 290, 291, 292, 294, 295, 296];
	PedSkins.Blocked <-[1, 2, 5, 6, 7, 9, 10, 11, 12, 13, 15, 17, 18, 19, 22, 28, 31, 42, 43, 45, 62, 63, 74, 77, 78, 80, 82, 83, 84, 85, 86, 87, 89, 98, 100, 109, 112, 117, 123, 124, 125, 132, 137, 149, 150, 154, 155, 156, 157, 158, 159, 161, 163, 164, 166, 170, 176, 177, 178, 179, 170, 187, 193, 197, 199, 214, 218, 222, 224, 226, 228, 234, 238, 250, 252, 255, 257, 259, 263, 279, 278, 280, 286, 289, 293, 297, 298, 299, 300, 301, 302, 303];
	PedSkins.Gangsters <-[];
	
	GlobalConfig.fVehicleSpawnDistance <- 10.0;
	GlobalConfig.fVehicleTrunkDistance <- 3.0;
	GlobalConfig.fShoutDistance <- 25.0;
	GlobalConfig.fTalkDistance <- 10.0;
	GlobalConfig.fActionDistance <- 15.0;
	GlobalConfig.iRaining <- false;
	GlobalConfig.bNight	<- false;
	
	StaffFlags <- createBitwiseTable(["None", "BasicModeration", "ManageBans", "ManageVehicles", "Scripter", "Owner"]);
	AccountSettings <- createBitwiseTable(["None", "Force2StepAuth", "LoginByLastIP", "UseWhitelist", "UseBlacklist"]);
	GameSettings <- createBitwiseTable(["None", "AutoSirenOff"]);
	
	GlobalConfig.NewCharacter.iSkin <- 3;
	GlobalConfig.NewCharacter.fSpawnX <- -1988.3;
	GlobalConfig.NewCharacter.fSpawnY <- -5.0;
	GlobalConfig.NewCharacter.fSpawnZ <- 23.0;
	GlobalConfig.NewCharacter.iMoney <- 100;
	GlobalConfig.NewCharacter.iAccountSettings <- AccountSettings.None;
	GlobalConfig.NewCharacter.iStaffFlags <- StaffFlags.None;
	GlobalConfig.NewCharacter.iGameSettings <- GameSettings.None;
	
	GlobalConfig.iVehRentStartWait <- 5;
	GlobalConfig.iServerSaveInterval <- 300;
	GlobalConfig.iSpawnTickWait <- 5;
	CardinalDirections <-["North", "Northeast", "East", "Southeast", "South", "Southwest", "West", "Northwest", "Unknown"];
	Colours <- { };
	Colours.Red <- "#FF0000";
	Colours.Maroon <- "#660000";
	Colours.Lime <- "#00FF00";
	Colours.Green <- "#006600";
	Colours.RoyalBlue <- "#0000FF";
	Colours.Yellow <- "#FFFF00";
	Colours.Orange <- "#FF7700";
	Colours.White <- "#FFFFFF";
	Colours.Gray25 <- "#BFBFBF";
	Colours.Gray50 <- "#808080";
	Colours.Gray75 <- "#404040";
	Colours.Black <- "#000000";
	Colours.Cyan <- "#00FFFF";
	Colours.Purple <- "#990099";
	Colours.Pink <- "#FF00FF";
	
	VehicleOwnerType <- {};
	VehicleOwnerType.None <- 0;
	VehicleOwnerType.Player <- 1;
	VehicleOwnerType.Faction <- 2;
	VehicleOwnerType.PublicJob <- 3;
	VehicleOwnerType.Temp <- 4;
	
	PayPhoneState <- {};
	PayPhoneState.None <- 0;
	PayPhoneState.Idle <- 1;
	PayPhoneState.RingingOut <- 2;
	PayPhoneState.RingingIn <- 3;
	PayPhoneState.ActiveCall <- 4
	
	VehicleSeatNames <-["Driver", "Front Passenger", "Rear Left Passenger", "Rear Right Passenger"];
	VehicleTireNames <-["Front Left", "Front Right", "Rear Left", "Rear Right"];
	
	BlankVehicleData <- { };
	BlankVehicleData.iOwnerType <- VehicleOwnerType.None;
	BlankVehicleData.iOwnerID <- -1;
	BlankVehicleData.iModelID <- -1;
	BlankVehicleData.iBuyPrice <- 0;
	BlankVehicleData.iRentPrice <- 0;
	
	PublicJobs <-[
		{ szName = "Postal Worker", szGetJobLocationDesc = "Municipal Building in Central Island", fGetJobX = 0.0, fGetJobY = 0.0, fGetJobZ = 0.0 }, 
		{ szName = "Police Officer", szGetJobLocationDesc = "Police Station in Central Island", fGetJobX = 0.0, fGetJobY = 0.0, fGetJobZ = 0.0 }, 
		{ szName = "Fire Fighter", szGetJobLocationDesc = "Fire Station in Works Quarter", fGetJobX = -1883.96, fGetJobY = -4.8966, fGetJobZ = -348.495 }, 
	];
	
	PlayerData <- { };
	VehicleData <- { };
	VehicleDataID <- { };
	VehicleModel <- { };
	
	PayPhones <-[];
	RingingPayPhones <- [];
	iLastPayPhoneRing <- 0;
	
	BodyParts <-["None", "Right Arm", "Left Arm", "Right Leg", "Left Leg", "Torso", "Head"];
	/*
	BodyParts[1]<- "Right Arm";
	BodyParts[2]<- "Left Arm";
	BodyParts[3]<- "Right Leg";
	BodyParts[4]<- "Left Leg";
	BodyParts[5]<- "Torso"
	BodyParts[6]<- "Head";
	*/
	Sounds <- { };
	Sounds.KillShout <-["00940001", "01010080", "01940012", "01940017", "01940069", "01940074", "01990141", "01990361", "01990421", "01990831", "01990861", "02010040", "02010110", "02940010", "02940014", "0294022", "02940028", "00940105", "00940092", "00940080", "00940077", "00940069", "00940129", "00940133", "00940134", "00950001", "00950004", "00950008", "00950011", "00950013", "00950014", "00950020", "00950026", "00950027", "00950031", "00950032", "00950034", "00950035", "00950039", "00950049", "00950051", "00950056", "00950059", "00950071", "00950072", "00950089", "00950095", "00950096", "00950110", "00950151", "00950154", "00950188", "00950189", "00950200", "00950204", "00950218", "00950249", "01010140", "01940007", "01940012", "01940016", "01940011", "01940019", "01940027", "01940069", "01940070", "01940071", "01940072", "01940075", "01940077", "01940079", "01940081", "01940082", "01940083", "01940089", "01940090", "01940091", "01990071", "01990081", "01990111", "01990131", "01990151", "01990171", "01990181", "01990231", "01990511", "01990521", "01990641", "01990841", "01990861", "01990871", "02010050", "02940019", "02940022", "02940027", "02940030", "02940040", "02940082", "02940096", "02950004", "02950005", "02950010", "02950011", "02950012", "02950024", "02950064", "02950115", "03030010", "03030030", "03030050", "03940010", "03940041", "03940060", "03940065", "04040025", "04040030", "04040050", "04940010", "04940018", "04940025", "04940027", "05010190", "05010350", "05030080", "05940002", "05940015", "05940033", "05940095", "05990051", "19990502", "19990632", "20010140", "21940004", "21940003", "21940005", "21940006", "21940007", "21940008", "21940009", "21940012", "21940021", "21940055", "21940079", "21940022", "23940023", "23940022", "23940021", "23940020", "23940004", "23940001", "23940026", "23940027", "23940036", "23940044", "23940046", "23940048", "23940050", "23940051", "23940069", "23940072", "23940078", "23940091", "24940026", "2590023 ", "25940045", "28940059", "30940048", "30940048", "28940004", "27940024", "27940011", "25940038", "25940026", "25940024", "25940023", "25940021", "25940002", "24940063", "21940081", "20020450", "20020160", "19992011", "19991512", "19991255", "19990351", "19950110", "19950060", "19950040", "18020420", "18020360", "17990421", "17040550", "15990212", "15990084", "15100010", "15090070", "15070080", "15050021", "14990251", "14010460", "14000220", "14000120", "13990071", "12940059", "12940039", "11990763", "11940083", "11940040", "08990041", "08060130", "07990231", "07990161", "07010240", "15990801", "15990881", "16010040", "16010090", "16010100", "17040020", "17040461", "17940058", "17990051", "18940059", "18940052", "18020301", "16030060", "15991621", "15990211", "15060030", "15050004", "15030130", "14040050", "14010560", "14000250", "14000230", "12940086", "12940039", "12940006", "12010140", "10990672", "09050210", "09050190", "08990151", "08950015", "08950017", "08950013", "09840008", "08020010", "07990415", "07990371", "07990224", "07940029", "07020190", "05940026", "04940058", "04940039", "04060050", "03940079", "28940001", "28940002", "28940003", "28940004", "28940005", "28940006", "28940007", "28940008", "28940009", "28940010", "28940011", "28940012", "28940013", "28940014", "28940015", "28940016", "28940017", "28940018", "28940019", "28940020", "28940021", "28940022", "28940023", "28940025", "28940026", "28940027", "28940028", "28940029", "28940030", "28940031", "28940032", "28940033", "28940034", "28940035", "28940036", "28940037", "28940038", "28940039", "28940040", "28940041", "28940042", "28940043", "28940044", "28940045", "28940046", "28940047", "28940048", "28940049", "28940042", "28940043", "28940044", "28940045", "28940046", "28940047", "28940048", "28940049"];
	onlinePlayers <- {};
	
	serverSetGamemodeName("Roleplay");
	
	loadGlobalConfig();
	
	loadVehiclesFromDatabase();
	loadPayPhonesFromDatabase();
	
	resyncIndexIniFile();
	
	if(GlobalConfig.bNight) {
		serverSetDefaultMap("FREERIDENOC");
	} else {
		serverSetDefaultMap("FREERIDE");
	}
}
VehicleNames <-[
	"Blue Bolt Ace Tudor",
	"Dark Blue Bolt Ace Tudor",
	"Brown Bolt Ace Tudor",
	"Green Bolt Ace Tudor",
	"Red Bolt Ace Tudor",
	"Blue Bolt Ace Touring",
	"Dark Blue Bolt Ace Touring",
	"Brown Bolt Ace Touring",
	"Green Bolt Ace Touring",
	"Red Bolt Ace Touring",
	"Blue Bolt Ace Runabout",
	"Dark Blue Bolt Ace Runabout",
	"Brown Bolt Ace Runabout",
	"Green Bolt Ace Runabout",
	"Red Bolt Ace Runabout",
	"Blue Bolt Ace Pickup",
	"Dark Blue Bolt Ace Pickup",
	"Brown Bolt Ace Pickup",
	"Green Bolt Ace Pickup",
	"Red Bolt Ace Pickup",
	"Blue Bolt Ace Fordor",
	"Dark Blue Bolt Ace Fordor",
	"Brown Bolt Ace Fordor",
	"Green Bolt Ace Fordor",
	"Red Bolt Ace Fordor",
	"Blue Bolt Ace Coupe",
	"Dark Blue Bolt Ace Coupe",
	"Brown Bolt Ace Coupe",
	"Green Bolt Ace Coupe",
	"Red Bolt Ace Coupe",
	"Brown Bolt Model B Tudor",
	"Red Bolt Model B Tudor",
	"Green Bolt Model B Tudor",
	"Dark Blue Bolt Model B Tudor",
	"Brown Bolt Model B Roadster",
	"Red Bolt Model B Roadster",
	"Green Bolt Model B Roadster",
	"Dark Blue Bolt Model B Roadster",
	"Brown Bolt Model B Pickup",
	"Red Bolt Model B Pickup",
	"Green Bolt Model B Pickup",
	"Dark Blue Bolt Model B Pickup",
	"Brown Bolt Model B Fordor",
	"Red Bolt Model B Fordor",
	"Green Bolt Model B Fordor",
	"Dark Blue Bolt Model B Fordor",
	"Brown Bolt Model B Delivery",
	"Red Bolt Model B Delivery",
	"Green Bolt Model B Delivery",
	"Dark Blue Bolt Model B Delivery",
	"Brown Bolt Model B Coupe",
	"Red Bolt Model B Coupe",
	"Green Bolt Model B Coupe",
	"Dark Blue Bolt Model B Coupe",
	"Brown Bolt Model B Tudor",
	"Red Bolt Model B Tudor",
	"Green Bolt Model B Tudor",
	"Dark Blue Bolt Model B Tudor",
	"Green Bolt V8 Coupe",
	"Red Bolt V8 Coupe",
	"Blue Bolt V8 Coupe",
	"Grey Bolt V8 Coupe",
	"Green Bolt V8 Forder",
	"Red Bolt V8 Forder",
	"Blue Bolt V8 Forder",
	"Grey Bolt V8 Forder",
	"Green Bolt V8 Roadster",
	"Red Bolt V8 Roadster",
	"Blue Bolt V8 Roadster",
	"Grey Bolt V8 Roadster",
	"Green Bolt V8 Touring",
	"Red Bolt V8 Touring",
	"Blue Bolt V8 Touring",
	"Grey Bolt V8 Touring",
	"Green Bolt V8 Tudor",
	"Red Bolt V8 Tudor",
	"Blue Bolt V8 Tudor",
	"Grey Bolt V8 Tudor",
	"Brubaker",
	"Silver Bruno Speedster 851",
	"Red Bruno Speedster 851",
	"Green Bruno Speedster 851",
	"Caesar 8C 2300 Racing",
	"Red Caesar 8C Mostro",
	"Black Caesar 8C Mostro",
	"White Celeste Marque 500",
	"Brown Celeste Marque 500",
	"Blue Corrozella C-Otto",
	"Green Corrozella C-Otto",
	"Blue Crusader Chromium Forder",
	"Violet Crusader Chromium Forder",
	"Green Crusader Chromium Forder",
	"Dark Blue Crusader Chromium Forder",
	"Blue Falconer",
	"Red Falconer",
	"Gangster Falconer",
	"Falconer Yellowcar",
	"Umber Guardian Terraplane Coupe",
	"Beige Guardian Terraplane Coupe",
	"Black Guardian Terraplane Coupe",
	"Umber Guardian Terraplane Fordor",
	"Beige Guardian Terraplane Fordor",
	"Black Guardian Terraplane Fordor",
	"Umber Guardian Terraplane Tudor",
	"Beige Guardian Terraplane Tudor",
	"Black Guardian Terraplane Tudor",
	"Lassister Fordor",
	"Lassister Phaeton",
	"Lassister Roadster",
	"Lassister Appolyon",
	"Lassister Charon",
	"Lassister Police",
	"Green Shubert Extra Six Forder",
	"White Shubert Extra Six Forder",
	"Blue Shubert Extra Six Forder",
	"Shubert Extra Six Forder Police",
	"Green Shubert Extra Six Tudor",
	"White Shubert Extra Six Tudor",
	"Blue Shubert Extra Six Tudor",
	"Shubert Extra Six Tudor Police",
	"Red Shubert Six",
	"White Shubert Six",
	"Black Shubert Six",
	"Shubert Six Police",
	"Silver Fletcher",
	"Orange Thor 810 Cabriolet",
	"Black Thor 810 Cabriolet",
	"Orange Thor 810 Phaeton",
	"Black Thor 810 Phaeton",
	"Orange Thor 810 Sedan",
	"Black Thor 810 Sedan",
	"Trautenberg Model J",
	"Trautenberg Racer 4WD",
	"Yellow Ulver Airstream Fordor",
	"Green Ulver Airstream Fordor",
	"Yellow Ulver Airstream Tudor",
	"Green Ulver Airstream Tudor",
	"Blue Wright Coupe",
	"Red Wright Coupe",
	"Green Wright Coupe",
	"Gangster Wright Coupe",
	"Blue Wright Fordor",
	"Red Wright Fordor",
	"Green Wright Fordor",
	"Bolt Ambulance",
	"Bolt Firetruck",
	"Bolt Hearse",
	"Bolt Truck Flatbed",
	"Bolt Truck Covered",
	"Bolt Truck(Atlantic Import)",
	"Bolt Truck"
];

function onPickupTaken(iPickupID, iPlayerID) { 
	
}

function onPlayerConnect(iPlayerID) {
	print("Player " + playerGetName(iPlayerID)+ "[" + iPlayerID + "]connected to the server.");
	
	onlinePlayers[iPlayerID]<- iPlayerID;
	playerToggleCityMusic(iPlayerID, 0);
	
	createPlayerDataSlot(iPlayerID);
	local bAccountLoaded = loadPlayerFromDatabase(iPlayerID);
	
	sendPlayerMessage(iPlayerID, Colours.Yellow + "Welcome to the " + GlobalConfig.szServerName + " server!");
	
	if(bAccountLoaded) {
		if(PlayerData[iPlayerID].iAccountSettings & AccountSettings.LoginByLastIP) {
			if(playerGetIP(iPlayerID) == PlayerData[iPlayerID].szLastIP) {
				playerMessageSuccess(iPlayerID, "You have been logged in via your IP!");
				loginSuccess(iPlayerID);
				return 1;
			}
		}
		sendPlayerMessage(iPlayerID, Colours.Cyan + "The name, " + playerGetName(iPlayerID)+ " is already registered.");
		sendPlayerMessage(iPlayerID, Colours.Cyan + "Use /login to access this account.");
	} else {
		sendPlayerMessage(iPlayerID, Colours.Cyan + "The name, " + playerGetName(iPlayerID)+ " is NOT registered.");
		sendPlayerMessage(iPlayerID, Colours.Cyan + "Use /register to create an account.");
	}
}

function onPlayerSpawn(iPlayerID) {
	if(!PlayerData[iPlayerID].bLoggedIn) {
		playerLockControls(iPlayerID, 1);
	}
	
	if(PlayerData[iPlayerID].bIsDead) {
		PlayerData[iPlayerID].bIsDead <- false;
		playerSetPosition(iPlayerID, -758.792, 13.2488, 761.116);
		playerSetRotation(iPlayerID, 179.981);
		playerChangeSkin(iPlayerID, PlayerData[iPlayerID].iSkinID);
	}
	
	print("Player " + playerGetName(iPlayerID)+ "[" + iPlayerID + "]spawned.");
}

function onPlayerDisconnect(iPlayerID) {
	onlinePlayers[iPlayerID]<- null;
	
	/*
	playerSavePosition(iPlayerID);
	playerSaveSkin(iPlayerID);
	playerSaveWeapons(iPlayerID);
	playerSaveMoney(iPlayerID);
	*/
	
	if(PlayerData[iPlayerID].bLoggedIn) {
		savePlayerToDatabase(iPlayerID);
	}
	
	deletePlayerDataSlot(iPlayerID);
	
	print("Player " + playerGetName(iPlayerID)+ "[" + iPlayerID + "]disconnected from the server.");
}

function onPlayerText(iPlayerID, szMessage) {
	print("[" + playerGetName(iPlayerID)+ "] sent message: " + szMessage);	  
	
	if(PlayerData[iPlayerID].bMuted) {
		messagePlayerError(iPlayerID, "You are muted, and cannot use any chat");
	} else {
		if(PlayerData[iPlayerID].pUsingPayPhone && PlayerData[iPlayerID].pUsingPayPhone.iState == PayPhoneState.ActiveCall) {
			playerPhoneTalk(iPlayerID, szMessage);
		} else {
			sendAllMessage(Colours.Orange + "<" + playerGetName(iPlayerID)+ "> " + Colours.White + szMessage);
		}
	}
	
	return false;
}

function onServerTickSecond(iTicks) {
	iServerSecondTicks++;
	
	checkServerSaveCooldown();
	checkSpawnRestoreCooldown();
	checkRingingPayPhones();
	checkPayPhoneCallers();
}

function onServerTick(iTicks) {
	iServerTicks++;
}

function onPlayerShoot(iPlayerID, iWeaponID) {
	
}

function onPlayerThrowGranade(iPlayerID, iWeaponID) {
	
}

function onPlayerEnterVehicle(iPlayerID, iVehicleID, iSeatID) {
	playerToggleCityMusic(iPlayerID, VehicleData[iVehicleID].iRadioID);
	playerMessageAlert(iPlayerID, "You entered vehicle " + iVehicleID + " in the " + VehicleSeatNames[iSeatID]+ " seat.");
	
	if(VehicleData[iVehicleID].iOwnerType == VehicleOwnerType.Player) {
		if(VehicleData[iVehicleID].iOwnerID != PlayerData[iPlayerID].iAccountID) {
			local szOwnerName = iniGetParam("data/accounts/" + iAccountID + ".ini", "szName", "(Unknown)");
			
			if(VehicleData[iVehicleID].bLocked) {
				playerMessageAlert(iPlayerID, "This vehicle belongs to " + szOwnerName + ". It is locked, so you cannot drive it.");
				playerKickOutVehicle(iPlayerID);
			} else {
				playerMessageAlert(iPlayerID, "This vehicle belongs to " + szOwnerName + ". It is not locked, so you may drive it.");
			}
			return true;
		} else {
			sendPlayerMessage(iPlayerID, Colours.White + "This vehicle belongs to you, " + playerGetName(iPlayerID));
			if(VehicleData[iVehicleID].iDMVRegistrationID == 0) {
				playerMessageAlert(iPlayerID, "This vehicle has not been registered with the Department of Motor Vehicles!");
			}
		}
	}
	
	if(VehicleData[iVehicleID].iOwnerType == VehicleOwnerType.PublicJob) {
		if(VehicleData[iVehicleID].iOwnerID != PlayerData[iPlayerID].iPublicJob) {
			local iPublicJobID = VehicleData[iVehicleID].iOwnerID;
			
			playerMessageError(iPlayerID, "You cannot drive this vehicle! It belongs to the '" + PublicJobs[iPublicJobID].szName + "' job!");
			playerMessageAlert(iPlayerID, "To get the '" + PublicJobs[iPublicJobID].szName + "' job, visit the " + PublicJobs[iPublicJobID].szGetJobLocationDesc + " and use /getjob!");
			playerKickOutVehicle(iPlayerID);
			return true;
		}
	}
	
	if(VehicleData[iVehicleID].iOwnerType == VehicleOwnerType.Faction) {
		if(VehicleData[iVehicleID].iOwnerID != PlayerData[iPlayerID].iFactionID) {
			local iFactionID = VehicleData[iVehicleID].iOwnerID;
			
			playerMessageError(iPlayerID, "You cannot drive this vehicle! It belongs to the '" + Factions[iFactionID].szName + "' faction!");
			playerKickOutVehicle(iPlayerID);
			return true;
		}
	}
	
	if(iSeatID == 0) {
		if(VehicleData[iVehicleID].iBuyPrice > 0) {
			sendPlayerMessage(iPlayerID, Colours.Cyan + "This vehicle is for sale. It costs $" + VehicleData[iVehicleID].iBuyPrice + " to buy it.");
			if(playerGetMoney(iPlayerID) >= VehicleData[iVehicleID].iBuyPrice) {
				sendPlayerMessage(iPlayerID, Colours.Orange + "Use /buycar to purchase this vehicle ");
			} else {
				sendPlayerMessage(iPlayerID, Colours.Orange + "You don't have enough money to buy this vehicle.");
			}
		} else if(VehicleData[iVehicleID].iRentPrice > 0) {
			sendPlayerMessage(iPlayerID, Colours.Cyan + "This vehicle is rentable. It costs $" + VehicleData[iVehicleID].iRentPrice + " per minute");
			sendPlayerMessage(iPlayerID, Colours.Orange + "You have " + GlobalConfig.iVehRentStartWait + " seconds to exit the vehicle if you don't want to rent it.");
			PlayerData[iPlayerID].iVehRentStart <- time();
		}
		
		if(GlobalConfig.bNight) {
			vehicleToggleLights(iVehicleID, 1);
		}
	}
		
	print("Player " + playerGetName(iPlayerID)+ "[" + iPlayerID + "]entered vehicle " + iVehicleID + " in seat " + iSeatID);
	
	return true;
}

function onPlayerExitVehicle(iPlayerID, iVehicleID) {
	playerToggleCityMusic(iPlayerID, 0);
	
	if(PlayerData[iPlayerID].iGameSettings & GameSettings.AutoSirenOff) {
		vehicleToggleSiren(iVehicleID, 0);
	}
	
	if(VehicleData[iVehicleID].iRentPrice > 0) {
		if(PlayerData[iPlayerID].iVehRentStart > 0) {
			if((time()- PlayerData[iPlayerID].iVehRentStart) > GlobalConfig.iVehRentStartWait) {
				local iRentTime =(time()- PlayerData[iPlayerID].iVehRentStart);
				local iCost = ceil(60 /(VehicleData[iVehicleID].iRentPrice * iRentTime));
				playerSetMoney(iPlayerID, playerGetMoney(iPlayerID)- iCost);
				playerMessageAlert(iPlayerID, "You were charged $" + iCost + " to rent the vehicle.");
			}
		}
	}
	
	PlayerData[iPlayerID].iVehRentStart <- 0;
	
	print("Player " + playerGetName(iPlayerID)+ "[" + iPlayerID + "]exited vehicle " + iVehicleID);
}

function onPlayerIsKilled(iPlayerID, iKillerID, iReasonID, iBodyPartID) {
	if(PlayerData[iPlayerID].bSpawned) {
		PlayerData[iPlayerID].bIsDead <- true;
	}
	
	if(iPlayerID != iKillerID) {
		sendAllMessage("Player " + playerGetName(iPlayerID)+ "[" + iPlayerID + "]was killed by " + playerGetName(iKillerID)+ "[" + iKillerID + "](Reason: " + iReasonID + " / Part: " + BodyParts[iBodyPartID]+ "[" + iBodyPartID + "])");
	} else {
		sendAllMessage("Player " + playerGetName(iPlayerID)+ "[" + iPlayerID + "]died.(Reason: " + iReasonID + " / Part: " + iBodyPartID + ")");
	}
}

function onPlayerKeyPressed(iPlayerID, iKeyID) {
}

function onPlayerCommand(iPlayerID, szCommand, szParams) {
	consoleMessage(getPlayerNameAndID(iPlayerID)+ " has sent command: /" + szCommand + " " + szParams);
	
	if(szCommand.tolower() == "q") {
		return 1;
	}
	
	if(!canPlayerUseCommand(iPlayerID, szCommand.tolower())) {
		playerMessageError(iPlayerID, "You are not allowed to use this command!"); 
		return 1;
	}
	
	switch(szCommand.tolower()) {
		case "login":
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/login <password>");	
				return 1;
			}
			
			local szPassword = szParams;
			
			if(!isPlayerRegistered(iPlayerID)) {
				playerMessageError(iPlayerID, "You are not registered! Use /register"); 
				return 1;
			}
			
			if(PlayerData[iPlayerID].bLoggedIn) {
				playerMessageError(iPlayerID, "You are already logged in!"); 
				return 1;
			}
			
			if(playerGetIP(iPlayerID) == PlayerData[iPlayerID].szLastIP) {
				playerMessageSuccess(iPlayerID, "You have been logged in!");
				loginSuccess(iPlayerID);
				return 1;				 
			}
			
			if(szPassword != PlayerData[iPlayerID].szPassword) {
				playerMessageError(iPlayerID, "You entered the wrong password"); 
				return 1;
			}
			
			playerMessageSuccess(iPlayerID, "You have been logged in!");
			loginSuccess(iPlayerID);			
			break;
			
		case "register":
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/register <password>");	   
				return 1;
			}
			
			local szPassword = szParams;
			
			if(isPlayerRegistered(iPlayerID)) {
				playerMessageError(iPlayerID, "You are already registered! Use /login"); 
				return 1;
			}
			
			PlayerData[iPlayerID].szPassword <- szPassword;
			PlayerData[iPlayerID].bNewlyRegistered <- true;
			
			addPlayerToDatabase(iPlayerID);
			
			playerMessageSuccess(iPlayerID, "You have been registered and logged in!");
			sendPlayerMessage(iPlayerID, Colours.White + "TIP: " + Colours.Cyan + "Use /iplogin to allow quick login from your IP.");
			loginSuccess(iPlayerID);
			break;
			
		case "iplogin":
			if(PlayerData[iPlayerID].iAccountSettings & AccountSettings.LoginByLastIP) {
				PlayerData[iPlayerID].iAccountSettings <- PlayerData[iPlayerID].iAccountSettings & ~AccountSettings.LoginByLastIP
				playerMessageSuccess(iPlayerID, "You have disabled login by IP for this account.");
			} else {
				PlayerData[iPlayerID].iAccountSettings <- PlayerData[iPlayerID].iAccountSettings | AccountSettings.LoginByLastIP
				playerMessageSuccess(iPlayerID, "You have enabled login by IP for this account.");
			}
			
			break;
			
		case "autosirenoff":
			if(PlayerData[iPlayerID].iGameSettings & GameSettings.AutoSirenOff) {
				PlayerData[iPlayerID].iGameSettings <- PlayerData[iPlayerID].iGameSettings & ~GameSettings.AutoSirenOff;
				playerMessageSuccess(iPlayerID, "Vehicle sirens will no longer turn off when you get out. Use /siren instead.");
			} else {
				PlayerData[iPlayerID].iGameSettings <- PlayerData[iPlayerID].iGameSettings | GameSettings.AutoSirenOff;
				playerMessageSuccess(iPlayerID, "Vehicle sirens will now automatically turn off when you get out.");
			}
			
			break;			  
			
		case "sr":
			local result = compilestring("return " + szParams)();
			playerMessageSuccess(iPlayerID, "Code Executed! Returns: " + result + "(" + type(result)+ ")");
			break;
			
		case "se":
			local result = compilestring(szParams)();
			playerMessageSuccess(iPlayerID, "Code Executed! Code: " + szParams);
			break;
			
		case "fov":
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/ <amount between 60 and 120>");	
				return 1;
			}
			local fFOV = szParams.tofloat();
			if(fFOV > 120.0 || fFOV < 60.0) {
				playerMessageError(iPlayerID, "The field of view must between 60 and 120. Decimals are allowed."); 
				return 1;
			}
			PlayerData[iPlayerID].fFOV <- fFOV;
			playerSetCameraFov(iPlayerID, fFOV);
			playerMessageSuccess(iPlayerID, "Field of view(FOV)set to: " + szParams.tofloat());
			break;
			
		case "addveh":
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/addcar <model id>");	 
				return 1;
			}
			
			local iModelID = szParams.tointeger();
			
			local pos = playerGetPosition(iPlayerID);
			local rotv = playerGetRotationAsVector(iPlayerID);
			local rot = playerGetRotation(iPlayerID);
			
			if(!isValidVehicleModelID(iModelID)) { 
				playerMessageError(iPlayerID, "You entered an invalid model ID"); 
				return 1; 
			}
			
			local front = getPosInFrontOfPos(
				pos[0], 
				pos[1], 
				pos[2], 
				rot
				GlobalConfig.fVehicleSpawnDistance 
		   );	 
			
			local iVehicleID =	vehicleSpawn(
									iModelID, 
									front[0], 
									front[1], 
									front[2], 
									rotv[0], 
									rotv[1], 
									rotv[2]
									/*				  
									GlobalConfig.VehicleSpawn.fRotX, 
									GlobalConfig.VehicleSpawn.fRotY, 
									GlobalConfig.VehicleSpawn.fRotZ 
									*/
							   );
			
			VehicleDataID[iVehicleID]<- -1;
			VehicleData[iVehicleID]<- { };
			VehicleData[iVehicleID].iOwnerType <- VehicleOwnerType.None;
			VehicleData[iVehicleID].iOwnerID <- -1;
			VehicleData[iVehicleID].iModelID <- iModelID;
			VehicleData[iVehicleID].iBuyPrice <- 0;
			VehicleData[iVehicleID].iRentPrice <- 0;
			VehicleData[iVehicleID].iRadioID <- 0;
			VehicleData[iVehicleID].bSavedPosLock <- 0;
			VehicleData[iVehicleID].iDMVRegistrationID <- 0;
			
			//addVehicleToDatabase(iPlayerID);
			break;
			
		case "tempcar":
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/tempcar <model id>");	  
				return 1;
			}
			
			local iModelID = szParams.tointeger();
			
			local pos = playerGetPosition(iPlayerID);
			local rotv = playerGetRotationAsVector(iPlayerID);
			local rot = playerGetRotation(iPlayerID);
			
			if(!isValidVehicleModelID(iModelID)) { 
				playerMessageError(iPlayerID, "You entered an invalid model ID"); 
				return 1; 
			}
			
			local front = getPosInFrontOfPos(
				pos[0], 
				pos[1], 
				pos[2], 
				rot
				GlobalConfig.fVehicleSpawnDistance 
		   );	 
			
			local iVehicleID =	vehicleSpawn(
									iModelID, 
									front[0], 
									front[1], 
									front[2], 
									rotv[0], 
									rotv[1], 
									rotv[2]
									/*				  
									GlobalConfig.VehicleSpawn.fRotX, 
									GlobalConfig.VehicleSpawn.fRotY, 
									GlobalConfig.VehicleSpawn.fRotZ 
									*/
							   );
			
			VehicleDataID[iVehicleID]<- -1;
			VehicleData[iVehicleID]<- { };
			VehicleData[iVehicleID].iOwnerType <- VehicleOwnerType.Temp;
			VehicleData[iVehicleID].iOwnerID <- -1;
			VehicleData[iVehicleID].iModelID <- iModelID;
			VehicleData[iVehicleID].iBuyPrice <- 0;
			VehicleData[iVehicleID].iRentPrice <- 0;
			VehicleData[iVehicleID].iRadioID <- 0;
			VehicleData[iVehicleID].bSavedPosLock <- 0;
			VehicleData[iVehicleID].iDMVRegistrationID <- 0;
			
			//addVehicleToDatabase(iPlayerID);
			break;
			
		case "addpayphone":
			local pPosition = playerGetPosition(iPlayerID);
			
			if(isPositionAtPayPhone(pPosition[0], pPosition[1], pPosition[2])) {
				playerMessageError(iPlayerID, "You are already at a payphone!"); 
				return 1;
			}
			
			local pPayphone = PayPhone(pPosition[0], pPosition[1], pPosition[2]);
			
			PayPhones.push(pPayphone);
			playerMessageSuccess(iPlayerID, "Payphone " + PayPhones.len()+ " has been added. Call number: " + pPayphone.iCallNumber);
			break;			
			
		case "delveh":
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/delcar <model id>");
				return 1;
			}
			
			local iVehicleID = szParams.tointeger();
			
			if(!vehicleExists(iVehicleID)) {
				playerMessageError(iPlayerID, "You entered an invalid vehicle ID"); 
			}
			
			vehicleDelete(iVehicleID);
			removeVehicleFromDatabase(iVehicleID);
			playerMessageSuccess(iPlayerID, "Vehicle " + iVehicleID + " has been deleted");
			break;
			
		/*
		case "delallcars":
			for(local i = 0 ; i < GlobalConfig.iMaxVehicles ; i++) {
				if(vehicleExists(i)) {
					vehicleDelete(i);
				}
			}
			
			consoleMessage(getPlayerNameAndID(iPlayerID)+ " has deleted all vehicles");
			playerMessageSuccess(iPlayerID, "All vehicles have been deleted");
			break;
		*/
			
		case "nearveh":
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/nearcars <distance>");
				return 1;
			}
			
			local fDistance = szParams.tofloat();
			
			if(fDistance <= 1.0) {
				playerMessageError(iPlayerID, "The distance cannot be less than 1"); 
				return 1;
			}
			
			local myPos = playerGetPosition(iPlayerID);
			local vPos = 0.0
			local fDistance2 = 0.0;
			local iVehicleDataID = -1;
			local iModelID = 0;
			
			for(local i = 0 ; i < GlobalConfig.iMaxVehicles ; i++) {
				if(vehicleExists(i)) {
					iModelID = VehicleData[i].iModelID;
					
					vPos = vehicleGetPosition(i);
					fDistance2 = getDistance(myPos[0], myPos[2], vPos[0], vPos[2]);
					
					if(fDistance2 <= fDistance) {
						sendPlayerMessage(iPlayerID, VehicleNames[iModelID]+ "(ID: " + i + ", " + fDistance2 + " units " + getCardinalDirectionText(getCardinalDirection(myPos[0], myPos[2], vPos[0], vPos[2]))+ ")");
					}
				}
			}
			break;			
			
		case "setskin":
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/setskin <player id> <skin id>");
				return 1;
			}
			
			local szParamsSplit = split(szParams, " ");
			if(szParamsSplit.len() < 2) {
				playerMessageSyntax(iPlayerID, "/setskin <player id> <skin id>");
			}
			local iTargetID = szParamsSplit[0].tointeger();
			local iSkinID = szParamsSplit[1].tointeger();
			
			if(!playerIsConnected(iTargetID)) {
				playerMessageError(iPlayerID, "That player ID is not online"); 
				return 1;
			}
			
			if(!isValidSkinID(iSkinID)) {
				playerMessageError(iPlayerID, "You entered an invalid skin ID"); 
				return 1;
			}
			
			playerMessageAlert(iTargetID, "Your skin has been changed to ID " + iSkinID + " by " + playerGetName(iPlayerID));
			playerMessageSuccess(iPlayerID, "You have changed " + playerGetName(iPlayerID)+ "'s skin to " + iSkinID);
			consoleMessage(getPlayerNameAndID(iPlayerID)+ " has changed " + getPlayerNameAndID(iTargetID)+ " skin to " + iSkinID);
			playerChangeSkin(iTargetID, iSkinID);
			break;
			
		case "kick":   
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/kick <player id> <reason>");
				return 1;
			}
			
			local szParamsSplit = split(szParams, " ");
			if(szParamsSplit.len() < 2) {
				playerMessageSyntax(iPlayerID, "/kick <player id> <reason>");
			}
			local iTargetID = szParamsSplit[0].tointeger();
			local szReason = szParamsSplit[1];
			
			if(!playerIsConnected(iTargetID)) {
				playerMessageError(iPlayerID, "That player ID is not online"); 
				return 1;
			}
			
			sendAllMessage(Colours.Red + playerGetName(iTargetID)+ " has been kicked by an administrator for: " + szReason);
			playerMessageSuccess(iPlayerID, "You kicked " + playerGetName(iTargetID)+ " for: " + szReason);
			consoleMessage(getPlayerNameAndID(iPlayerID)+ " has kicked " + getPlayerNameAndID(iTargetID)+ " for: " + szReason);
			playerKick(iTargetID);
			break;
			
		case "mypos":
			local fMyPos = playerGetPosition(iPlayerID);
			print(getPlayerNameAndID(iPlayerID)+ "'s current position: " + fMyPos[0]+ ", " + fMyPos[1]+ ", " + fMyPos[2]);
			break;
			
		case "gotopos": 
			local szSplit = split(szParams, ", ");
			playerSetPosition(iPlayerID, szSplit[0].tofloat(),	szSplit[1].tofloat(),  szSplit[2].tofloat());
			break;
			
		case "gotospawn":
			local szSplit = split(szParams, ", ");
			playerSetPosition(iPlayerID, GlobalConfig.NewCharacter.fSpawnX, GlobalConfig.NewCharacter.fSpawnY, GlobalConfig.NewCharacter.fSpawnZ);		
			break;			
			
		case "setstafftitle":	
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/setstafftitle <player id> <title>");
				return 1;
			}
			
			local szParamsSplit = split(szParams, " ");
			if(szParamsSplit.len() < 2) {
				playerMessageSyntax(iPlayerID, "/setstafftitle <player id> <title>");
			}
			local iTargetID = szParamsSplit[0].tointeger();
			local szStaffTitle = szParamsSplit[1];
			
			if(!playerIsConnected(iTargetID)) {
				playerMessageError(iPlayerID, "That player ID is not online"); 
				return 1;
			}
			
			iniSetParam("data/stafftitles.ini", playerGetName(iPlayerID), szStaffTitle);
			playerMessageSuccess(iPlayerID, "You set " + playerGetName(iTargetID)+ "'s staff title to " + szStaffTitle);
			break;
			
		case "freeze":	 
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/freeze <player id>");
				return 1;
			}
			local iTargetID = szParams.tointeger();
			
			if(!playerIsConnected(iTargetID)) {
				playerMessageError(iPlayerID, "That player ID is not online"); 
				return 1;
			}
			
			playerMessageAlert(iTargetID, "You have been frozen by an administrator");
			playerMessageAlert(iPlayerID, "You have frozen " + playerGetName(iTargetID));
			consoleMessage(getPlayerNameAndID(iPlayerID)+ " has frozen " + getPlayerNameAndID(iTargetID));
			PlayerData[iTargetID].Frozen <- true;
			playerLockControls(iTargetID, 1);
			break;
			
		case "unfreeze":   
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/unfreeze <player id>");
				return 1;
			}
			local iTargetID = szParams.tointeger();
			
			if(!playerIsConnected(iTargetID)) {
				playerMessageError(iPlayerID, "That player ID is not online"); 
				return 1;
			}
			
			playerMessageAlert(iTargetID, "You have been unfrozen by an administrator");
			playerMessageAlert(iPlayerID, "You have unfrozen " + playerGetName(iTargetID));
			consoleMessage(getPlayerNameAndID(iPlayerID)+ " has unfrozen " + getPlayerNameAndID(iTargetID));										
			PlayerData[iTargetID].Frozen <- false;
			playerLockControls(iTargetID, 0);
			break;
			
		case "mute":   
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/mute <player id>");
				return 1;
			}
			local iTargetID = szParams.tointeger();
			
			if(!playerIsConnected(iTargetID)) {
				playerMessageError(iPlayerID, "That player ID is not online"); 
				return 1;
			}
			
			playerMessageAlert(iTargetID, "You have been muted by an administrator");
			playerMessageAlert(iPlayerID, "You have muted " + playerGetName(iTargetID));
			consoleMessage(getPlayerNameAndID(iPlayerID)+ " has muted " + getPlayerNameAndID(iTargetID));										 
			PlayerData[iTargetID].Muted <- true;
			break;
			
		case "unmute":	 
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/unmute <player id>");
				return 1;
			}
			local iTargetID = szParams.tointeger();
			
			if(!playerIsConnected(iTargetID)) {
				playerMessageError(iPlayerID, "That player ID is not online"); 
				return 1;
			}
			
			playerMessageAlert(iTargetID, "You have been unmuted by an administrator");
			playerMessageAlert(iPlayerID, "You have unmuted " + playerGetName(iTargetID));
			consoleMessage(getPlayerNameAndID(iPlayerID)+ " has unmuted " + getPlayerNameAndID(iTargetID));										   
			PlayerData[iTargetID].Muted <- false;
			break; 
			
		case "goto":
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/goto <player id>");
				return 1;
			}		
			
			local iTargetID = szParams.tointeger();
			
			if(!playerIsConnected(iTargetID)) {
				playerMessageError(iPlayerID, "That player ID is not online"); 
				return 1;
			}
			
			local pos = getPosInFrontOfPlayer(iTargetID, 3.0);
			playerSetPosition(iPlayerID, pos[0], pos[1], pos[2]);
			
			playerMessageAlert(iPlayerID, "You have teleported to " + playerGetName(iTargetID)); 
			consoleMessage(getPlayerNameAndID(iPlayerID)+ " has teleported to " + getPlayerNameAndID(iTargetID));										 
			break;
			
		case "gotoveh":
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/gotoveh <vehicle id>");
				return 1;
			}
			
			local iTargetID = szParams.tointeger();
			
			if(!vehicleExists(iTargetID)) {
				playerMessageError(iPlayerID, "That vehicle ID does not exist"); 
				return 1;
			}
			
			local pos = vehicleGetPosition(iTargetID);
			playerSetPosition(iPlayerID, pos[0], pos[1]+ 3.0, pos[2]);
			
			playerMessageAlert(iPlayerID, "You have teleported to vehicle " + iTargetID);
			consoleMessage(getPlayerNameAndID(iPlayerID)+ " has teleported to vehicle " + iTargetID);							 
			break;	

		case "vehinfo":
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/gotoveh <vehicle id>");
				return 1;
			}
			
			local iTargetID = szParams.tointeger();
			
			if(!vehicleExists(iTargetID)) {
				playerMessageError(iPlayerID, "That vehicle ID does not exist"); 
				return 1;
			}
			
			local iModelID = VehicleData[iVehicleID].iModelID;
			playerMessageAlert(iPlayerID, "Type: " + iModelID + " (" + VehicleNames[iModelID] +")" );						
			break;	
			
		case "getveh":
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/getveh <vehicle id>");
				return 1;
			}
			
			local iTargetID = szParams.tointeger();
			
			if(!vehicleExists(iTargetID)) {
				playerMessageError(iPlayerID, "That vehicle ID does not exist"); 
				return 1;
			}
			
			local pos = playerGetPosition(iTargetID);
			local front = getPosInFrontOfPlayer(iPlayerID, 10.0);
			vehicleSetPosition(iTargetID, front[0], front[1], front[2]);
			
			playerMessageAlert(iPlayerID, "You teleported vehicle " + iTargetID + " to your location.");
			consoleMessage(getPlayerNameAndID(iPlayerID)+ " has teleported vehicle " + iTargetID + " to their position");							 
			break;
			
		case "get":
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/get <player id>");
				return 1;
			}		
			
			if(!playerIsConnected(iTargetID)) {
				playerMessageError(iPlayerID, "That player ID is not online"); 
				return 1;
			}
			
			local iTargetID = szParams.tointeger();
			
			local pos = getPosInFrontOfPlayer(iPlayerID, 3.0);
			playerSetPosition(iTargetID, pos[0], pos[1], pos[2]);
			
			playerMessageAlert(iPlayerID, "You have teleported " + playerGetName(iTargetID)+ " to your position.");
			playerMessageAlert(iTargetID, "You have been teleported to " + playerGetName(iPlayerID));		  
			consoleMessage(getPlayerNameAndID(iPlayerID)+ " has been teleported to " + getPlayerNameAndID(iTargetID));				  
			break;
			
		case "siren":
			local iVehicleID = playerInVehicleID(iPlayerID);
			if(iVehicleID == -1) {
				playerMessageError(iPlayerID, "You must be in a vehicle");
				return 1;				 
			}
				
			if(vehicleGetSirenState(iVehicleID)) {
				vehicleToggleSiren(iVehicleID, 0);
				playerMessageSuccess(iPlayerID, "You have turned off the siren for vehicle " + iVehicleID);				   
				consoleMessage(getPlayerNameAndID(iPlayerID)+ " has turned off the siren for vehicle + " + iVehicleID);
			} else {
				vehicleToggleSiren(iVehicleID, 1);
				playerMessageSuccess(iPlayerID, "You have turned on the siren for vehicle " + iVehicleID); 
				consoleMessage(getPlayerNameAndID(iPlayerID)+ " has turned on the siren for vehicle + " + iVehicleID);				  
			}
			break;
			
		case "respawnall":
			for(local i = 0 ; i < GlobalConfig.iMaxVehicles ; i++) {
				if(vehicleExists(i)) {
					vehicleDelete(i);
					VehicleData[i]<- null;
					VehicleDataID[i]<- -1;
				}
			}
			
			loadVehiclesFromDatabase();
			break;
			
		case "saveposlock":
			local iVehicleID = playerInVehicleID(iPlayerID);
			if(iVehicleID == -1) {
				playerMessageError(iPlayerID, "You must be in a vehicle");
				return 1;
			}
				
			if(VehicleData[iVehicleID].bSavedPosLock == 0) {
				VehicleData[iVehicleID].bSavedPosLock <- 1;
				playerMessageSuccess(iPlayerID, "You have disabled the position saving for vehicle " + iVehicleID);
				playerMessageAlert(iPlayerID, "Vehicle " + iVehicleID + " will no longer keep it's position on server save.");
				consoleMessage(getPlayerNameAndID(iPlayerID)+ " has disabled the position saving for vehicle " + iVehicleID);
			} else {
				VehicleData[iVehicleID].bSavedPosLock <- 0;
				playerMessageSuccess(iPlayerID, "You have enabled the position saving for vehicle " + iVehicleID);
				playerMessageAlert(iPlayerID, "Vehicle " + iVehicleID + " will keep it's position on server save");
				consoleMessage(getPlayerNameAndID(iPlayerID)+ " has enabled the position saving for vehicle " + iVehicleID);
			}
			break;			  
		  
		/*
		// Radio doesn't use ID's ... My bad
		case "radio":
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/radio <radio id>");
				return 1;
			}
			
			local iVehicleID = playerInVehicleID(iPlayerID);
			if(iVehicleID == -1) {
				playerMessageError(iPlayerID, "You must be in a vehicle"); 
			}
			
			local iRadioID = szParams.tointeger();
				
			VehicleData[iVehicleID].iRadioID <- iRadioID;
			break;
		*/
		
		case "radio":
			local iVehicleID = playerInVehicleID(iPlayerID);
			if(iVehicleID == -1) {
				playerMessageError(iPlayerID, "You must be in a vehicle"); 
				return 1;
			}
			
			local szPassengerMessage = "";
				
			if(VehicleData[iVehicleID].iRadioID == 1) {				   
				VehicleData[iVehicleID].iRadioID <- 0;
				szPassengerMessage = Colours.White + playerGetName(iPlayerID)+ " has turned off the radio";
				playerMessageSuccess(iPlayerID, "You have turned off the radio for vehicle " + iVehicleID);
				playerMessageAlert(iPlayerID, "You may need to get out of the vehicle and get back in to stop the radio.");
				consoleMessage(getPlayerNameAndID(iPlayerID)+ " has turned off the radio for vehicle + " + iVehicleID);
			} else {
				VehicleData[iVehicleID].iRadioID <- 1;
				playerMessageSuccess(iPlayerID, "You have turned on the radio for vehicle " + iVehicleID);			  
				szPassengerMessage = Colours.White + playerGetName(iPlayerID)+ " has turned on the radio";
				playerMessageAlert(iPlayerID, "You may need to get out of the vehicle and get back in to play the radio.");
				consoleMessage(getPlayerNameAndID(iPlayerID)+ " has turned on the radio for vehicle + " + iVehicleID);
			}
			
			for(local i = 0 ; i < 4 ; i++) {
				if(vehicleGetPlayerIDFromSeat(iVehicleID, i)!= -1) {
					playerToggleCityMusic(vehicleGetPlayerIDFromSeat(iVehicleID, i), VehicleData[iVehicleID].iRadioID);
					
					if(i != 0) {
						sendPlayerMessage(vehicleGetPlayerIDFromSeat(iVehicleID, i), szPassengerMessage);
					}
				}
			}			 
			break;
			
		case "setsiren":		
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/setsiren <vehicle id>");
				return 1;
			}
			
			local iVehicleID = szParams.tointeger();
			
			if(!vehicleExists(iVehicleID)) {
				playerMessageError(iPlayerID, "That vehicle ID does not exist"); 
				return 1;
			}
				
			if(vehicleGetSirenState(iVehicleID)) {
				vehicleToggleSiren(iVehicleID, 0);
				playerMessageSuccess(iPlayerID, "You have turned off the siren for vehicle " + iVehicleID);	 
				consoleMessage(getPlayerNameAndID(iPlayerID)+ " has turned off the siren for vehicle + " + iVehicleID);
			} else {
				vehicleToggleSiren(iVehicleID, 1);
				playerMessageSuccess(iPlayerID, "You have turned on the siren for vehicle " + iVehicleID);			  
				consoleMessage(getPlayerNameAndID(iPlayerID)+ " has turned on the siren for vehicle + " + iVehicleID);
			}
			break;
			
		case "setrentprice":
			local iVehicleID = playerInVehicleID(iPlayerID);
			if(iVehicleID == -1) {
				playerMessageError(iPlayerID, "You must be in a vehicle"); 
				return 1;
			}
			
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/setrentprice <amount>");
				return 1;
			}
			
			local iPrice = szParams.tointeger();
			
			if(iPrice < 1) {
				playerMessageError(iPlayerID, "The rent price must be at least $1"); 
				return 1;
			}
				
			VehicleData[iVehicleID].iRentPrice <- iPrice;
			playerMessageSuccess(iPlayerID, "You have set the rent price to $" + iPrice + " for vehicle " + iVehicleID);
			consoleMessage(getPlayerNameAndID(iPlayerID)+ " has set the rent price to $" + iPrice + " for vehicle " + iVehicleID);
			break;	 
			
		case "setroof":
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/setroof <vehicle id>");
				return 1;
			}
			
			local iVehicleID = szParams.tointeger();
			
			if(!vehicleExists(iVehicleID)) {
				playerMessageError(iPlayerID, "That vehicle ID does not exist"); 
				return 1;
			}
				  
			if(!vehicleGetRoofState(iVehicleID)) {
				vehicleToggleRoof(iVehicleID, 1);
				playerMessageSuccess(iPlayerID, "You have closed the roof for vehicle " + iVehicleID);	
				consoleMessage(getPlayerNameAndID(iPlayerID)+ " has closed the roof for vehicle + " + iVehicleID);					
			} else {
				vehicleToggleRoof(iVehicleID, 0);
				playerMessageSuccess(iPlayerID, "You have opened the roof for vehicle " + iVehicleID);	
				consoleMessage(getPlayerNameAndID(iPlayerID)+ " has opened the roof for vehicle + " + iVehicleID);				  
			}
			break;			   
  
			
		case "roof":
			local iVehicleID = playerInVehicleID(iPlayerID);
			if(iVehicleID == -1) {
				playerMessageError(iPlayerID, "You must be in a vehicle"); 
				return 1;
			}
			
			if(!vehicleGetRoofState(iVehicleID)) {
				vehicleToggleRoof(iVehicleID, 1);
				playerMessageSuccess(iPlayerID, "You have closed the roof for vehicle " + iVehicleID);	
				consoleMessage(getPlayerNameAndID(iPlayerID)+ " has closed the roof for vehicle + " + iVehicleID);					
			} else {
				vehicleToggleRoof(iVehicleID, 0);
				playerMessageSuccess(iPlayerID, "You have opened the roof for vehicle " + iVehicleID);	
				consoleMessage(getPlayerNameAndID(iPlayerID)+ " has opened the roof for vehicle + " + iVehicleID);				  
			}
			break;		 
			
		case "lights":
			local iVehicleID = playerInVehicleID(iPlayerID);
			if(iVehicleID == -1) {
				playerMessageError(iPlayerID, "You must be in a vehicle"); 
				return 1;
			}
			
			if(!vehicleGetLightState(iVehicleID)) {
				vehicleToggleLights(iVehicleID, 0);
				playerMessageSuccess(iPlayerID, "You have turned off the lights for vehicle " + iVehicleID);  
				consoleMessage(getPlayerNameAndID(iPlayerID)+ " has turned off the lights for vehicle + " + iVehicleID);				  
			} else {
				vehicleToggleLights(iVehicleID, 1);
				playerMessageSuccess(iPlayerID, "You have turned on the lights for vehicle " + iVehicleID);	 
				consoleMessage(getPlayerNameAndID(iPlayerID)+ " has turned on the lights for vehicle + " + iVehicleID);				   
			}
			break;				
			
		case "saveall":
			saveAllVehiclesToDatabase();
			saveAllPlayersToDatabase();
			saveAllPayPhonesToDatabase();
			playerMessageSuccess(iPlayerID, "All server data has been saved!");	 
			break;
			
		case "me":
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/me <action>");
				return 1;
			}
			
			playerAction(iPlayerID, szParams);
			break;
			
		case "admins":	  
			local tblAdmins = getOnlineAdmins();
			
			sendPlayerMessage(iPlayerID, Colours.Cyan + "=============== " + Colours.White + " ADMINS " + Colours.Cyan + " ===============");
			foreach(ii, iv in tblAdmins) {
				sendPlayerMessage(iPlayerID, Colours.White + " - " + Colours.Orange + iv.szPlayerName + Colours.Gray50 + "(" + iv.szStaffTitle + ")");
			}
			break; 
			
		case "l":
		case "local":
		case "talk":
		case "say":
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/local <message>");
				return 1;
			}
			
			playerTalk(iPlayerID, szParams);
			break; 
			
		case "s":
		case "shout":
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/shout <message>");
				return 1;
			}
			
			playerShout(iPlayerID, szParams);
			break; 
			
		case "commands":
		case "cmds":
		case "help":
			if(szParams.len() == 0) {
				sendPlayerMessage(iPlayerID, Colours.Cyan + "== HELP ===========================");
				sendPlayerMessage(iPlayerID, Colours.White + "Please enter /help <option> to see more information. Options are:");
				sendPlayerMessage(iPlayerID, Colours.White + "Vehicle, Account, Roleplay, Admin");
				return 1;
			}
			
			/*
				// STRINGS FOR MESSAGES:
				== HELP ===========================
				== VEHICLE HELP ===================
				== ACCOUNT HELP ===================
				== ROLEPLAY HELP ==================
				== ADMIN HELP =====================
				===================================
			*/
			
			switch(szParams.tolower()) {
				case "vehicle":
					sendPlayerMessage(iPlayerID, Colours.Cyan + "== VEHICLE HELP ===================");
					sendPlayerMessage(iPlayerID, Colours.Gray25 + "Some vehicles are rentable. More information will be given when entering one.");
					sendPlayerMessage(iPlayerID, Colours.White + "When entering a vehicle for sale, instructions will be given to you on how to buy it.");
					sendPlayerMessage(iPlayerID, Colours.Gray25 + "Don't forget to register your vehicle at the Department of Motor Vehicles building!");
					sendPlayerMessage(iPlayerID, Colours.White + "You will need a driver's license to legally drive a motor vehicle in Lost Heaven.");
					sendPlayerMessage(iPlayerID, Colours.Gray25 + "- Available commands: /siren, /roof, /radio, /engine, /lights, /lock, /lockdoor");
					//sendPlayerMessage(iPlayerID, Colours.Cyan + "===================================");
					break;
					
				case "account":
					sendPlayerMessage(iPlayerID, Colours.Cyan + "== ACCOUNT HELP ===================");
					sendPlayerMessage(iPlayerID, Colours.Gray25 + "- Available commands: /login /iplogin /registered");
					//sendPlayerMessage(iPlayerID, Colours.Cyan + "===================================");
					break;				  
					
				case "roleplay":
					sendPlayerMessage(iPlayerID, Colours.Cyan + "== ROLEPLAY HELP ==================");
					sendPlayerMessage(iPlayerID, Colours.Gray25 + "This server is built on a light RP standard.");
					sendPlayerMessage(iPlayerID, Colours.White + "Do not mix OOC and IC chats. Exceptions can be made for new players.");
					sendPlayerMessage(iPlayerID, Colours.Gray25 + "Please don't powergame. Powergaming is forcing somebody to RP or acting unnatural.");
					sendPlayerMessage(iPlayerID, Colours.White + "If you have any questions about roleplaying, please contact an admin. Use /admins.");
					sendPlayerMessage(iPlayerID, Colours.Gray25 + "- Available commands: /shout, /me, /b, /do");
					//sendPlayerMessage(iPlayerID, Colours.Cyan + "===================================");
					break; 
				case "admin":
					if(PlayerData[iPlayerID].iStaffFlags == 0) {
						playerMessageError(iPlayerID, "You cannot view this help section!");
						return 1;
					}
					
					sendPlayerMessage(iPlayerID, Colours.Cyan + "== ADMIN HELP =====================");
					sendPlayerMessage(iPlayerID, Colours.Gray25 + "- Coming soon!");
					//sendPlayerMessage(iPlayerID, Colours.Cyan + "===================================");
					break;					  
				
				default:
					playerMessageError(iPlayerID, "You entered an invalid help section name!");
					break;
			}
			break;
			
		case "call":	
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/call <number>");
				return 1;
			}
			
			local pPosition = playerGetPosition(iPlayerID);

			if(!isPositionAtPayPhone(pPosition[0], pPosition[1], pPosition[2])) {
				playerMessageError(iPlayerID, "You aren't near a phone!");
				return true;
			}
			
			local pPayPhone = getPayPhoneAtPosition(pPosition[0], pPosition[1], pPosition[2]);
			
			if(szParams.len() == 0) {
				playerCallNumber(iPlayerID, 0, pPayPhone);
			} else {
				playerCallNumber(iPlayerID, szParams.tointeger(), pPayPhone);
			}
			
			playerAction(iPlayerID, "picks up phone, and spins the rotary dialer around a few times.");
			playerMessageAlert(iPlayerID, "Calling " + szParams.tointeger());
			break;
			
		case "number":	
			local pPosition = playerGetPosition(iPlayerID);

			if(!isPositionAtPayPhone(pPosition[0], pPosition[1], pPosition[2])) {
				playerMessageError(iPlayerID, "You aren't near a phone!");
				return true;
			}
			
			local pPayPhone = getPayPhoneAtPosition(pPosition[0], pPosition[1], pPosition[2]);
			
			sendPlayerMessage(iPlayerID, Colours.White + "This payphone's number is " + pPayPhone.iCallNumber);
			break;			
			
		case "answer":			
			local pPosition = playerGetPosition(iPlayerID);

			if(!isPositionAtPayPhone(pPosition[0], pPosition[1], pPosition[2])) {
				playerMessageError(iPlayerID, "You aren't near a phone!");
				return true;
			}
			
			local pPayPhone = getPayPhoneAtPosition(pPosition[0], pPosition[1], pPosition[2]);
			
			if(!pPayPhone.iState == PayPhoneState.RingingIn) {
				playerMessageError(iPlayerID, "This phone isn't ringing!");
				return true;
			}
			
			playerAnswerPayPhone(iPlayerID, pPayPhone, pPayPhone.pOnCallWith);
			playerAction(iPlayerID, "picks up the ringing phone");
			playerMessageAlert(iPlayerID, "You answered the call. Use normal chat to talk on the phone.");
			playerMessageAlert(pPayPhone.pOnCallWith.iUsingID, "Somebody answered the phone. Use normal chat to talk to them.");			
			break;

		case "hangup":			
			local pMyPayPhone = PlayerData[iPlayerID].pUsingPayPhone;
			
			if(!pMyPayPhone) {
				playerMessageError(iPlayerID, "You aren't using a phone!");
				return true;			
			}
			
			if(!pMyPayPhone.iState == PayPhoneState.ActiveCall) {
				playerMessageError(iPlayerID, "This phone isn't on a call!");
				return true;
			}
			
			local pMyPayPhone = PlayerData[iPlayerID].pUsingPayPhone;
			local pOtherPayPhone = pMyPayPhone.pOnCallWith;
			local iOtherPersonID = pOtherPayPhone.iUsingID;
			
			playerHangupPayPhone(iPlayerID, pMyPayPhone, pOtherPayPhone);
			playerAction(iPlayerID, "hangs up the phone.");
			playerMessageAlert(iPlayerID, "The call has been disconnected.");
			playerAction(iOtherPersonID, "hangs up the phone.");
			playerMessageAlert(iOtherPersonID, "The other person hung up.");
			break;
			
		case "givephone":	
			if(szParams.len() == 0) {
				playerMessageSyntax(iPlayerID, "/givephone <player id>");
				return 1;
			}
			
			local iTargetID = szParams.tointeger();
			
			if(!playerIsConnected(iTargetID)) {
				playerMessageError(iPlayerID, "That player ID is not online"); 
				return 1;
			}			
		
			local pMyPayPhone = PlayerData[iPlayerID].pUsingPayPhone;
			
			if(!pMyPayPhone) {
				playerMessageError(iPlayerID, "You aren't using a phone!");
				return true;			
			}
			
			if(!pMyPayPhone.iState == PayPhoneState.ActiveCall) {
				playerMessageError(iPlayerID, "This phone isn't on a call!");
				return true;
			}
			
			local pMyPayPhone = PlayerData[iPlayerID].pUsingPayPhone;
			local pOtherPayPhone = pMyPayPhone.pOnCallWith;
			local iOtherPersonID = pOtherPayPhone.iUsingID;
			
			local pPosition = playerGetPosition(iPlayerID);
			local pTargetPosition = playerGetPosition(iTargetID);
			
			if(tgetDistance(pPosition[0], pPosition[2], pTargetPosition[0], pTargetPosition[2]) <= 2) {
				playerMessageError(iPlayerID, "You aren't near that person!");
				return true;
			}	
			
			playerGivePayPhone(iPlayerID, pMyPayPhone, pOtherPayPhone);
			playerAction(iPlayerID, "hands the phone to " + playerGetName(iTargetID));
			playerMessageAlert(iOtherPersonID, "You hear some noises as the phone is handed to another person");
			break;			
			
		case "rain":
			if(GlobalConfig.iRaining == 0) {
				showRainForAllPlayers();
				GlobalConfig.iRaining = 1;
			} else {
				hideRainForAllPlayers();
				GlobalConfig.iRaining = 0;			
			}
			break;
			
		default:
			playerMessageError(iPlayerID, "You entered an invalid command! Use /help for a list!");
			break;
	}
}

function getPosInFrontOfPos(fX, fY, fZ, fAngle, fDistance) {
	fAngle = degreesToRadians(fAngle);
	
	local fX2 =(fX +((cos(-fAngle +(PI / 2)))* fDistance));
	local fZ2 =(fZ +((sin(-fAngle +(PI / 2)))* fDistance));
	
	return[fX2, fY, fZ2];
}

function getPosBehindPos(fX, fY, fZ, fAngle, fDistance) {
	fAngle = degreesToRadians(fAngle);
	
	local fX2 =(fX +((cos(fAngle +(PI / 2)))* fDistance));
	local fZ2 =(fZ +((sin(fAngle +(PI / 2)))* fDistance));
	
	return[fX2, fY, fZ2];
}

function getPosInFrontOfPlayer(iPlayerID, fDistance) {
	local pos = playerGetPosition(iPlayerID);
	local rot = playerGetRotation(iPlayerID);
	
	return getPosInFrontOfPos(pos[0], pos[1], pos[2], rot, fDistance);
}

function getPosBehindPlayer(iPlayerID, fDistance) {
	local pos = playerGetPosition(iPlayerID);
	local rot = playerGetRotation(iPlayerID);
	
	return getPosBehindPos(pos[0], pos[1], pos[2], rot, fDistance);
}

function getPosAbovePos(fX, fY, fZ, fHeight = 0.0) {
	return[fX, fY-height, fZ];
}

function getPosBelowPos(fX, fY, fZ, fHeight = 0.0) {
	return[fX, fY-height, fZ];
}

function getPosAbovePlayer(iPlayerID, fDistance) {
	local pos = playerGetPosition(iPlayerID);
	local rot = playerGetRotation(iPlayerID);
	
	return getPosAbovePos(pos[0], pos[1], pos[2], fDistance);
}

function getPosBelowPlayer(iPlayerID, fDistance) {
	local pos = playerGetPosition(iPlayerID);
	local rot = playerGetRotation(iPlayerID);
	
	return getPosBelowPos(pos[0], pos[1], pos[2], fDistance);
}

function getOffsetFromPos(fX1, fY1, fZ1, fX2 = 0.0, fY2 = 0.0, fZ2 = 0.0) {
	return[fX1 + fX2, fY1 + fY2, fZ1 + fZ2];
}

function getCardinalDirectionText(iDirectionID) {	 
	return CardinalDirections[iDirectionID];
}

function getCardinalDirection(fX1, fZ1, fX2, fZ2) {
	local a = fX1 - fX2;
	local b = fZ1 - fZ2;
	local x = abs(a);
	local y = abs(b);
	
	local no = 0;
	local ne = 1;
	local ea = 2;
	local se = 3;
	local so = 4;
	local sw = 5;
	local we = 6;
	local nw = 7;
	local na = 8; // Unknown(not available)
	
	if(b < 0 && a < 0) {
		if(x <(y / 2)) {
			return no;
		} else if(y <(x / 2)) {
			return east;
		} else {
			return ne;
		}
	} else if(b < 0 && a >= 0) {
		if(x <(y / 2)) {
			return no;
		} else if(y <(x / 2)) {
			return we;
		} else {
			return nw;
		}
	} else if(b >= 0 && a >= 0) {
		if(x <(y / 2)) {
			return so;
		} else if(y <(x / 2)) {
			return w;
		} else {
			return sw;
		}
	} else if(b >= 0 && a < 0) {
		if(x <(y / 2)) {
			return s;
		} else if(y <(x / 2)) {
			return e;
		} else {
			return se;
		}
	} else {
		return na;
	}
}

function degreesToRadians(fDegrees) {
	return fDegrees *(PI / 180);
}

function radiansToDegrees(fRadians) {
	return fRadians *(180 / PI);
}

function isValidVehicleModelID(iModelID) {
	if(iModelID < 151) {
		return true;
	}
	
	return false;
}

function isValidSkinID(iSkinID) {
	if(iSkinID < 302) {
		return true;
	}
	
	return false;
}

function canPlayerUseCommand(iPlayerID, szCommand) {
	if(szCommand.tolower() == "login" || szCommand.tolower() == "register") {
		return true;
	}
	
	if(PlayerData[iPlayerID].bLoggedIn) {
		local szRequiredFlags = iniGetParam("data\\commandflags.ini", szCommand.tolower(), "None");
		
		if(szRequiredFlags == "None") {
			return true;
		}
		
		if(PlayerData[iPlayerID].iStaffFlags & StaffFlags[szRequiredFlags]) {
			return true;
		}
		
		if(PlayerData[iPlayerID].iStaffFlags == -1) {
			return true
		}
	}
	
	return false;
}

function doesPlayerHaveAdminFlag(iPlayerID, szFlagName) {
	if(PlayerData[iPlayerID].iStaffFlags & StaffFlags[szFlagName]) {
		return true;
	}
	
	if(PlayerData[iPlayerID].iStaffFlags == -1) {
		return true
	}
	
	return false;
}

function resetPlayerDataSlot(iPlayerID) {
	return true;
}

function playerMessageError(iPlayerID, szMessage) {
	sendPlayerMessage(iPlayerID, Colours.Red + "[ERROR]: " + Colours.White + szMessage + "!");
	
	return true;
}

function playerMessageSyntax(iPlayerID, szMessage) {
	sendPlayerMessage(iPlayerID, Colours.Gray25 + "[USAGE]: " + Colours.White + szMessage);
	
	return true;
}

function playerMessageAlert(iPlayerID, szMessage) {
	sendPlayerMessage(iPlayerID, Colours.Yellow + "[ALERT]: " + Colours.White + szMessage);
	
	return true;
}

function playerMessageSuccess(iPlayerID, szMessage) {
	sendPlayerMessage(iPlayerID, Colours.Lime + "[SUCCESS]: " + Colours.White + szMessage);
	
	return true;
}

function playerAction(iPlayerID, szAction) {
	local myPos = playerGetPosition(iPlayerID);
	local theirPos = false;
	
	foreach(ii, iv in onlinePlayers) {
		theirPos = playerGetPosition(iv);
		if(getDistance(myPos[0], myPos[2], theirPos[0], theirPos[2]) <= GlobalConfig.fActionDistance) {
			sendPlayerMessage(iPlayerID, Colours.Purple + playerGetName(iPlayerID)+ " " + szAction);
		}
	}
	
	//sendAllMessage(Colours.Purple + playerGetName(iPlayerID)+ " " + szAction);
}

function playerShout(iPlayerID, szMessage) {
	local myPos = playerGetPosition(iPlayerID);
	local theirPos = false;
	
	foreach(ii, iv in onlinePlayers) {
		theirPos = playerGetPosition(iv);
		if(getDistance(myPos[0], myPos[2], theirPos[0], theirPos[2]) <= GlobalConfig.fShoutDistance) {
			sendPlayerMessage(iPlayerID, Colours.White + playerGetName(iPlayerID)+ " shouts " + szMessage);
		}
	}
	
	//sendAllMessage(Colours.White + playerGetName(iPlayerID)+ " shouts: " + Colours.Gray25 + szMessage);
}

function playerTalk(iPlayerID, szMessage) {
	local myPos = playerGetPosition(iPlayerID);
	local theirPos = false;
	
	local iVehicleID = playerInVehicleID(iPlayerID);
	
	foreach(ii, iv in onlinePlayers) {
		if(iVehicleID != -1) {
			if(iVehicleID == playerInVehicleID(iv)) {
				sendPlayerMessage(iPlayerID, Colours.Gray25 + playerGetName(iPlayerID)+ " says " + szMessage);
			}
		} else {
			theirPos = playerGetPosition(iv);
			if(getDistance(myPos[0], myPos[2], theirPos[0], theirPos[2]) <= GlobalConfig.fTalkDistance) {
				sendPlayerMessage(iPlayerID, Colours.Gray25 + playerGetName(iPlayerID)+ " says " + szMessage);
			}
		}
	}
	
	//sendAllMessage(Colours.White + playerGetName(iPlayerID)+ " shouts: " + Colours.Gray25 + szMessage);
}

function playerPhoneTalk(iPlayerID, szMessage) {
	local myPos = playerGetPosition(iPlayerID);
	local theirPos = false;
	
	foreach(ii, iv in onlinePlayers) {
		theirPos = playerGetPosition(iv);
		if(getDistance(myPos[0], myPos[2], theirPos[0], theirPos[2]) <= GlobalConfig.fTalkDistance) {
			sendPlayerMessage(iv, Colours.Gray25 + playerGetName(iPlayerID)+ " says " + szMessage);
		}
	}
	
	sendPlayerMessage(PlayerData[iPlayerID].pUsingPayPhone.pOnCallWith.iUsingID, Colours.Gray25 + "(Phone): " + szMessage);
	
	//sendAllMessage(Colours.White + playerGetName(iPlayerID)+ " shouts: " + Colours.Gray25 + szMessage);
}

function getDistance(fX1, fY1, fX2, fY2) {
	return(sqrt(((fX2 - fX1)*(fX2 - fX1))+((fY2 - fY1)*(fY2 - fY1))));
}

function getAngleBetweenPos(fX1, fZ1, fX2, fZ2) {
	return atan2(fZ2 + fZ1, fX2 + fX1);
}

function isInArea(fPosX, fPosY, fX1, fX2, fY1, fY2) {
	if((fPosX >= fX1 && fPosX <= fX2)&&(fPosY >= fY1 && fPosY <= fY2)) {
		return true;
	} else {
		return true;
	}
}

function random(iMin, iMax) {
	srand(time());
	return((rand()%(iMax - iMin))+ iMin);
}

function compare(a, b) {
	if(a > b)return 1
	else if(a < b)return -1
	return 0;
}

function spawnAllCarsInLine(fX, fY, fZ, fRot) {
	local idx = 0;
	for(local i = 0 ; i < 169 ; i++) {
		idx++;
		local front = getPosInFrontOfPos(
			fX, 
			fY, 
			fZ, 
			fRot, 
			3 * idx
	   );
		
		vehicleSpawn(
			i, 
			front[0], 
			front[1], 
			front[2], 
			GlobalConfig.VehicleSpawn.fRotX, 
			GlobalConfig.VehicleSpawn.fRotY, 
			GlobalConfig.VehicleSpawn.fRotZ 
	   );	
	}
}

function getVehicleFreeDataSlot() {
	local iLastSlot = iniGetParam("data/indexlist.ini", "iVehicleDataID", "0");
	
	iLastSlot = iLastSlot.tointeger();
	iLastSlot = iLastSlot + 1;
	
	iniSetParam("data/indexlist.ini", "iVehicleDataID", iLastSlot.tostring());
	
	return iLastSlot;
}

function getPayPhoneFreeDataSlot() {
	local iLastSlot = iniGetParam("data/indexlist.ini", "iPayPhoneDataID", "0");
	
	iLastSlot = iLastSlot.tointeger();
	iLastSlot = iLastSlot + 1;
	
	iniSetParam("data/indexlist.ini", "iPayPhoneDataID", iLastSlot.tostring());
	
	return iLastSlot;
}

function getAccountFreeDataSlot() {
	local iLastSlot = iniGetParam("data/indexlist.ini", "iAccountDataID", "0");
	
	iLastSlot = iLastSlot.tointeger();
	iLastSlot = iLastSlot + 1;
	
	iniSetParam("data/indexlist.ini", "iAccountDataID", iLastSlot.tostring());
	
	return iLastSlot;
}

function getFactionFreeDataSlot() {
	local iLastSlot = iniGetParam("data/indexlist.ini", "iFactionDataID", "0");
	
	iLastSlot = iLastSlot.tointeger();
	iLastSlot = iLastSlot + 1;
	
	iniSetParam("data/indexlist.ini", "iFactionDataID", iLastSlot.tostring());
	
	return iLastSlot;
}

function addVehicleToDatabase(iVehicleID) {
	if(VehicleData[iVehicleID].iOwnerType == VehicleOwnerType.Temp) {
		return false;
	}
	local iVehicleDataID = getVehicleFreeDataSlot();
	
	VehicleDataID[iVehicleID]<- iVehicleDataID;
	iniCreateFile("data/vehicles/" + iVehicleDataID + ".ini");
	
	saveVehicleToDatabase(iVehicleID);
}

function addPayPhoneToDatabase(pPayPhone) {
	local iPayPhoneDataID = getPayPhoneFreeDataSlot();
	iniCreateFile("data/payphones/" + iPayPhoneDataID + ".ini");
	
	pPayPhone.iDataID = iPayPhoneDataID;
	
	savePayPhoneToDatabase(pPayPhone);
}

function removeVehicleFromDatabase(iVehicleID) {
	iniSetParam("data/vehicles/" + VehicleDataID[iVehicleID]+ ".ini", "bDeleted", "1");
}

function loadVehiclesFromDatabase() {
	local iVehicleCount = iniGetParam("data/indexlist.ini", "iVehicleDataID", "0");
	iVehicleCount = iVehicleCount.tointeger();
	
	for(local i = 1 ; i <= iVehicleCount ; i++) {
		if(iniFileExists("data/vehicles/" + i + ".ini")) {
			loadVehicleFromDatabase(i);
		}
	}	 
}

function loadPayPhonesFromDatabase() {
	local iPayPhoneCount = iniGetParam("data/indexlist.ini", "iPayPhoneDataID", "0");
	iPayPhoneCount = iPayPhoneCount.tointeger();
	
	for(local i = 1 ; i <= iPayPhoneCount ; i++) {
		if(iniFileExists("data/payphones/" + i + ".ini")) {
			loadPayPhoneFromDatabase(i);
		}
	}	 
}

function loadVehicleFromDatabase(iVehicleDataID) {
	local bDeleted = iniGetParam("data/vehicles/" + iVehicleDataID + ".ini", "bDeleted", "0"); 
	
	if(bDeleted.tointeger() == 0) {
		local iModelID	 = iniGetParam("data/vehicles/" + iVehicleDataID + ".ini", "iModelID", "0");
		local fSavedPosX = iniGetParam("data/vehicles/" + iVehicleDataID + ".ini", "fSavedPosX", "0.0");
		local fSavedPosY = iniGetParam("data/vehicles/" + iVehicleDataID + ".ini", "fSavedPosY", "0.0");
		local fSavedPosZ = iniGetParam("data/vehicles/" + iVehicleDataID + ".ini", "fSavedPosZ", "0.0");
		local fSavedRotX = iniGetParam("data/vehicles/" + iVehicleDataID + ".ini", "fSavedRotX", "0.0");
		local fSavedRotY = iniGetParam("data/vehicles/" + iVehicleDataID + ".ini", "fSavedRotY", "0.0");
		local fSavedRotZ = iniGetParam("data/vehicles/" + iVehicleDataID + ".ini", "fSavedRotZ", "0.0");
		local iOwnerID	 = iniGetParam("data/vehicles/" + iVehicleDataID + ".ini", "iOwnerID", "0");
		local iOwnerType = iniGetParam("data/vehicles/" + iVehicleDataID + ".ini", "iOwnerType", "0");	 
		local iBuyPrice	 = iniGetParam("data/vehicles/" + iVehicleDataID + ".ini", "iBuyPrice", "0");
		local iRentPrice = iniGetParam("data/vehicles/" + iVehicleDataID + ".ini", "iRentPrice", "0");	  
		local iRadioID	 = iniGetParam("data/vehicles/" + iVehicleDataID + ".ini", "iRadioID", "0");	
		local bSavedPosLock = iniGetParam("data/vehicles/" + iVehicleDataID + ".ini", "bSavedPosLock", "0");  
		local iDMVRegistrationID = iniGetParam("data/vehicles/" + iVehicleDataID + ".ini", "iDMVRegistrationID", "0");	
		
		local iVehicleID = vehicleSpawn(iModelID.tointeger(), fSavedPosX.tofloat(), fSavedPosY.tofloat(), fSavedPosZ.tofloat(), fSavedRotX.tofloat(), fSavedRotY.tofloat(), fSavedRotZ.tofloat());
		VehicleData[iVehicleID]<- { };	 
		VehicleDataID[iVehicleID]<- iVehicleDataID;
		VehicleData[iVehicleID].iModelID <- iModelID.tointeger();
		VehicleData[iVehicleID].iOwnerID <- iOwnerID.tointeger();
		VehicleData[iVehicleID].iOwnerType <- iOwnerType.tointeger();
		VehicleData[iVehicleID].iBuyPrice <- iBuyPrice.tointeger();
		VehicleData[iVehicleID].iRentPrice <- iRentPrice.tointeger();	 
		VehicleData[iVehicleID].iRadioID <- iRadioID.tointeger(); 
		VehicleData[iVehicleID].bSavedPosLock <- bSavedPosLock;
		VehicleData[iVehicleID].iDMVRegistrationID <- iDMVRegistrationID.tointeger();
	}
}

function loadPayPhoneFromDatabase(iPayPhoneDataID) {
	local bDeleted = iniGetParam("data/payphones/" + iPayPhoneDataID + ".ini", "bDeleted", "0"); 
	
	if(bDeleted.tointeger() == 0) {
		local iCallNumber  = iniGetParam("data/payphones/" + iPayPhoneDataID + ".ini", "iCallNumber", "0");
		local fPositionX = iniGetParam("data/payphones/" + iPayPhoneDataID + ".ini", "fPositionX", "0.0");
		local fPositionY = iniGetParam("data/payphones/" + iPayPhoneDataID + ".ini", "fPositionY", "0.0");
		local fPositionZ = iniGetParam("data/payphones/" + iPayPhoneDataID + ".ini", "fPositionZ", "0.0");
		//local bDeleted = iniGetParam("data/payphones/" + iPayPhoneDataID + ".ini", "bDeleted", "0");
		local bDisabled = iniGetParam("data/payphones/" + iPayPhoneDataID + ".ini", "bDisabled", "0");
		local bBroken = iniGetParam("data/payphones/" + iPayPhoneDataID + ".ini", "bBroken", "0");	
		
		print(fPositionX.tofloat());		
		
		local pPayPhone = PayPhone(fPositionX.tofloat(), fPositionY.tofloat(), fPositionZ.tofloat());
		
		pPayPhone.iCallNumber = iCallNumber.tointeger();
		pPayPhone.bBroken = bBroken.tointeger();
		pPayPhone.bDeleted = bDeleted.tointeger();
		pPayPhone.bDisabled = bDisabled.tointeger();
		PayPhones.push(pPayPhone);
	}
}

function saveAllVehiclesToDatabase() {
	for(local i = 0 ; i < GlobalConfig.iMaxVehicles ; i++) {
		if(vehicleExists(i)) {
			if(VehicleDataID[i]!= -1) {
				saveVehicleToDatabase(i);
			} else {
				addVehicleToDatabase(i);
			}
		}
	}
}

function saveVehicleToDatabase(iVehicleID) {
	local pos = vehicleGetPosition(iVehicleID);
	local rot = vehicleGetRotation(iVehicleID);
	
	local iVehicleDataID = VehicleDataID[iVehicleID];
	
	iniSetParam("data/vehicles/" + iVehicleDataID + ".ini", "iModelID", VehicleData[iVehicleID].iModelID.tostring());
	
	if(VehicleData[iVehicleID].bSavedPosLock == 0) {
		iniSetParam("data/vehicles/" + iVehicleDataID + ".ini", "fSavedPosX", pos[0].tostring());
		iniSetParam("data/vehicles/" + iVehicleDataID + ".ini", "fSavedPosY", pos[1].tostring());
		iniSetParam("data/vehicles/" + iVehicleDataID + ".ini", "fSavedPosZ", pos[2].tostring());
		iniSetParam("data/vehicles/" + iVehicleDataID + ".ini", "fSavedRotX", rot[0].tostring());
		iniSetParam("data/vehicles/" + iVehicleDataID + ".ini", "fSavedRotY", rot[1].tostring());
		iniSetParam("data/vehicles/" + iVehicleDataID + ".ini", "fSavedRotZ", rot[2].tostring());	 
	}
	
	iniSetParam("data/vehicles/" + iVehicleDataID + ".ini", "iOwnerType", VehicleData[iVehicleID].iOwnerType.tostring());	
	iniSetParam("data/vehicles/" + iVehicleDataID + ".ini", "iOwnerID", VehicleData[iVehicleID].iOwnerID.tostring());	 
	iniSetParam("data/vehicles/" + iVehicleDataID + ".ini", "bLocked", "0");
	iniSetParam("data/vehicles/" + iVehicleDataID + ".ini", "iRentPrice", VehicleData[iVehicleID].iRentPrice.tostring());
	iniSetParam("data/vehicles/" + iVehicleDataID + ".ini", "iBuyPrice", VehicleData[iVehicleID].iBuyPrice.tostring());	   
	iniSetParam("data/vehicles/" + iVehicleDataID + ".ini", "bSavedPosLock", VehicleData[iVehicleID].bSavedPosLock.tostring());
	iniSetParam("data/vehicles/" + iVehicleDataID + ".ini", "iDMVRegistrationID", VehicleData[iVehicleID].iDMVRegistrationID.tostring());
	
}


function savePayPhoneToDatabase(pPayPhone) {
	
	iniSetParam("data/payphones/" + pPayPhone.iDataID + ".ini", "iCallNumber", pPayPhone.iCallNumber.tostring());	
	iniSetParam("data/payphones/" + pPayPhone.iDataID + ".ini", "fPositionX", pPayPhone.fPositionX.tostring());	   
	iniSetParam("data/payphones/" + pPayPhone.iDataID + ".ini", "fPositionY", pPayPhone.fPositionY.tostring());
	iniSetParam("data/payphones/" + pPayPhone.iDataID + ".ini", "fPositionZ", pPayPhone.fPositionZ.tostring());
	iniSetParam("data/payphones/" + pPayPhone.iDataID + ".ini", "iPricePerMinute", pPayPhone.iPricePerMinute.tostring());	 
	
}

function addPlayerToDatabase(iPlayerID) {
	local iAccountID = getAccountFreeDataSlot();
	
	iniCreateFile("data/accounts/" + iAccountID + ".ini");
	
	PlayerData[iPlayerID].iAccountID <- iAccountID;
	
	iniSetParam("data/accountlist.ini", getDataSafeName(playerGetName(iPlayerID)), iAccountID.tostring());
	
	savePlayerToDatabase(iPlayerID);
	
	iniSetParam("data/accounts/" + iAccountID + ".ini", "iRegisteredUnixTS", time().tostring());
	iniSetParam("data/accounts/" + iAccountID + ".ini", "fSavedPosX", GlobalConfig.NewCharacter.fSpawnX.tostring());
	iniSetParam("data/accounts/" + iAccountID + ".ini", "fSavedPosY", GlobalConfig.NewCharacter.fSpawnY.tostring());
	iniSetParam("data/accounts/" + iAccountID + ".ini", "fSavedPosZ", GlobalConfig.NewCharacter.fSpawnZ.tostring());	
	iniSetParam("data/accounts/" + iAccountID + ".ini", "fSavedRotA", "0.0");
	
	savePlayerToDatabase(iPlayerID);
}

function savePlayerToDatabase(iPlayerID) {
	// Make sure the player is logged in.
	if(!PlayerData[iPlayerID].bLoggedIn) {
		return false;
	}
	// Make sure the player is spawned before saving their position
	// Use "bSpawned" because it only sets to true on position restore(5 seconds after spawning)
	// This way, we know they actually spawned and has their restored position set
	if(PlayerData[iPlayerID].bSpawned) {
		local pos = playerGetPosition(iPlayerID);
		local rot = playerGetRotation(iPlayerID);
		
		iniSetParam("data/accounts/" + PlayerData[iPlayerID].iAccountID + ".ini", "fSavedPosX", pos[0].tostring());
		iniSetParam("data/accounts/" + PlayerData[iPlayerID].iAccountID + ".ini", "fSavedPosY", pos[1].tostring());
		iniSetParam("data/accounts/" + PlayerData[iPlayerID].iAccountID + ".ini", "fSavedPosZ", pos[2].tostring());	   
		iniSetParam("data/accounts/" + PlayerData[iPlayerID].iAccountID + ".ini", "fSavedRotA", rot.tostring());		   
	}
	
	iniSetParam("data/accounts/" + PlayerData[iPlayerID].iAccountID + ".ini", "szPlayerName", playerGetName(iPlayerID));
	iniSetParam("data/accounts/" + PlayerData[iPlayerID].iAccountID + ".ini", "szPassword", PlayerData[iPlayerID].szPassword); 
	iniSetParam("data/accounts/" + PlayerData[iPlayerID].iAccountID + ".ini", "iStaffFlags", PlayerData[iPlayerID].iStaffFlags.tostring());
	iniSetParam("data/accounts/" + PlayerData[iPlayerID].iAccountID + ".ini", "szLastIP", playerGetIP(iPlayerID));
	iniSetParam("data/accounts/" + PlayerData[iPlayerID].iAccountID + ".ini", "iSkinID", playerGetSkinID(iPlayerID).tostring());
	iniSetParam("data/accounts/" + PlayerData[iPlayerID].iAccountID + ".ini", "iMoney", playerGetMoney(iPlayerID).tostring());
	iniSetParam("data/accounts/" + PlayerData[iPlayerID].iAccountID + ".ini", "iFactionID", PlayerData[iPlayerID].iFactionID.tostring());
	iniSetParam("data/accounts/" + PlayerData[iPlayerID].iAccountID + ".ini", "iAccountSettings", PlayerData[iPlayerID].iAccountSettings.tostring());
	iniSetParam("data/accounts/" + PlayerData[iPlayerID].iAccountID + ".ini", "iGameSettings", PlayerData[iPlayerID].iGameSettings.tostring());
	iniSetParam("data/accounts/" + PlayerData[iPlayerID].iAccountID + ".ini", "fFieldOfView", PlayerData[iPlayerID].fFOV.tostring());
	return true;
}

function isPlayerRegistered(iPlayerID) {
	local iAccountID = iniGetParam("data/accountlist.ini", getDataSafeName(playerGetName(iPlayerID)), "-1");
	
	iAccountID = iAccountID.tointeger();
	
	if(!iAccountID) {
		return false;
	}
	
	if(iAccountID == -1) {
		return false;
	}
	
	if(!iniFileExists("data/accounts/" + iAccountID + ".ini")) {
		return false;
	}
	
	return true;
}

function loadPlayerFromDatabase(iPlayerID) {
	local iAccountID = iniGetParam("data/accountlist.ini", getDataSafeName(playerGetName(iPlayerID)), "-1");
	
	if(!iAccountID) {
		return false;
	}
	
	iAccountID = iAccountID.tointeger();
	
	if(iAccountID == -1) {
		return false;
	}
	
	if(!iniFileExists("data/accounts/" + iAccountID + ".ini")) {
		return false;
	}
	
	PlayerData[iPlayerID].iAccountID <- iAccountID;
	
	local fPosX = iniGetParam("data/accounts/" + iAccountID + ".ini", "fSavedPosX", GlobalConfig.NewCharacter.fSpawnX.tostring());
	local fPosY = iniGetParam("data/accounts/" + iAccountID + ".ini", "fSavedPosY", GlobalConfig.NewCharacter.fSpawnY.tostring());
	local fPosZ = iniGetParam("data/accounts/" + iAccountID + ".ini", "fSavedPosZ", GlobalConfig.NewCharacter.fSpawnZ.tostring());
	local fRotA = iniGetParam("data/accounts/" + iAccountID + ".ini", "fSavedRotA", "0.0");
	local iStaffFlags = iniGetParam("data/accounts/" + iAccountID + ".ini", "iStaffFlags", "0");
	local szLastIP = iniGetParam("data/accounts/" + iAccountID + ".ini", "szLastIP", "unknown");
	local iLastOnlineUnixTS = iniGetParam("data/accounts/" + iAccountID + ".ini", "iLastOnlineUnixTS", "-1");
	local iRegisterUnixTS = iniGetParam("data/accounts/" + iAccountID + ".ini", "iRegisteredUnixTS", "-1");
	local szPassword = iniGetParam("data/accounts/" + iAccountID + ".ini", "szPassword", "unknown");
	local iMoney = iniGetParam("data/accounts/" + iAccountID + ".ini", "iMoney", "0");
	local iSkinID = iniGetParam("data/accounts/" + iAccountID + ".ini", "iSkinID", "0");
	local iAccountSettings = iniGetParam("data/accounts/" + iAccountID + ".ini", "iAccountSettings", "0");
	local iGameSettings = iniGetParam("data/accounts/" + iAccountID + ".ini", "iGameSettings", "0");
	local iPublicJob = iniGetParam("data/accounts/" + iAccountID + ".ini", "iPublicJob", "0");
	local fFOV = iniGetParam("data/accounts/" + iAccountID + ".ini", "fFieldOfView", "90.0");
	
	fPosX = fPosX.tofloat();
	fPosY = fPosY.tofloat();
	fPosZ = fPosZ.tofloat();
	fRotA = fRotA.tofloat();
	iStaffFlags = iStaffFlags.tointeger();
	szLastIP = szLastIP.tostring();
	iLastOnlineUnixTS = iLastOnlineUnixTS.tointeger();
	iRegisterUnixTS = iRegisterUnixTS.tointeger();
	szPassword = szPassword.tostring();
	iMoney = iMoney.tointeger();
	iSkinID = iSkinID.tointeger();
	iAccountSettings = iAccountSettings.tointeger();
	iGameSettings = iGameSettings.tointeger();
	iPublicJob = iPublicJob.tointeger();
	fFOV = fFOV.tofloat();
	
	PlayerData[iPlayerID].iStaffFlags <- iStaffFlags
	PlayerData[iPlayerID].szLastIP <- szLastIP;
	PlayerData[iPlayerID].szPassword <- szPassword;
	PlayerData[iPlayerID].iSkinID <- iSkinID;
	PlayerData[iPlayerID].SavedX <- fPosX;
	PlayerData[iPlayerID].SavedY <- fPosY;
	PlayerData[iPlayerID].SavedZ <- fPosZ;
	PlayerData[iPlayerID].SavedPos <-[fPosX, fPosY, fPosZ];
	PlayerData[iPlayerID].iMoney <- iMoney;
	PlayerData[iPlayerID].SavedRot <- fRotA;
	PlayerData[iPlayerID].iLastOnlineUnixTS <- iLastOnlineUnixTS;
	PlayerData[iPlayerID].iRegisterUnixTS <- iLastOnlineUnixTS;
	PlayerData[iPlayerID].iAccountSettings <- iAccountSettings;
	PlayerData[iPlayerID].iGameSettings <- iGameSettings;
	PlayerData[iPlayerID].iPublicJob <- iPublicJob;
	PlayerData[iPlayerID].fFOV <- fFOV;
	return true;
}

function saveAllPlayersToDatabase() {
	for(local i = 0 ; i < serverGetMaxPlayers(); i++) {
		if(playerIsConnected(i)) {
			if(!iniFileExists("data/accounts/" + PlayerData[i].iAccountID + ".ini")) {
				addPlayerToDatabase(i);
			}
			
			savePlayerToDatabase(i);
		}
	}
}

function saveAllPayPhonesToDatabase() {
	foreach(ii, iv in PayPhones) {
		if(iv.iDataID == -1) {
			addPayPhoneToDatabase(iv);
		} else {
			savePayPhoneToDatabase(iv);
		}
	}
}

function createBitwiseTable(tablekeys) {
	local temp_bitval = 0;
	local temp_bittable = { };
	foreach(ii, iv in tablekeys) {
		temp_bittable[iv]<- temp_bitval;
		temp_bitval = 1 << temp_bitval;
	}
	return temp_bittable;
}

function playerRestoreSavedPosition(iPlayerID) {
	//playerSetPosition(iPlayerID, PlayerData[iPlayerID].SavedX, PlayerData[iPlayerID].SavedY, PlayerData[iPlayerID].SavedZ);
}

function playerRestoreSavedRotation(iPlayerID) {
	//playerSetRotation(iPlayerID, PlayerData[iPlayerID].SavedRot);
}

function playerRestoreSavedMoney(iPlayerID) {
	playerSetMoney(iPlayerID, PlayerData[iPlayerID].iMoney);
	playerEnableMoney(iPlayerID, PlayerData[iPlayerID].iMoney);
}

function playerRestoreSavedSkin(iPlayerID) {
	playerChangeSkin(iPlayerID, PlayerData[iPlayerID].iSkinID);
}

function playerRestoreSavedWeapons(iPlayerID) {
	
}

function loginSuccess(iPlayerID) {
	PlayerData[iPlayerID].bLoggedIn <- true;
	//playerRestoreSavedPosition(iPlayerID);
	//playerRestoreSavedRotation(iPlayerID);
	//playerRestoreSavedSkin(iPlayerID);
	//playerRestoreSavedWeapons(iPlayerID);
	//playerRestoreSavedMoney(iPlayerID);
	
	playerLockControls(iPlayerID, 1);	
	PlayerData[iPlayerID].iSpawnWaitTick <- iServerSecondTicks;
}

function checkSpawnRestoreCooldown() {
	for(local i = 0 ; i < serverGetMaxPlayers(); i++) {
		if(playerIsConnected(i)) {
			if(PlayerData[i].bLoggedIn) {
				if(!PlayerData[i].bSpawned) {
					checkPlayerSpawnRestoreCooldown(i);
				}
			}
		}
	}
}

function checkPlayerSpawnRestoreCooldown(iPlayerID) {
	local iSecondsLeft = abs((PlayerData[iPlayerID].iSpawnWaitTick + (GlobalConfig.iSpawnTickWait)) - iServerSecondTicks);
	
	if(iSecondsLeft > 0) {
		playerSetObjective(iPlayerID, "Your stats will be restored in " + getSecondsText(iSecondsLeft));
		playerClearObjective(iPlayerID);
		return 1;
	}
	
	playerClearObjective(iPlayerID);
	
	if(PlayerData[iPlayerID].bNewlyRegistered) {
		playerSetPosition(iPlayerID, GlobalConfig.NewCharacter.fSpawnX, GlobalConfig.NewCharacter.fSpawnY ,GlobalConfig.NewCharacter.fSpawnZ);
		playerSetCameraFov(iPlayerID, PlayerData[iPlayerID].fFOV);
		savePlayerToDatabase(iPlayerID);
	} else {
		playerRestoreSavedPosition(iPlayerID);
		playerRestoreSavedRotation(iPlayerID);
		playerRestoreSavedSkin(iPlayerID);
		playerRestoreSavedWeapons(iPlayerID);
		playerRestoreSavedMoney(iPlayerID); 
		playerSetCameraFov(iPlayerID, PlayerData[iPlayerID].fFOV);
	}
	
	playerLockControls(iPlayerID, 0);
	PlayerData[iPlayerID].iSpawnWaitTick <- 0;
	PlayerData[iPlayerID].bSpawned <- true;
	if(GlobalConfig.bRaining) {
		showRainForPlayer(iPlayerID);
	}
}

function getSecondsText(iSeconds) {
	if(iSeconds == 1) {
		return "1 second";
	}
	
	return iSeconds + " seconds";
}

function checkServerSaveCooldown() {
	if((iServerSecondTicks - iLastServerSaveTick) >= GlobalConfig.iServerSaveInterval) {
		saveAllServerData();
		iLastServerSaveTick <- iServerSecondTicks;
	}
}

function saveAllServerData() {
	saveAllVehiclesToDatabase();
	saveAllPlayersToDatabase();
}

function createPlayerDataSlot(iPlayerID) {
	PlayerData[iPlayerID]<- { };
	PlayerData[iPlayerID].iAccountID <- -1;
	PlayerData[iPlayerID].Characters <- { };
	PlayerData[iPlayerID].CurrentCharacter <- { };
	PlayerData[iPlayerID].bSpawned <- false;
	PlayerData[iPlayerID].bMuted <- false;
	PlayerData[iPlayerID].iRadioID <- 0;
	PlayerData[iPlayerID].iStaffFlags <- StaffFlags.None;
	PlayerData[iPlayerID].iSkinID <- 0;
	PlayerData[iPlayerID].iMoney <- 0;
	PlayerData[iPlayerID].SavedPos <-[0.0, 5.0, 0.0];
	PlayerData[iPlayerID].SavedRot <- 0.0;
	PlayerData[iPlayerID].szPassword <- "test";
	PlayerData[iPlayerID].bLoggedIn <- false;
	PlayerData[iPlayerID].iSpawnWaitTick <- 0;
	PlayerData[iPlayerID].iFactionID <- 0;
	PlayerData[iPlayerID].iVehRentStart <- 0;
	PlayerData[iPlayerID].szLastIP <- "0.0.0.0";
	PlayerData[iPlayerID].iAccountSettings <- AccountSettings.None;
	PlayerData[iPlayerID].iGameSettings <- GameSettings.None;
	PlayerData[iPlayerID].bIsDead <- false;
	PlayerData[iPlayerID].bNewlyRegistered <- false;
	
	PlayerData[iPlayerID].pUsingPayPhone <- false;
}

function deletePlayerDataSlot(iPlayerID) {
	PlayerData[iPlayerID]<- null;
}

function consoleMessage(szMessage) {
	print(szMessage);
}

function getPlayerNameAndID(iPlayerID) {
	return "Player " + playerGetName(iPlayerID)+ "[" + iPlayerID + "]";
}

function getOnlineAdmins() {
	local temp_admins = { };
	
	for(local i = 0 ; i < serverGetMaxPlayers(); i++) {
		if(playerIsConnected(i)) {
			if(PlayerData[i].iStaffFlags != 0) {
				if(PlayerData[i].bLoggedIn) {
					temp_admins[i]<-  { };
					temp_admins[i].szPlayerName <- playerGetName(i);
					temp_admins[i].szStaffTitle <- iniGetParam("data/stafftitles.ini", getDataSafeName(playerGetName(i)), "Unknown");
				}
			}
		}
	}
	
	return temp_admins;
}

function doesIPMatch(szIP1, szIP2) {
	if(szIP1 == szIP2) {
		return true;
	}
	
	return false;
}

function loadGlobalConfig() {
	GlobalConfig.fVehicleSpawnDistance <- iniGetParam("data/globalconfig.ini", "fVehicleSpawnDistance", "5.0").tofloat();
	GlobalConfig.fVehicleTrunkDistance <- iniGetParam("data/globalconfig.ini", "fVehicleTrunkDistance", "3.0").tofloat();
	GlobalConfig.NewCharacter.iAccountSettings <- iniGetParam("data/globalconfig.ini", "iDefaultAccountSettings", "0").tointeger();
	GlobalConfig.NewCharacter.iStaffFlags <- iniGetParam("data/globalconfig.ini", "iDefaultStaffFlags", "0").tointeger();
	GlobalConfig.NewCharacter.fFOV <- iniGetParam("data/globalconfig.ini", "fDefaultFieldOfView", "90.0").tofloat();
	GlobalConfig.NewCharacter.iGameSettings <- iniGetParam("data/globalconfig.ini", "iDefaultGameSettings", "0").tointeger();
	GlobalConfig.szServerName <- iniGetParam("data/globalconfig.ini", "szServerName", "Unknown").tostring();
	GlobalConfig.bRaining <- iniGetParam("data/globalconfig.ini", "bRaining", "0").tointeger();
	GlobalConfig.bNight <- iniGetParam("data/globalconfig.ini", "bNight", "0").tointeger();
}

function resyncIndexIniFile() {
	return true;
}

function getDataSafeName(szNormalName) {
	local szSplitName = split(szNormalName, " ");
	local szSafeName = "";
	
	if(szSplitName.len() > 1) {
		foreach(ii, iv in szSplitName) {
			if(szSafeName.len() == 0) {
				szSafeName = iv;
			} else {
				szSafeName = szSafeName + "_" + iv;
			}
		} 
		return szSafeName;
	}
	
	return szNormalName;
}

function showRainForAllPlayers() {
	foreach(ii, iv in onlinePlayers) {
		showRainForPlayer(ii);
	}
	return true;
}

function hideRainForAllPlayers() {
	foreach(ii, iv in onlinePlayers) {
		hideRainForPlayer(ii);
	}
	return true;
}

function showRainForPlayer(iPlayerID) {
	playerSetWeatherParam(iPlayerID, "ON", 1);
	return true;
}

function hideRainForPlayer(iPlayerID) {
	playerSetWeatherParam(iPlayerID, "ON", 0);
	return true;
}
class PayPhone {
	iDataID = -1;
	fPositionX = 0.0;
	fPositionY = 0.0;
	fPositionZ = 0.0;
	
	iCallNumber = 00000;
	iPricePerMinute = 0;
	bDeleted = 0;
	bDisabled = 0;
	bBroken = 0;
	
	bRinging = 0;
	bActiveCall = 0;
	iPlayerOnPhone = 0;
	
	iState = 1;
	iUsingID = -1;
	pOnCallWith = false;
	
	constructor(x, y, z) {
		fPositionX = x;
		fPositionY = y;
		fPositionZ = z;
	
		local szCallString = "1" + ::PayPhones.len()+ "01";
		iCallNumber = szCallString.tointeger();
	}
}

function playerCallNumber(iPlayerID, iCallingNumber, pCallingFrom) {
	local pPayPhone = getPayPhoneByCallNumber(iCallingNumber);
	if(pPayPhone) {
		pCallingFrom.iUsingID = iPlayerID;
		pCallingFrom.iState = PayPhoneState.RingingOut;
		//pPayPhone.iState = PayPhoneState.RingingIn;
		pCallingFrom.pOnCallWith = pPayPhone;
		pPayPhone.pOnCallWith = pCallingFrom;
		PlayerData[iPlayerID].pUsingPayPhone <- pCallingFrom;
		ringPayPhone(pPayPhone);
	} else {
		playerMessageAlert(iPlayerID, Colours.Gray25 + "(Operator): The number you have dialed does not exist.")
		pCallingFrom.iState = PayPhoneState.Idle;
		pCallingFrom.pOnCallWith = false;
		pCallingFrom.iUsingID = -1;
		PlayerData[iPlayerID].pUsingPayPhone <- false;
	}
	return true;
}

function getPayPhoneAtPosition(fX, fY, fZ) {
	foreach(ii, iv in PayPhones) {
		if(getDistance(fX, fZ, iv.fPositionX, iv.fPositionZ) < 1.0) {
			return iv;
		}
	}
	return false;
}

function getPayPhoneByCallNumber(iCallNumber) {
	foreach(ii, iv in PayPhones) {
		if(iv.iCallNumber == iCallNumber) {
			return iv;
		}
	}
	return false;
}


function isPositionAtPayPhone(fX, fY, fZ) {
	foreach(ii, iv in PayPhones) {
		if(getDistance(fX, fZ, iv.fPositionX, iv.fPositionZ) < 1.0) {
			return true;
		}
	}
	return false;
}

function ringPayPhone(pPayPhone) {
	pPayPhone.iState = PayPhoneState.RingingIn;
	RingingPayPhones.push(pPayPhone);
}

function checkRingingPayPhones() {
	foreach(ii,iv in RingingPayPhones) {
		if(iv.iState == PayPhoneState.RingingIn) {
			if((iServerSecondTicks - iLastPayPhoneRing) >= 4) {
				playSoundForPlayersInArea("sounds\\phone2.wav", iv.fPositionX, iv.fPositionZ, 15.0);
				iLastPayPhoneRing = iServerSecondTicks;
			}
		} else {
			RingingPayPhones.remove(ii);
		}
	}
}

function checkPayPhoneCallers() {
	local pMyPayPhone = false;
	local pOtherPayPhone = false;
	local pPosition = false;
	local iOtherPersonID;
	
	if(onlinePlayers.len() > 0) {
		foreach(ii,iv in onlinePlayers) {
			if(PlayerData[iv].bSpawned) {
				pMyPayPhone = PlayerData[iv].pUsingPayPhone;
				if(pMyPayPhone != false) {
					pOtherPayPhone = pMyPayPhone.pOnCallWith;
					if(pMyPayPhone.iState == PayPhoneState.ActiveCall) {
						if(pOtherPayPhone.iState == PayPhoneState.ActiveCall) {
							pPosition = playerGetPosition(iv);
							if(getDistance(pPosition[0], pPosition[2], pMyPayPhone.fPositionX, pMyPayPhone.fPositionZ) >= 3) {
								iOtherPersonID = pOtherPayPhone.iUsingID;
								playerAction(iv, "hangs up the phone.");
								playerMessageAlert(iv, "The call has been disconnected.");
								playerAction(iOtherPersonID, "hangs up the phone.");
								playerMessageAlert(iOtherPersonID, "The other person hung up.");							
								playerHangupPayPhone(iv, pMyPayPhone, pOtherPayPhone);
							}
						}
					}
				}
			}
		}
	}	
}

function playSoundForPlayersInArea(szSoundName, fPositionX, fPositionZ, fDistance) {
	local theirPos;
	foreach(ii,iv in onlinePlayers) {
		theirPos = playerGetPosition(iv);
		if(getDistance(theirPos[0], theirPos[2], fPositionX, fPositionZ) <= fDistance) {
			playerPlaySound(iv, szSoundName);
		}
	}
}

function playerAnswerPayPhone(iPlayerID, pPayPhone, pCallerPhone) {
	pPayPhone.iState = PayPhoneState.ActiveCall;
	pCallerPhone.iState = PayPhoneState.ActiveCall;
	
	pPayPhone.iUsingID = iPlayerID;
	
	PlayerData[iPlayerID].pUsingPayPhone <- pPayPhone;
	
	foreach(ii,iv in RingingPayPhones) {
		if(iv.iCallNumber == pPayPhone.iCallNumber) {
			RingingPayPhones.remove(ii);
		}
	}
}

function playerHangupPayPhone(iPlayerID, pPayPhone, pCallerPhone) {

	pPayPhone.iState = PayPhoneState.Idle;
	pCallerPhone.iState = PayPhoneState.Idle;
	
	PlayerData[iPlayerID].pUsingPayPhone <- false;
	PlayerData[pCallerPhone.iUsingID].pUsingPayPhone <- false;
	
	pPayPhone.iUsingID = -1;
	pCallerPhone.iUsingID = -1;
}

function playerGivePayPhone(iPlayerID, iTargetID, pPayPhone) {
	pPayPhone.iUsingID = iTargetID;
	
	PlayerData[iPlayerID].pUsingPayPhone <- false;
	PlayerData[iTargetID].pUsingPayPhone <- pPayPhone;
}