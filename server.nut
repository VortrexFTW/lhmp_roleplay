// ================================================
// == Reckless Gaming RP
// == Created By: VortrexFTW
// == Started On: December 31st 2015
// ================================================

function onServerInit( ) {
    iServerTicks <- 0;
    iServerSecondTicks <- 0;
    
    iLastServerSaveTick <- 0;

    GlobalConfig <- { };
    GlobalConfig.VehicleSpawn <- { };
    GlobalConfig.NewCharacter <- { };

    GlobalConfig.iMaxVehicles <- 250;

    PedSkins <- { };
    PedSkins.Detectives <- [ 52 , 53 , 54 ];
    PedSkins.Police <- [ 34 , 35 , 36 , 127 , 128 , 240 , 241 , 242 , 243 , 244 , 245 , 246 ];
    PedSkins.Normal <- [ 3 , 4 , 8 , 14 , 16 , 20 , 21 , 23 , 24 , 25 , 26 , 27 , 29 , 30 , 32 , 33 , 37 , 38 , 39 , 40 , 41 , 44 , 46 , 47 , 48 , 49 , 50 , 51 , 55 , 56 , 57 , 58 , 59 , 60 , 61 , 64 , 65 , 66 , 67 , 68 , 69 , 70 , 71 , 72 , 73 , 75 , 76 , 79 , 81 , 88 , 90 , 91 , 92 , 93 , 94 , 95 , 96 , 97 , 99 , 101 , 102 , 103 , 104 , 105 , 106 , 107 , 108 , 110 , 111 , 113 , 114 , 115 , 116 , 118 , 119 , 120 , 121 , 122 , 126 , 129 , 130 , 131 , 133 , 134 , 135 , 136 , 138 , 139 , 140 , 141 , 142 , 143 , 144 , 145 , 146 , 147 , 148 , 151 , 152 , 153 , 160 , 162 , 165 , 167 , 168 , 169 , 171 , 172 , 173 , 174 , 175 , 181 , 182 , 183 , 184 , 185 , 186 , 188 , 189 , 190 , 191 , 192 , 194 , 195 , 196 , 198 , 200 , 201 , 202 , 203 , 204 , 205 , 206 , 207 , 208 , 209 , 210 , 211 , 212 , 213 , 215 , 216 , 217 , 219 , 220 , 221 , 223 , 225 , 227 , 229 , 230 , 231 , 232 , 233 , 235 , 236 , 237 , 239 , 247 , 248 , 249 , 251 , 253 , 254 , 256 , 258 , 260 , 261 , 262 , 264 , 265 , 266 , 267 , 268 , 269 , 270 , 271 , 272 , 273 , 274 , 275 , 277 , 279 , 281 , 282 , 283 , 284 , 285 , 287 , 288 , 290 , 291 , 292 , 294 , 295 , 296 ];
    PedSkins.Blocked <- [ 1 , 2 , 5 , 6 , 7 , 9 , 10 , 11 , 12 , 13 , 15 , 17 , 18 , 19 , 22 , 28 , 31 , 42 , 43 , 45 , 62 , 63 , 74 , 77 , 78 , 80 , 82 , 83 , 84 , 85 , 86 , 87 , 89 , 98 , 100 , 109 , 112 , 117 , 123 , 124 , 125 , 132 , 137 , 149 , 150 , 154 , 155 , 156 , 157 , 158 , 159 , 161 , 163 , 164 , 166 , 170 , 176 , 177 , 178 , 179 , 170 , 187 , 193 , 197 , 199 , 214 , 218 , 222 , 224 , 226 , 228 , 234 , 238 , 250 , 252 , 255 , 257 , 259 , 263 , 279 , 278 , 280 , 286 , 289 , 293 , 297 , 298 , 299 , 300 , 301 , 302 , 303 ];
    PedSkins.Gangsters <- [ ];
    
    GlobalConfig.fVehicleSpawnDistance <- 10.0;
    GlobalConfig.fVehicleTrunkDistance <- 3.0;

    StaffFlags <- createBitwiseTable( [ "None" , "BasicModeration" , "ManageBans" , "ManageVehicles" , "Scripter" , "Owner" ] );
    AccountSettings <- createBitwiseTable( [ "None" , "Force2StepAuth" , "LoginByLastIP" , "UseWhitelist" , "UseBlacklist" ] );
    GameSettings <- createBitwiseTable( [ "None" , "AutoSirenOff" ] );
    
    GlobalConfig.NewCharacter.iSkin <- 3;
    GlobalConfig.NewCharacter.fSpawnX <- -1969.19;
    GlobalConfig.NewCharacter.fSpawnY <- -4.79503;
    GlobalConfig.NewCharacter.fSpawnZ <- 19.6773;
    GlobalConfig.NewCharacter.iMoney <- 100;
    GlobalConfig.NewCharacter.iAccountSettings <- AccountSettings.None;
    GlobalConfig.NewCharacter.iStaffFlags <- StaffFlags.None;
    GlobalConfig.NewCharacter.iGameSettings <- GameSettings.None;
    
    GlobalConfig.iVehRentStartWait <- 5;
    GlobalConfig.iServerSaveInterval <- 300;
    GlobalConfig.iSpawnTickWait <- 5;

    CardinalDirections <- [ "North" , "Northeast" , "East" , "Southeast" , "South" , "Southwest" , "West" , "Northwest" , "Unknown" ];

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
    
    VehicleOwnerType <- { };
    VehicleOwnerType.None <- 0;
    VehicleOwnerType.Player <- 1;
    VehicleOwnerType.Faction <- 2;
    
    VehicleSeatNames <- [ "Driver" , "Front Passenger" , "Rear Left Passenger" , "Rear Right Passenger" ];
    VehicleTireNames <- [ "Front Left" , "Front Right" , "Rear Left" , "Rear Right" ];
    
    BlankVehicleData <- { };
    BlankVehicleData.iOwnerType <- VehicleOwnerType.None;
    BlankVehicleData.iOwnerID <- -1;
    BlankVehicleData.iModelID <- -1;
    BlankVehicleData.iBuyPrice <- 0;
    BlankVehicleData.iRentPrice <- 0;

    PlayerData <- { };
    VehicleData <- { };
    VehicleDataID <- { };
    VehicleModel <- { };
    
    BodyParts <- [ "None" , "Right Arm" , "Left Arm" , "Right Leg" , "Left Leg" , "Torso" , "Head" ];
    /*
    BodyParts[ 1 ] <- "Right Arm";
    BodyParts[ 2 ] <- "Left Arm";
    BodyParts[ 3 ] <- "Right Leg";
    BodyParts[ 4 ] <- "Left Leg";
    BodyParts[ 5 ] <- "Torso"
    BodyParts[ 6 ] <- "Head";
    */

    Sounds <- { };
    Sounds.KillShout <- [ "00940001" , "01010080" , "01940012" , "01940017" , "01940069" , "01940074" , "01990141" , "01990361" , "01990421" , "01990831" , "01990861" , "02010040" , "02010110" , "02940010" , "02940014" , "0294022" , "02940028" , "00940105" , "00940092" , "00940080" , "00940077" , "00940069" , "00940129" , "00940133" , "00940134" , "00950001" , "00950004" , "00950008" , "00950011" , "00950013" , "00950014" , "00950020" , "00950026" , "00950027" , "00950031" , "00950032" , "00950034" , "00950035" , "00950039" , "00950049" , "00950051" , "00950056" , "00950059" , "00950071" , "00950072" , "00950089" , "00950095" , "00950096" , "00950110" , "00950151" , "00950154" , "00950188" , "00950189" , "00950200" , "00950204" , "00950218" , "00950249" , "01010140" , "01940007" , "01940012" , "01940016" , "01940011" , "01940019" , "01940027" , "01940069" , "01940070" , "01940071" , "01940072" , "01940075" , "01940077" , "01940079" , "01940081" , "01940082" , "01940083" , "01940089" , "01940090" , "01940091" , "01990071" , "01990081" , "01990111" , "01990131" , "01990151" , "01990171" , "01990181" , "01990231" , "01990511" , "01990521" , "01990641" , "01990841" , "01990861" , "01990871" , "02010050" , "02940019" , "02940022" , "02940027" , "02940030" , "02940040" , "02940082" , "02940096" , "02950004" , "02950005" , "02950010" , "02950011" , "02950012" , "02950024" , "02950064" , "02950115" , "03030010" , "03030030" , "03030050" , "03940010" , "03940041" , "03940060" , "03940065" , "04040025" , "04040030" , "04040050" , "04940010" , "04940018" , "04940025" , "04940027" , "05010190" , "05010350" , "05030080" , "05940002" , "05940015" , "05940033" , "05940095" , "05990051" , "19990502" , "19990632" , "20010140" , "21940004" , "21940003" , "21940005" , "21940006" , "21940007" , "21940008" , "21940009" , "21940012" , "21940021" , "21940055" , "21940079" , "21940022" , "23940023" , "23940022" , "23940021" , "23940020" , "23940004" , "23940001" , "23940026" , "23940027" , "23940036" , "23940044" , "23940046" , "23940048" , "23940050" , "23940051" , "23940069" , "23940072" , "23940078" , "23940091" , "24940026" , "2590023 " , "25940045" , "28940059" , "30940048" , "30940048" , "28940004" , "27940024" , "27940011" , "25940038" , "25940026" , "25940024" , "25940023" , "25940021" , "25940002" , "24940063" , "21940081" , "20020450" , "20020160" , "19992011" , "19991512" , "19991255" , "19990351" , "19950110" , "19950060" , "19950040" , "18020420" , "18020360" , "17990421" , "17040550" , "15990212" , "15990084" , "15100010" , "15090070" , "15070080" , "15050021" , "14990251" , "14010460" , "14000220" , "14000120" , "13990071" , "12940059" , "12940039" , "11990763" , "11940083" , "11940040" , "08990041" , "08060130" , "07990231" , "07990161" , "07010240" , "15990801" , "15990881" , "16010040" , "16010090" , "16010100" , "17040020" , "17040461" , "17940058" , "17990051" , "18940059" , "18940052" , "18020301" , "16030060" , "15991621" , "15990211" , "15060030" , "15050004" , "15030130" , "14040050" , "14010560" , "14000250" , "14000230" , "12940086" , "12940039" , "12940006" , "12010140" , "10990672" , "09050210" , "09050190" , "08990151" , "08950015" , "08950017" , "08950013" , "09840008" , "08020010" , "07990415" , "07990371" , "07990224" , "07940029" , "07020190" , "05940026" , "04940058" , "04940039" , "04060050" , "03940079" , "28940001" , "28940002" , "28940003" , "28940004" , "28940005" , "28940006" , "28940007" , "28940008" , "28940009" , "28940010" , "28940011" , "28940012" , "28940013" , "28940014" , "28940015" , "28940016" , "28940017" , "28940018" , "28940019" , "28940020" , "28940021" , "28940022" , "28940023" , "28940025" , "28940026" , "28940027" , "28940028" , "28940029" , "28940030" , "28940031" , "28940032" , "28940033" , "28940034" , "28940035" , "28940036" , "28940037" , "28940038" , "28940039" , "28940040" , "28940041" , "28940042" , "28940043" , "28940044" , "28940045" , "28940046" , "28940047" , "28940048" , "28940049" , "28940042" , "28940043" , "28940044" , "28940045" , "28940046" , "28940047" , "28940048" , "28940049" ];

    serverSetGamemodeName( "Roleplay" );
    
    loadGlobalConfig( );
    
    loadVehiclesFromDatabase( );
    
    resyncIndexIniFile( );
    
    serverSetDefaultMap( "FREERIDE" );
}

function onPickupTaken( iPickupID , iPlayerID ) { 
    
}

function onPlayerConnect( iPlayerID ) {
    print( "Player " + playerGetName( iPlayerID ) + "[" + iPlayerID + "] connected to the server." );
    
    //OnlinePlayers[ iPlayerID ] <- iPlayerID;
    playerToggleCityMusic( iPlayerID , 0 );
    
    createPlayerDataSlot( iPlayerID );

    local bAccountLoaded = loadPlayerFromDatabase( iPlayerID );
    
    sendPlayerMessage( iPlayerID , Colours.Yellow + "Welcome to the " + GlobalConfig.szServerName + " server!" );
    
    if( bAccountLoaded ) {
        if( PlayerData[ iPlayerID ].iAccountSettings & AccountSettings.LoginByLastIP ) {
            if( playerGetIP( iPlayerID ) == PlayerData[ iPlayerID ].szLastIP ) {
                playerMessageSuccess( iPlayerID , "You have been logged in via your IP!" );
                loginSuccess( iPlayerID );
                return 1;
            }
        }
        sendPlayerMessage( iPlayerID , Colours.Cyan + "The name, " + playerGetName( iPlayerID ) + " is already registered." );
        sendPlayerMessage( iPlayerID , Colours.Cyan + "Use /login to access this account." );
    } else {
        sendPlayerMessage( iPlayerID , Colours.Cyan + "The name, " + playerGetName( iPlayerID ) + " is NOT registered." );
        sendPlayerMessage( iPlayerID , Colours.Cyan + "Use /register to create an account." );
    }
}

function onPlayerSpawn( iPlayerID ) {
    if( !PlayerData[ iPlayerID ].bLoggedIn ) {
        playerLockControls( iPlayerID , true );
    }
    
    if( PlayerData[ iPlayerID ].bIsDead ) {
        PlayerData[ iPlayerID ].bIsDead <- false;
        playerSetPosition( iPlayerID , -758.792 , 13.2488 , 761.116 );
        playerSetRotation( iPlayerID , 179.981 );
        playerChangeSkin( iPlayerID , PlayerData[ iPlayerID ].iSkinID );
    }
    
    print( "Player " + playerGetName( iPlayerID ) + "[" + iPlayerID + "] spawned.");
}

function onPlayerDisconnect( iPlayerID ) {
    //OnlinePlayers[ iPlayerID ] <- null;
    
    /*
    playerSavePosition( iPlayerID );
    playerSaveSkin( iPlayerID );
    playerSaveWeapons( iPlayerID );
    playerSaveMoney( iPlayerID );
    */
    
    if( PlayerData[ iPlayerID ].bLoggedIn ) {
        savePlayerToDatabase( iPlayerID );
    }
    
    deletePlayerDataSlot( iPlayerID );
    
    print("Player " + playerGetName( iPlayerID ) + "[" + iPlayerID + "] disconnected from the server.");
}

function onPlayerText( iPlayerID , szMessage ) {
    print( "[" + playerGetName( iPlayerID ) + "] sent message: " + szMessage);    
    
    if( PlayerData[ iPlayerID ].bMuted ) {
        messagePlayerError( iPlayerID , "You are muted, and cannot use any chat" );
    } else {
        sendAllMessage( Colours.Orange + "<" + playerGetName( iPlayerID ) + "> " + Colours.White + szMessage);
    }
    
    return false;
}

function onServerTickSecond( iTicks ) {
    iServerSecondTicks++;
    
    checkServerSaveCooldown( );
    checkSpawnRestoreCooldown( );
}

function onServerTick( iTicks ) {
    iServerTicks++;
}

function onPlayerShoot( iPlayerID , iWeaponID ) {
    
}

function onPlayerThrowGranade( iPlayerID , iWeaponID ) {
    
}

function onPlayerEnterVehicle( iPlayerID , iVehicleID , iSeatID ) {
    playerToggleCityMusic( iPlayerID , VehicleData[ iVehicleID ].iRadioID );
    playerMessageAlert( iPlayerID , "You entered vehicle " + iVehicleID + " in the " + VehicleSeatNames[ iSeatID ] + " seat." );
    
    if( iSeatID == 0 ) {
        if( VehicleData[ iVehicleID ].iBuyPrice > 0 ) {
            sendPlayerMessage( iPlayerID , Colours.Cyan + "This vehicle is for sale. It costs $" + VehicleData[ iVehicleID ].iBuyPrice + " to buy it." );
            if( playerGetMoney( iPlayerID ) >= VehicleData[ iVehicleID ].iBuyPrice ) {
                sendPlayerMessage( iPlayerID , Colours.Orange + "Use /buycar to purchase this vehicle " );
            } else {
                sendPlayerMessage( iPlayerID , Colours.Orange + "You don't have enough money to buy this vehicle." );
            }
        } else if( VehicleData[ iVehicleID ].iRentPrice > 0 ) {
            sendPlayerMessage( iPlayerID , Colours.Cyan + "This vehicle is rentable. It costs $" + VehicleData[ iVehicleID ].iRentPrice + " per minute" );
            sendPlayerMessage( iPlayerID , Colours.Orange + "You have " + GlobalConfig.iVehRentStartWait + " seconds to exit the vehicle if you don't want to rent it." );
            PlayerData[ iPlayerID ].iVehRentStart <- time( );
        }
    }
    
    print( "Player " + playerGetName( iPlayerID ) + "[" + iPlayerID + "] entered vehicle " + iVehicleID + " in seat " + iSeatID );
}

function onPlayerExitVehicle( iPlayerID , iVehicleID ) {
    playerToggleCityMusic( iPlayerID , 0 );
    
    if( PlayerData[ iPlayerID ].iGameSettings & GameSettings.AutoSirenOff ) {
        vehicleToggleSiren( iVehicleID , false );
    }
    
    if( VehicleData[ iVehicleID ].iRentPrice > 0 ) {
        if( PlayerData[ iPlayerID ].iVehRentStart > 0 ) {
            if( ( time( ) - PlayerData[ iPlayerID ].iVehRentStart ) > GlobalConfig.iVehRentStartWait ) {
                local iRentTime = ( time( ) - PlayerData[ iPlayerID ].iVehRentStart );
                local iCost = ceil( 60 / ( VehicleData[ iVehicleID ].iRentPrice * iRentTime ) );
                playerSetMoney( iPlayerID , playerGetMoney( iPlayerID ) - iCost );
                playerMessageAlert( iPlayerID , "You were charged $" + iCost + " to rent the vehicle." );
            }
        }
    }
    
    PlayerData[ iPlayerID ].iVehRentStart <- 0;
    
    print( "Player " + playerGetName( iPlayerID ) + "[" + iPlayerID + "] exited vehicle " + iVehicleID );
}

function onPlayerIsKilled( iPlayerID , iKillerID , iReasonID , iBodyPartID ) {
    if( PlayerData[ iPlayerID ].bSpawned ) {
        PlayerData[ iPlayerID ].bIsDead <- true;
    }
    
    if( iPlayerID != iKillerID ){
        sendAllMessage( "Player " + playerGetName( iPlayerID ) + "[" + iPlayerID + "] was killed by " + playerGetName( iKillerID ) + "[" + iKillerID + "] (Reason: " + iReasonID + " / Part: " + BodyParts[ iBodyPartID ] + "[" + iBodyPartID + "])");
    } else {
        sendAllMessage( "Player " + playerGetName( iPlayerID ) + "[" + iPlayerID + "] died. (Reason: " + iReasonID + " / Part: " + iBodyPartID + ")" );
    }
}

function onPlayerKeyPressed( iPlayerID , iKeyID ) {

}

function onPlayerCommand( iPlayerID , szCommand , szParams ) {
    consoleMessage( getPlayerNameAndID( iPlayerID ) + " has sent command: /" + szCommand + " " + szParams );
    if( szCommand.tolower( ) == "q" ) {
        return 1;
    }
    
    if( !canPlayerUseCommand( iPlayerID , szCommand.tolower( ) ) ) {
        playerMessageError( iPlayerID , "You are not allowed to use this command!" ); 
        return 1;
    }
    
    switch( szCommand.tolower( ) ) {
        case "login":
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/login <password>" );    
                return 1;
            }
            
            local szPassword = szParams;
            
            if( !isPlayerRegistered( iPlayerID ) ) {
                playerMessageError( iPlayerID , "You are not registered! Use /register" ); 
                return 1;
            }
            
            if( PlayerData[ iPlayerID ].bLoggedIn ) {
                playerMessageError( iPlayerID , "You are already logged in!" ); 
                return 1;
            }
            
            if( playerGetIP( iPlayerID ) == PlayerData[ iPlayerID ].szLastIP ) {
                playerMessageSuccess( iPlayerID , "You have been logged in!" );
                loginSuccess( iPlayerID );
                return 1;                
            }
            
            if( szPassword != PlayerData[ iPlayerID ].szPassword ) {
                playerMessageError( iPlayerID , "You entered the wrong password" ); 
                return 1;
            }
            
            playerMessageSuccess( iPlayerID , "You have been logged in!" );
            loginSuccess( iPlayerID );            
            break;
            
        case "register":
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/register <password>" );    
                return 1;
            }
            
            local szPassword = szParams;
            
            if( isPlayerRegistered( iPlayerID ) ) {
                playerMessageError( iPlayerID , "You are already registered! Use /login" ); 
                return 1;
            }
            
            PlayerData[ iPlayerID ].szPassword <- szPassword;
            PlayerData[ iPlayerID ].bNewlyRegistered <- true;
            
            addPlayerToDatabase( iPlayerID );
            
            playerMessageSuccess( iPlayerID , "You have been registered and logged in!" );
            sendPlayerMessage( iPlayerID , Colours.White + "TIP: " + Colours.Cyan + "Use /iplogin to allow quick login from your IP." );
            loginSuccess( iPlayerID );
            break;
            
        case "iplogin":
            if( PlayerData[ iPlayerID ].iAccountSettings & AccountSettings.LoginByLastIP ) {
                PlayerData[ iPlayerID ].iAccountSettings <- PlayerData[ iPlayerID ].iAccountSettings & ~AccountSettings.LoginByLastIP
                playerMessageSuccess( iPlayerID , "You have disabled login by IP for this account." );
            } else {
                PlayerData[ iPlayerID ].iAccountSettings <- PlayerData[ iPlayerID ].iAccountSettings | AccountSettings.LoginByLastIP
                playerMessageSuccess( iPlayerID , "You have enabled login by IP for this account." );
            }
            
            break;
            
        case "autosirenoff":
            if( PlayerData[ iPlayerID ].iGameSettings & GameSettings.AutoSirenOff ) {
                PlayerData[ iPlayerID ].iGameSettings <- PlayerData[ iPlayerID ].iGameSettings & ~GameSettings.AutoSirenOff;
                playerMessageSuccess( iPlayerID , "Vehicle sirens will no longer turn off when you get out. Use /siren instead." );
            } else {
                PlayerData[ iPlayerID ].iGameSettings <- PlayerData[ iPlayerID ].iGameSettings | GameSettings.AutoSirenOff;
                playerMessageSuccess( iPlayerID , "Vehicle sirens will now automatically turn off when you get out." );
            }
            
            break;            
            
        case "sr":
            local result = compilestring( "return " + szParams )( );
            playerMessageSuccess( iPlayerID , "Code Executed! Returns: " + result + " (" + type( result ) + ")" );
            break;
            
        case "se":
            local result = compilestring( szParams )( );
            playerMessageSuccess( iPlayerID , "Code Executed! Code: " + szParams );
            break;
            
        case "addcar":
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/addcar <model id>" );    
                return 1;
            }
            
            local iModelID = szParams.tointeger( );
            
            local pos = playerGetPosition( iPlayerID );
            local rotv = playerGetRotationAsVector( iPlayerID );
            local rot = playerGetRotation( iPlayerID );
            
            if( !isValidVehicleModelID( iModelID ) ) { 
                playerMessageError( iPlayerID , "You entered an invalid model ID" ); 
                return 1; 
            }
            
            local front = getPosInFrontOfPos( 
                pos[0] , 
                pos[1] , 
                pos[2] , 
                rot
                GlobalConfig.fVehicleSpawnDistance 
            );    
            
            local iVehicleID =  vehicleSpawn( 
                                    iModelID , 
                                    front[0] , 
                                    front[1] , 
                                    front[2] , 
                                    rotv[0] , 
                                    rotv[1] , 
                                    rotv[2]
                                    /*                
                                    GlobalConfig.VehicleSpawn.fRotX , 
                                    GlobalConfig.VehicleSpawn.fRotY , 
                                    GlobalConfig.VehicleSpawn.fRotZ 
                                    */
                                );
            
            VehicleDataID[ iVehicleID ] <- -1;
            VehicleData[ iVehicleID ] <- { };
            VehicleData[ iVehicleID ].iOwnerType <- VehicleOwnerType.None;
            VehicleData[ iVehicleID ].iOwnerID <- -1;
            VehicleData[ iVehicleID ].iModelID <- iModelID;
            VehicleData[ iVehicleID ].iBuyPrice <- 0;
            VehicleData[ iVehicleID ].iRentPrice <- 0;
            VehicleData[ iVehicleID ].iRadioID <- 0;
            VehicleData[ iVehicleID ].bSavedPosLock <- 0;
            
            //addVehicleToDatabase( iPlayerID );
            break;
            
        case "delcar":
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/delcar <model id>" );
                return 1;
            }
            
            local iVehicleID = szParams.tointeger( );
            
            if( !vehicleExists( iVehicleID ) ) {
                playerMessageError( iPlayerID , "You entered an invalid vehicle ID" ); 
            }
            
            vehicleDelete( iVehicleID );
            removeVehicleFromDatabase( iVehicleID );
            playerMessageSuccess( iPlayerID , "Vehicle " + iVehicleID + " has been deleted" );
            break;
            
        /*
        case "delallcars":
            for( local i = 0 ; i < GlobalConfig.iMaxVehicles ; i++ ) {
                if( vehicleExists( i ) ) {
                    vehicleDelete( i );
                }
            }
            
            consoleMessage( getPlayerNameAndID( iPlayerID ) + " has deleted all vehicles" );
            playerMessageSuccess( iPlayerID , "All vehicles have been deleted" );
            break;
        */
            
        case "nearcars":
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/nearcars <distance>" );
                return 1;
            }
            
            local fDistance = szParams.tofloat( );
            
            if( fDistance <= 1.0 ) {
                playerMessageError( iPlayerID , "The distance cannot be less than 1" ); 
                return 1;
            }
            
            local myPos = playerGetPosition( iPlayerID );
            local vPos = 0.0
            local fDistance2 = 0.0;
            
            for( local i = 0 ; i < GlobalConfig.iMaxVehicles ; i++ ) {
                if( vehicleExists( i ) ) {
                    vPos = vehicleGetPosition( i );
                    fDistance2 = getDistance( myPos[ 0 ] , myPos[ 2 ] , vPos[ 0 ] , vPos[ 2 ] );
                    
                    if( fDistance2 <= fDistance ) {
                        sendPlayerMessage( iPlayerID , "Vehicle " + i + " (" + fDistance2 + " units " + getCardinalDirectionText( getCardinalDirection( myPos[ 0 ] , myPos[ 2 ] , vPos[ 0 ] , vPos[ 2 ] ) ) + ")" );
                    }
                }
            }
            break;          
            
        case "setskin":
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/setskin <player id> <skin id>" );
                return 1;
            }
            
            local szParamsSplit = split( szParams , " " );
            if( szParamsSplit.len( ) < 2 ) {
                playerMessageSyntax( iPlayerID , "/setskin <player id> <skin id>" );
            }

            local iTargetID = szParamsSplit[ 0 ].tointeger( );
            local iSkinID = szParamsSplit[ 1 ].tointeger( );
            
            if( !playerIsConnected( iTargetID ) ) {
                playerMessageError( iPlayerID , "That player ID is not online" ); 
                return 1;
            }
            
            if( !isValidSkinID( iSkinID ) ) {
                playerMessageError( iPlayerID , "You entered an invalid skin ID" ); 
                return 1;
            }
            
            playerMessageAlert( iTargetID , "Your skin has been changed to " + iSkinID + " by " + playerGetName( iPlayerID ) );
            playerMessageSuccess( iPlayerID , "You have changed " + playerGetName( iPlayerID ) + "'s skin to " + iSkinID );
            consoleMessage( getPlayerNameAndID( iPlayerID ) + " has changed " + getPlayerNameAndID( iTargetID ) + " skin to " + iSkinID );
            playerChangeSkin( iTargetID , iSkinID );
            break;
            
        case "kick":   
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/kick <player id> <reason>" );
                return 1;
            }
            
            local szParamsSplit = split( szParams , " " );
            if( szParamsSplit.len( ) < 2 ) {
                playerMessageSyntax( iPlayerID , "/kick <player id> <reason>" );
            }

            local iTargetID = szParamsSplit[ 0 ].tointeger( );
            local szReason = szParamsSplit[ 1 ];
            
            if( !playerIsConnected( iTargetID ) ) {
                playerMessageError( iPlayerID , "That player ID is not online" ); 
                return 1;
            }
            
            sendAllMessage( Colours.Red + playerGetName( iTargetID ) + " has been kicked by an administrator for: " + szReason );
            playerMessageSuccess( iPlayerID , "You kicked " + playerGetName( iTargetID ) + " for: " + szReason );
            consoleMessage( getPlayerNameAndID( iPlayerID ) + " has kicked " + getPlayerNameAndID( iTargetID ) + " for: " + szReason );
            playerKick( iTargetID );
            break;
            
        case "mypos":
            local fMyPos = playerGetPosition( iPlayerID );
            print( getPlayerNameAndID( iPlayerID ) + "'s current position: " + fMyPos[ 0 ] + " , " + fMyPos[ 1 ] + " , " + fMyPos[ 2 ] );
            break;
            
        case "gotopos": 
            local szSplit = split( szParams , " , " );
            playerSetPosition( iPlayerID , szSplit[ 0 ].tofloat( ) ,  szSplit[ 1 ].tofloat( ) ,  szSplit[ 2 ].tofloat( ) );
            break;
            
        case "setstafftitle":   
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/setstafftitle <player id> <title>" );
                return 1;
            }
            
            local szParamsSplit = split( szParams , " " );
            if( szParamsSplit.len( ) < 2 ) {
                playerMessageSyntax( iPlayerID , "/setstafftitle <player id> <title>" );
            }

            local iTargetID = szParamsSplit[ 0 ].tointeger( );
            local szStaffTitle = szParamsSplit[ 1 ];
            
            if( !playerIsConnected( iTargetID ) ) {
                playerMessageError( iPlayerID , "That player ID is not online" ); 
                return 1;
            }
            
            iniSetParam( "data/stafftitles.ini" , playerGetName( iPlayerID ) , szStaffTitle );
            playerMessageSuccess( iPlayerID , "You set " + playerGetName( iTargetID ) + "'s staff title to " + szStaffTitle );
            break;
            
        case "freeze":   
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/freeze <player id>" );
                return 1;
            }

            local iTargetID = szParams.tointeger( );
            
            if( !playerIsConnected( iTargetID ) ) {
                playerMessageError( iPlayerID , "That player ID is not online" ); 
                return 1;
            }
            
            playerMessageAlert( iTargetID , "You have been frozen by an administrator" );
            playerMessageAlert( iPlayerID , "You have frozen " + playerGetName( iTargetID ) );
            consoleMessage( getPlayerNameAndID( iPlayerID ) + " has frozen " + getPlayerNameAndID( iTargetID ) );
            PlayerData[ iTargetID ].Frozen <- true;
            playerLockControls( iTargetID , true );
            break;
            
        case "unfreeze":   
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/unfreeze <player id>" );
                return 1;
            }

            local iTargetID = szParams.tointeger( );
            
            if( !playerIsConnected( iTargetID ) ) {
                playerMessageError( iPlayerID , "That player ID is not online" ); 
                return 1;
            }
            
            playerMessageAlert( iTargetID , "You have been unfrozen by an administrator" );
            playerMessageAlert( iPlayerID , "You have unfrozen " + playerGetName( iTargetID ) );
            consoleMessage( getPlayerNameAndID( iPlayerID ) + " has unfrozen " + getPlayerNameAndID( iTargetID ) );                                        
            PlayerData[ iTargetID ].Frozen <- false;
            playerLockControls( iTargetID , false );
            break;
            
        case "mute":   
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/mute <player id>" );
                return 1;
            }

            local iTargetID = szParams.tointeger( );
            
            if( !playerIsConnected( iTargetID ) ) {
                playerMessageError( iPlayerID , "That player ID is not online" ); 
                return 1;
            }
            
            playerMessageAlert( iTargetID , "You have been muted by an administrator" );
            playerMessageAlert( iPlayerID , "You have muted " + playerGetName( iTargetID ) );
            consoleMessage( getPlayerNameAndID( iPlayerID ) + " has muted " + getPlayerNameAndID( iTargetID ) );                                        
            PlayerData[ iTargetID ].Muted <- true;
            break;
            
        case "unmute":   
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/unmute <player id>" );
                return 1;
            }

            local iTargetID = szParams.tointeger( );
            
            if( !playerIsConnected( iTargetID ) ) {
                playerMessageError( iPlayerID , "That player ID is not online" ); 
                return 1;
            }
            
            playerMessageAlert( iTargetID , "You have been unmuted by an administrator" );
            playerMessageAlert( iPlayerID , "You have unmuted " + playerGetName( iTargetID ) );
            consoleMessage( getPlayerNameAndID( iPlayerID ) + " has unmuted " + getPlayerNameAndID( iTargetID ) );                                        
            PlayerData[ iTargetID ].Muted <- false;
            break; 

        case "goto":
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/goto <player id>" );
                return 1;
            }       
            
            local iTargetID = szParams.tointeger( );
            
            if( !playerIsConnected( iTargetID ) ) {
                playerMessageError( iPlayerID , "That player ID is not online" ); 
                return 1;
            }
            
            local pos = getPosInFrontOfPlayer( iTargetID , 3.0 );
            playerSetPosition( iPlayerID , pos[ 0 ] , pos[ 1 ] , pos[ 2 ] );
            
            playerMessageAlert( iPlayerID , "You have teleported to " + playerGetName( iTargetID ) ); 
            consoleMessage( getPlayerNameAndID( iPlayerID ) + " has teleported to " + getPlayerNameAndID( iTargetID ) );                                        
            break;
            
        case "gotoveh":
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/gotoveh <vehicle id>" );
                return 1;
            }
            
            local iTargetID = szParams.tointeger( );
            
            if( !vehicleExists( iTargetID ) ) {
                playerMessageError( iPlayerID , "That vehicle ID does not exist" ); 
                return 1;
            }
            
            local pos = vehicleGetPosition( iTargetID );
            playerSetPosition( iPlayerID , pos[ 0 ] , pos[ 1 ] + 3.0 , pos[ 2 ] );
            
            playerMessageAlert( iPlayerID , "You have teleported to vehicle " + iTargetID );
            consoleMessage( getPlayerNameAndID( iPlayerID ) + " has teleported to vehicle " + iTargetID );                            
            break;            

        case "gethere":
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/gethere <player id>" );
                return 1;
            }       
            
            if( !playerIsConnected( iTargetID ) ) {
                playerMessageError( iPlayerID , "That player ID is not online" ); 
                return 1;
            }
            
            local iTargetID = szParams.tointeger( );
            
            local pos = getPosInFrontOfPlayer( iPlayerID , 3.0 );
            playerSetPosition( iTargetID , pos[ 0 ] , pos[ 1 ] , pos[ 2 ] );
            
            playerMessageAlert( iPlayerID , "You have teleported " + playerGetName( iTargetID ) + " to your position." );
            playerMessageAlert( iTargetID , "You have been teleported to " + playerGetName( iPlayerID ) );         
            consoleMessage( getPlayerNameAndID( iPlayerID ) + " has teleported to " + getPlayerNameAndID( iTargetID ) );                
            break;
            
        case "siren":
            local iVehicleID = playerInVehicleID( iPlayerID );
            if( iVehicleID == -1 ) {
                playerMessageError( iPlayerID , "You must be in a vehicle" );
                return 1;                
            }
                
            if( vehicleGetSirenState( iVehicleID ) ) {
                vehicleToggleSiren( iVehicleID , false );
                playerMessageSuccess( iPlayerID , "You have turned off the siren for vehicle " + iVehicleID );                
                consoleMessage( getPlayerNameAndID( iPlayerID ) + " has turned off the siren for vehicle + " + iVehicleID );
            } else {
                vehicleToggleSiren( iVehicleID , true );
                playerMessageSuccess( iPlayerID , "You have turned on the siren for vehicle " + iVehicleID ); 
                consoleMessage( getPlayerNameAndID( iPlayerID ) + " has turned on the siren for vehicle + " + iVehicleID );                
            }
            break;
            
        case "respawnall":
            for( local i = 0 ; i < GlobalConfig.iMaxVehicles ; i++ ) {
                if( vehicleExists( i ) ) {
                    vehicleDelete( i );
                    VehicleData[ i ] <- null;
                    VehicleDataID[ i ] <- -1;
                }
            }
            
            loadVehiclesFromDatabase( );
            break;
            
        case "saveposlock":
            local iVehicleID = playerInVehicleID( iPlayerID );
            if( iVehicleID == -1 ) {
                playerMessageError( iPlayerID , "You must be in a vehicle" );
                return 1;
            }
                
            if( VehicleData[ iVehicleID ].bSavedPosLock == 0 ) {
                VehicleData[ iVehicleID ].bSavedPosLock <- 1;
                playerMessageSuccess( iPlayerID , "You have disabled the position saving for vehicle " + iVehicleID );
                playerMessageAlert( iPlayerID , "Vehicle " + iVehicleID + " will no longer keep it's position on server save." );
                consoleMessage( getPlayerNameAndID( iPlayerID ) + " has disabled the position saving for vehicle " + iVehicleID );
            } else {
                VehicleData[ iVehicleID ].bSavedPosLock <- 0;
                playerMessageSuccess( iPlayerID , "You have enabled the position saving for vehicle " + iVehicleID );
                playerMessageAlert( iPlayerID , "Vehicle " + iVehicleID + " will keep it's position on server save" );
                consoleMessage( getPlayerNameAndID( iPlayerID ) + " has enabled the position saving for vehicle " + iVehicleID );
            }
            break;            
          
        /*
        // Radio doesn't use ID's ... My bad
        case "radio":
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/radio <radio id>" );
                return 1;
            }
            
            local iVehicleID = playerInVehicleID( iPlayerID );
            if( iVehicleID == -1 ) {
                playerMessageError( iPlayerID , "You must be in a vehicle" ); 
            }
            
            local iRadioID = szParams.tointeger( );
                
            VehicleData[ iVehicleID ].iRadioID <- iRadioID;
            break;
        */
        
        case "radio":
            local iVehicleID = playerInVehicleID( iPlayerID );
            if( iVehicleID == -1 ) {
                playerMessageError( iPlayerID , "You must be in a vehicle" ); 
                return 1;
            }
            
            local szPassengerMessage = "";
                
            if( VehicleData[ iVehicleID ].iRadioID == 1 ) {                
                VehicleData[ iVehicleID ].iRadioID <- 0;
                szPassengerMessage = Colours.White + playerGetName( iPlayerID ) + " has turned off the radio";
                playerMessageSuccess( iPlayerID , "You have turned off the radio for vehicle " + iVehicleID );
                playerMessageAlert( iPlayerID , "You may need to get out of the vehicle and get back in to stop the radio." );
                consoleMessage( getPlayerNameAndID( iPlayerID ) + " has turned off the radio for vehicle + " + iVehicleID );
            } else {
                VehicleData[ iVehicleID ].iRadioID <- 1;
                playerMessageSuccess( iPlayerID , "You have turned on the radio for vehicle " + iVehicleID );            
                szPassengerMessage = Colours.White + playerGetName( iPlayerID ) + " has turned on the radio";
                playerMessageAlert( iPlayerID , "You may need to get out of the vehicle and get back in to play the radio." );
                consoleMessage( getPlayerNameAndID( iPlayerID ) + " has turned on the radio for vehicle + " + iVehicleID );
            }
            
            for( local i = 0 ; i < 4 ; i++ ) {
                if( vehicleGetPlayerIDFromSeat( iVehicleID , i ) != -1 ) {
                    playerToggleCityMusic( vehicleGetPlayerIDFromSeat( iVehicleID , i ) , VehicleData[ iVehicleID ].iRadioID );
                    
                    if( i != 0 ) {
                        sendPlayerMessage( vehicleGetPlayerIDFromSeat( iVehicleID , i ) , szPassengerMessage );
                    }
                }
            }            
            break;
            
        case "setsiren":        
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/setsiren <vehicle id>" );
                return 1;
            }
            
            local iVehicleID = szParams.tointeger( );
            
            if( !vehicleExists( iVehicleID ) ) {
                playerMessageError( iPlayerID , "That vehicle ID does not exist" ); 
                return 1;
            }
                
            if( vehicleGetSirenState( iVehicleID ) ) {
                vehicleToggleSiren( iVehicleID , false );
                playerMessageSuccess( iPlayerID , "You have turned off the siren for vehicle " + iVehicleID );  
                consoleMessage( getPlayerNameAndID( iPlayerID ) + " has turned off the siren for vehicle + " + iVehicleID );
            } else {
                vehicleToggleSiren( iVehicleID , true );
                playerMessageSuccess( iPlayerID , "You have turned on the siren for vehicle " + iVehicleID );            
                consoleMessage(getPlayerNameAndID( iPlayerID ) + " has turned on the siren for vehicle + " + iVehicleID );
            }
            break;
            
        case "setrentprice":
            local iVehicleID = playerInVehicleID( iPlayerID );
            if( iVehicleID == -1 ) {
                playerMessageError( iPlayerID , "You must be in a vehicle" ); 
                return 1;
            }
            
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/setrentprice <amount>" );
                return 1;
            }
            
            local iPrice = szParams.tointeger( );
            
            if( iPrice < 1 ) {
                playerMessageError( iPlayerID , "The rent price must be at least $1" ); 
                return 1;
            }
                
            VehicleData[ iVehicleID ].iRentPrice <- iPrice;
            playerMessageSuccess( iPlayerID , "You have set the rent price to $" + iPrice + " for vehicle " + iVehicleID );
            consoleMessage( getPlayerNameAndID( iPlayerID ) + " has set the rent price to $" + iPrice + " for vehicle " + iVehicleID );
            break;            

        case "setroof":
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/setroof <vehicle id>" );
                return 1;
            }
            
            local iVehicleID = szParams.tointeger( );
            
            if( !vehicleExists( iVehicleID ) ) {
                playerMessageError( iPlayerID , "That vehicle ID does not exist" ); 
                return 1;
            }
                  
            if( !vehicleGetRoofState( iVehicleID ) ) {
                vehicleToggleRoof( iVehicleID , 1 );
                playerMessageSuccess( iPlayerID , "You have closed the roof for vehicle " + iVehicleID );  
                consoleMessage( getPlayerNameAndID( iPlayerID ) + " has closed the roof for vehicle + " + iVehicleID );                  
            } else {
                vehicleToggleRoof( iVehicleID , 0 );
                playerMessageSuccess( iPlayerID , "You have opened the roof for vehicle " + iVehicleID );  
                consoleMessage( getPlayerNameAndID( iPlayerID ) + " has opened the roof for vehicle + " + iVehicleID );                
            }
            break;               
            
        case "roof":
            local iVehicleID = playerInVehicleID( iPlayerID );
            if( iVehicleID == -1 ) {
                playerMessageError( iPlayerID , "You must be in a vehicle" ); 
                return 1;
            }
            
            if( !vehicleGetRoofState( iVehicleID ) ) {
                vehicleToggleRoof( iVehicleID , 1 );
                playerMessageSuccess( iPlayerID , "You have closed the roof for vehicle " + iVehicleID );  
                consoleMessage( getPlayerNameAndID( iPlayerID ) + " has closed the roof for vehicle + " + iVehicleID );                  
            } else {
                vehicleToggleRoof( iVehicleID , 0 );
                playerMessageSuccess( iPlayerID , "You have opened the roof for vehicle " + iVehicleID );  
                consoleMessage( getPlayerNameAndID( iPlayerID ) + " has opened the roof for vehicle + " + iVehicleID );                
            }
            break;          

        case "saveall":
            saveAllVehiclesToDatabase( );
            saveAllPlayersToDatabase( );
            break;
            
        case "me":
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/me <action>" );
                return 1;
            }
            
            playerAction( iPlayerID , szParams );
            break;
            
        case "admins":    
            local tblAdmins = getOnlineAdmins( );
            
            sendPlayerMessage( iPlayerID , Colours.Cyan + "=============== " + Colours.White + " ADMINS " + Colours.Cyan + " ===============" );
            foreach( ii , iv in tblAdmins ) {
                sendPlayerMessage( iPlayerID , Colours.White + " - " + Colours.Orange + iv.szPlayerName + Colours.Gray50 + " (" + iv.szStaffTitle + ")" );
            }
            break;            
            
        case "s":
        case "shout":
            if( szParams.len( ) == 0 ) {
                playerMessageSyntax( iPlayerID , "/shout <action>" );
                return 1;
            }
            
            playerShout( iPlayerID , szParams );
            break; 

        case "help":
            if( szParams.len( ) == 0 ) {
                sendPlayerMessage( iPlayerID , Colours.Cyan + "== HELP ===========================" );
                sendPlayerMessage( iPlayerID , Colours.White + "Please enter /help <option> to see more information. Options are:" );
                sendPlayerMessage( iPlayerID , Colours.White + "Vehicle, Account, Roleplay, Admin" );
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
            
            switch( szParams.tolower( ) ) {
                case "vehicle":
                    sendPlayerMessage( iPlayerID , Colours.Cyan + "== VEHICLE HELP ===================" );
                    sendPlayerMessage( iPlayerID , Colours.Gray25 + "Some vehicles are rentable. More information will be given when entering one." );
                    sendPlayerMessage( iPlayerID , Colours.White + "When entering a vehicle for sale, instructions will be given to you on how to buy it." );
                    sendPlayerMessage( iPlayerID , Colours.Gray25 + "Don't forget to register your vehicle at the Department of Motor Vehicles building!" );
                    sendPlayerMessage( iPlayerID , Colours.White + "You will need a driver's license to legally drive a motor vehicle in Lost Heaven." );
                    sendPlayerMessage( iPlayerID , Colours.Gray25 + "- Available commands: /siren, /roof, /radio" );
                    sendPlayerMessage( iPlayerID , Colours.Cyan + "===================================" );
                    break;
                    
                case "account":
                    sendPlayerMessage( iPlayerID , Colours.Cyan + "== ACCOUNT HELP ===================" );
                    sendPlayerMessage( iPlayerID , Colours.Gray25 + "- Available commands: /login /iplogin" );
                    sendPlayerMessage( iPlayerID , Colours.Cyan + "===================================" );
                    break;                
                    
                case "roleplay":
                    sendPlayerMessage( iPlayerID , Colours.Cyan + "== ROLEPLAY HELP ==================" );
                    sendPlayerMessage( iPlayerID , Colours.Gray25 + "This server is built on a light RP standard." );
                    sendPlayerMessage( iPlayerID , Colours.White + "Do not mix OOC and IC chats. Exceptions can be made for new players." );
                    sendPlayerMessage( iPlayerID , Colours.Gray25 + "Please don't powergame. Powergaming is forcing somebody to RP or acting unnatural." );
                    sendPlayerMessage( iPlayerID , Colours.White + "If you have any questions about roleplaying, please contact an admin. Use /admins." );
                    sendPlayerMessage( iPlayerID , Colours.Gray25 + "- Available commands: /shout, /me, /b, /do" );
                    sendPlayerMessage( iPlayerID , Colours.Cyan + "===================================" );
                    break; 

                case "admin":
                    if( PlayerData[ iPlayerID ].iStaffFlags == 0 ) {
                        playerMessageError( iPlayerID , "You cannot view this help section!" );
                        return 1;
                    }
                    
                    sendPlayerMessage( iPlayerID , Colours.Cyan + "== ADMIN HELP =====================" );
                    sendPlayerMessage( iPlayerID , Colours.Gray25 + "- Coming soon!" );
                    sendPlayerMessage( iPlayerID , Colours.Cyan + "===================================" );
                    break;                    
                
                default:
                    playerMessageError( iPlayerID , "You entered an invalid help section name!" );
                    break;
            }
            break;
            
        default:
            playerMessageError( iPlayerID , "You entered an invalid command! Use /help for a list!" );
            break;
    }
}

function getPosInFrontOfPos( fX , fY , fZ , fAngle , fDistance ) {
    fAngle = degreesToRadians( fAngle );
    
    local fX2 = ( fX + ( ( cos( -fAngle + ( PI / 2 ) ) ) * fDistance ) );
    local fZ2 = ( fZ + ( ( sin( -fAngle + ( PI / 2 ) ) ) * fDistance ) );
    
    return [ fX2 , fY , fZ2 ];
}

function getPosBehindPos( fX , fY , fZ , fAngle , fDistance ) {
    fAngle = degreesToRadians( fAngle );
    
    local fX2 = ( fX + ( ( cos( fAngle + ( PI / 2 ) ) ) * fDistance ) );
    local fZ2 = ( fZ + ( ( sin( fAngle + ( PI / 2 ) ) ) * fDistance ) );
    
    return [ fX2 , fY , fZ2 ];
}

function getPosInFrontOfPlayer( iPlayerID , fDistance ) {
    local pos = playerGetPosition( iPlayerID );
    local rot = playerGetRotation( iPlayerID );
    
    return getPosInFrontOfPos( pos[ 0 ] , pos[ 1 ] , pos[ 2 ] , rot , fDistance );
}

function getPosBehindPlayer( iPlayerID , fDistance ) {
    local pos = playerGetPosition( iPlayerID );
    local rot = playerGetRotation( iPlayerID );
    
    return getPosBehindPos( pos[ 0 ] , pos[ 1 ] , pos[ 2 ] , rot , fDistance );
}

function getPosAbovePos( fX , fY , fZ , fHeight = 0.0 ) {
    return [ fX , fY-height , fZ ];
}

function getPosBelowPos( fX , fY , fZ , fHeight = 0.0 ) {
    return [ fX , fY-height , fZ ];
}

function getPosAbovePlayer( iPlayerID , fDistance ) {
    local pos = playerGetPosition( iPlayerID );
    local rot = playerGetRotation( iPlayerID );
    
    return getPosAbovePos( pos[ 0 ] , pos[ 1 ] , pos[ 2 ] , fDistance );
}

function getPosBelowPlayer( iPlayerID , fDistance ) {
    local pos = playerGetPosition( iPlayerID );
    local rot = playerGetRotation( iPlayerID );
    
    return getPosBelowPos( pos[ 0 ] , pos[ 1 ] , pos[ 2 ] , fDistance );
}

function getOffsetFromPos( fX1 , fY1 , fZ1 , fX2 = 0.0 , fY2 = 0.0 , fZ2 = 0.0 ) {
    return [ fX1 + fX2 , fY1 + fY2 , fZ1 + fZ2 ];
}

function getCardinalDirectionText( iDirectionID ) {    
    return CardinalDirections[ iDirectionID ];
}

function getCardinalDirection( fX1 , fZ1 , fX2 , fZ2 ) {
    local a = fX1 - fX2;
    local b = fZ1 - fZ2;
    local x = abs( a );
    local y = abs( b );
    
    local no = 0;
    local ne = 1;
    local ea = 2;
    local se = 3;
    local so = 4;
    local sw = 5;
    local we = 6;
    local nw = 7;
    local na = 8; // Unknown (not available)
    
    if( b < 0 && a < 0 ) {
        if( x < ( y / 2 ) ) {
            return no;
        } else if( y < ( x / 2 ) ) {
            return east;
        } else {
            return ne;
        }
    } else if( b < 0 && a >= 0 ) {
        if( x < ( y / 2 ) ) {
            return no;
        } else if( y < ( x / 2 ) ) {
            return we;
        } else {
            return nw;
        }
    } else if( b >= 0 && a >= 0 ) {
        if( x < ( y / 2 ) ) {
            return so;
        } else if( y < ( x / 2 ) ) {
            return w;
        } else {
            return sw;
        }
    } else if( b >= 0 && a < 0 ) {
        if( x < ( y / 2 ) ) {
            return s;
        } else if( y < ( x / 2 ) ) {
            return e;
        } else {
            return se;
        }
    } else {
        return na;
    }
}

function degreesToRadians( fDegrees ) {
    return fDegrees * ( PI / 180 );
}

function radiansToDegrees( fRadians ) {
    return fRadians * ( 180 / PI );
}

function isValidVehicleModelID( iModelID ) {
    if( iModelID < 169 ) {
        return true;
    }
    
    return false;
}

function isValidSkinID( iSkinID ) {
    if( iSkinID < 302 ) {
        return true;
    }
    
    return false;
}

function canPlayerUseCommand( iPlayerID , szCommand ) {
    if( szCommand.tolower( ) == "login" || szCommand.tolower( ) == "register" ) {
        return true;
    }
    
    if( PlayerData[ iPlayerID ].bLoggedIn ) {
        local szRequiredFlags = iniGetParam( "data\\commandflags.ini" , szCommand.tolower( ) , "None" );
        
        if( szRequiredFlags == "None" ) {
            return true;
        }
        
        if( PlayerData[ iPlayerID ].iStaffFlags & StaffFlags[ szRequiredFlags ] ) {
            return true;
        }
        
        if( PlayerData[ iPlayerID ].iStaffFlags == -1 ) {
            return true
        }
    }
    
    return false;
}

function resetPlayerDataSlot( iPlayerID ) {
    return true;
}

function playerMessageError( iPlayerID , szMessage ) {
    sendPlayerMessage( iPlayerID , Colours.Red + "[ERROR]: " + Colours.White + szMessage + "!" );
    
    return true;
}

function playerMessageSyntax( iPlayerID , szMessage ) {
    sendPlayerMessage( iPlayerID , Colours.Gray25 + "[USAGE]: " + Colours.White + szMessage );
    
    return true;
}

function playerMessageAlert( iPlayerID , szMessage ) {
    sendPlayerMessage( iPlayerID , Colours.Yellow + "[ALERT]: " + Colours.White + szMessage );
    
    return true;
}

function playerMessageSuccess( iPlayerID , szMessage ) {
    sendPlayerMessage( iPlayerID , Colours.Lime + "[SUCCESS]: " + Colours.White + szMessage );
    
    return true;
}

function playerAction( iPlayerID , szAction ) {
    local myPos = playerGetPosition( iPlayerID );
    local theirPos = false;
    
    foreach( ii , iv in OnlinePlayers ) {
        theirPos = playerGetPosition( iv );
        if( getDistance( myPos[ 0 ] , myPos[ 2 ] , theirPos[ 0 ] , theirPos[ 2 ] ) <= GlobalConfig.Chat.fActionDistance ) {
            playerMessage( iPlayerID , Colours.Purple + playerGetName( iPlayerID ) + " " + szAction );
        }
    }
    
    //sendAllMessage( Colours.Purple + playerGetName( iPlayerID ) + " " + szAction );
}

function playerShout( iPlayerID , szMessage ) {
    local myPos = playerGetPosition( iPlayerID );
    local theirPos = false;
    
    foreach( ii , iv in OnlinePlayers ) {
        theirPos = playerGetPosition( iv );
        if( getDistance( myPos[ 0 ] , myPos[ 2 ] , theirPos[ 0 ] , theirPos[ 2 ] ) <= GlobalConfig.Chat.fShoutDistance ) {
            playerMessage( iPlayerID , Colours.White + playerGetName( iPlayerID ) + " shouts " + szAction + "!" );
        }
    }
    
    //sendAllMessage( Colours.White + playerGetName( iPlayerID ) + " shouts: " + Colours.Gray25 + szMessage );
}

function getDistance( fX1 , fY1 , fX2 , fY2 ) {
    return ( sqrt( ( ( fX2 - fX1 ) * ( fX2 - fX1 ) ) + ( ( fY2 - fY1 ) * ( fY2 - fY1 ) ) ) );
}

function getAngleBetweenPos( fX1 , fZ1 , fX2 , fZ2 ) {
    return atan2( fZ2 + fZ1 , fX2 + fX1);
}

function isInArea( fPosX , fPosY , fX1 , fX2 , fY1 , fY2 ){
    if( ( fPosX >= fX1 && fPosX <= fX2 ) && ( fPosY >= fY1 && fPosY <= fY2 ) ) {
        return true;
    } else {
        return true;
    }
}

function random( iMin , iMax ){
    srand( time( ) );
    return ( ( rand( ) % ( iMax - iMin ) ) + iMin);
}

function compare( a , b ) {
    if( a > b ) return 1
    else if( a < b ) return -1
    return 0;
}

function spawnAllCarsInLine( fX , fY , fZ , fRot ) {
    local idx = 0;
    for( local i = 0 ; i < 169 ; i++ ) {
        idx++;
        local front = getPosInFrontOfPos( 
            fX , 
            fY , 
            fZ , 
            fRot , 
            3 * idx
        );
        
        vehicleSpawn( 
            i , 
            front[0] , 
            front[1] , 
            front[2] , 
            GlobalConfig.VehicleSpawn.fRotX , 
            GlobalConfig.VehicleSpawn.fRotY , 
            GlobalConfig.VehicleSpawn.fRotZ 
        );   
    }
}

function getVehicleFreeDataSlot( ) {
    local iLastSlot = iniGetParam( "data/indexlist.ini" , "iVehicleDataID" , "0" );
    
    iLastSlot = iLastSlot.tointeger( );
    iLastSlot = iLastSlot + 1;
    
    iniSetParam( "data/indexlist.ini" , "iVehicleDataID" , iLastSlot.tostring( ) );
    
    return iLastSlot;
}

function getAccountFreeDataSlot( ) {
    local iLastSlot = iniGetParam( "data/indexlist.ini" , "iAccountDataID" , "0" );
    
    iLastSlot = iLastSlot.tointeger( );
    iLastSlot = iLastSlot + 1;
    
    iniSetParam( "data/indexlist.ini" , "iAccountDataID" , iLastSlot.tostring( ) );
    
    return iLastSlot;
}

function getFactionFreeDataSlot( ) {
    local iLastSlot = iniGetParam( "data/indexlist.ini" , "iFactionDataID" , "0" );
    
    iLastSlot = iLastSlot.tointeger( );
    iLastSlot = iLastSlot + 1;
    
    iniSetParam( "data/indexlist.ini" , "iFactionDataID" , iLastSlot.tostring( ) );
    
    return iLastSlot;
}

function addVehicleToDatabase( iVehicleID ) {
    local iVehicleDataID = getVehicleFreeDataSlot( );

    iniCreateFile( "data/vehicles/" + iVehicleDataID + ".ini" );
    
    VehicleDataID[ iVehicleID ] <- iVehicleDataID;
    
    saveVehicleToDatabase( iVehicleID );
}

function removeVehicleFromDatabase( iVehicleID ) {
    iniSetParam( "data/vehicles/" + VehicleDataID[ iVehicleID ] + ".ini" , "bDeleted" , "1" );
}

function loadVehiclesFromDatabase( ) {
    local iVehicleCount = iniGetParam( "data/indexlist.ini" , "iVehicleDataID" , "unknown" );
    iVehicleCount = iVehicleCount.tointeger( );
    
    for( local i = 1 ; i <= iVehicleCount ; i++ ) {
        if( iniFileExists( "data/vehicles/" + i + ".ini" ) ) {
            loadVehicleFromDatabase( i );
        }
    }    
}

function loadVehicleFromDatabase( iVehicleDataID ) {
    local bDeleted = iniGetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "bDeleted" , "0" ); 
    
    if( bDeleted.tointeger( ) == 0 ) {
        local iModelID   = iniGetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "iModelID" , "0" );
        local fSavedPosX = iniGetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "fSavedPosX" , "0.0" );
        local fSavedPosY = iniGetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "fSavedPosY" , "0.0" );
        local fSavedPosZ = iniGetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "fSavedPosZ" , "0.0" );
        local fSavedRotX = iniGetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "fSavedRotX" , "0.0" );
        local fSavedRotY = iniGetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "fSavedRotY" , "0.0" );
        local fSavedRotZ = iniGetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "fSavedRotZ" , "0.0" );
        local iOwnerID   = iniGetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "iOwnerID" , "0" );
        local iOwnerType = iniGetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "iOwnerType" , "0" );   
        local iBuyPrice  = iniGetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "iBuyPrice" , "0" );
        local iRentPrice = iniGetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "iRentPrice" , "0" );    
        local iRadioID   = iniGetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "iRadioID" , "0" );    
        local bSavedPosLock = iniGetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "bSavedPosLock" , "0" );  
        
        local iVehicleID = vehicleSpawn( iModelID.tointeger( ) , fSavedPosX.tofloat( ) , fSavedPosY.tofloat( ), fSavedPosZ.tofloat( ) , fSavedRotX.tofloat( ) , fSavedRotY.tofloat( ) , fSavedRotZ.tofloat( ) );

        VehicleData[ iVehicleID ] <- { };   
        VehicleDataID[ iVehicleID ] <- iVehicleDataID;
        VehicleData[ iVehicleID ].iModelID <- iModelID.tointeger( );
        VehicleData[ iVehicleID ].iOwnerID <- iOwnerID.tointeger( );
        VehicleData[ iVehicleID ].iOwnerType <- iOwnerType.tointeger( );
        VehicleData[ iVehicleID ].iBuyPrice <- iBuyPrice.tointeger( );
        VehicleData[ iVehicleID ].iRentPrice <- iRentPrice.tointeger( );    
        VehicleData[ iVehicleID ].iRadioID <- iRadioID.tointeger( ); 
        VehicleData[ iVehicleID ].bSavedPosLock <- bSavedPosLock;
    }
}

function saveAllVehiclesToDatabase( ) {
    for(local i = 0 ; i < GlobalConfig.iMaxVehicles ; i++ ) {
        if( vehicleExists( i ) ) {
            if( VehicleDataID[ i ] != -1 ) {
                saveVehicleToDatabase( i );
            } else {
                addVehicleToDatabase( i );
            }
        }
    }
}

function saveVehicleToDatabase( iVehicleID ) {
    local pos = vehicleGetPosition( iVehicleID );
    local rot = vehicleGetRotation( iVehicleID );
    
    local iVehicleDataID = VehicleDataID[ iVehicleID ];
    
    iniSetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "iModelID" , VehicleData[ iVehicleID ].iModelID.tostring( ) );
    
    if( VehicleData[ iVehicleID ].bSavedPosLock == 0 ) {
        iniSetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "fSavedPosX" , pos[ 0 ].tostring( ) );
        iniSetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "fSavedPosY" , pos[ 1 ].tostring( ) );
        iniSetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "fSavedPosZ" , pos[ 2 ].tostring( ) );
        iniSetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "fSavedRotX" , rot[ 0 ].tostring( ) );
        iniSetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "fSavedRotY" , rot[ 1 ].tostring( ) );
        iniSetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "fSavedRotZ" , rot[ 2 ].tostring( ) );    
    }
    
    iniSetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "iOwnerType" , VehicleData[ iVehicleID ].iOwnerType.tostring( ) );   
    iniSetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "iOwnerID" , VehicleData[ iVehicleID ].iOwnerID.tostring( ) );    
    iniSetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "bLocked" , "0" );
    iniSetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "iRentPrice" , VehicleData[ iVehicleID ].iRentPrice.tostring( ) );
    iniSetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "iBuyPrice" , VehicleData[ iVehicleID ].iBuyPrice.tostring( ) );    
    iniSetParam( "data/vehicles/" + iVehicleDataID + ".ini" , "bSavedPosLock" , VehicleData[ iVehicleID ].bSavedPosLock.tostring( ) );    
}

function addPlayerToDatabase( iPlayerID ) {
    local iAccountID = getAccountFreeDataSlot( );
    
    iniCreateFile( "data/accounts/" + iAccountID + ".ini" );
    
    PlayerData[ iPlayerID ].iAccountID <- iAccountID;
    
    iniSetParam( "data/accountlist.ini" , getDataSafeName( playerGetName( iPlayerID ) ) , iAccountID.tostring( ) );
    
    savePlayerToDatabase( iPlayerID );
    
    iniSetParam( "data/accounts/" + iAccountID + ".ini" , "iRegisteredUnixTS" , time( ).tostring( ) );
    iniSetParam( "data/accounts/" + iAccountID + ".ini" , "fSavedPosX" , GlobalConfig.NewCharacter.fSpawnX.tostring( ) );
    iniSetParam( "data/accounts/" + iAccountID + ".ini" , "fSavedPosY" , GlobalConfig.NewCharacter.fSpawnY.tostring( ) );
    iniSetParam( "data/accounts/" + iAccountID + ".ini" , "fSavedPosZ" , GlobalConfig.NewCharacter.fSpawnZ.tostring( ) );    
    iniSetParam( "data/accounts/" + iAccountID + ".ini" , "fSavedRotA" , "0.0" );    
}

function savePlayerToDatabase( iPlayerID ) {
    // Make sure the player is logged in.
    if( !PlayerData[ iPlayerID ].bLoggedIn ) {
        return false;
    }

    // Make sure the player is spawned before saving their position
    // Use "bSpawned" because it only sets to true on position restore (5 seconds after spawning)
    // This way, we know they actually spawned and has their restored position set
    if( PlayerData[ iPlayerID ].bSpawned ) {
        local pos = playerGetPosition( iPlayerID );
        local rot = playerGetRotation( iPlayerID );
        
        iniSetParam( "data/accounts/" + PlayerData[ iPlayerID ].iAccountID + ".ini" , "fSavedPosX" , pos[ 0 ].tostring( ) );
        iniSetParam( "data/accounts/" + PlayerData[ iPlayerID ].iAccountID + ".ini" , "fSavedPosY" , pos[ 1 ].tostring( ) );
        iniSetParam( "data/accounts/" + PlayerData[ iPlayerID ].iAccountID + ".ini" , "fSavedPosZ" , pos[ 2 ].tostring( ) );    
        iniSetParam( "data/accounts/" + PlayerData[ iPlayerID ].iAccountID + ".ini" , "fSavedRotA" , rot.tostring( ) );           
    }
    
    iniSetParam( "data/accounts/" + PlayerData[ iPlayerID ].iAccountID + ".ini" , "szPlayerName" , playerGetName( iPlayerID ) );
    iniSetParam( "data/accounts/" + PlayerData[ iPlayerID ].iAccountID + ".ini" , "szPassword" , PlayerData[ iPlayerID ].szPassword ); 
    iniSetParam( "data/accounts/" + PlayerData[ iPlayerID ].iAccountID + ".ini" , "iStaffFlags" , PlayerData[ iPlayerID ].iStaffFlags.tostring( ) );
    iniSetParam( "data/accounts/" + PlayerData[ iPlayerID ].iAccountID + ".ini" , "szLastIP" , playerGetIP( iPlayerID ) );
    iniSetParam( "data/accounts/" + PlayerData[ iPlayerID ].iAccountID + ".ini" , "iSkinID" , playerGetSkinID( iPlayerID ).tostring( ) );
    iniSetParam( "data/accounts/" + PlayerData[ iPlayerID ].iAccountID + ".ini" , "iMoney" , playerGetMoney( iPlayerID ).tostring( ) );
    iniSetParam( "data/accounts/" + PlayerData[ iPlayerID ].iAccountID + ".ini" , "iFactionID" , PlayerData[ iPlayerID ].iFactionID.tostring( ) );
    iniSetParam( "data/accounts/" + PlayerData[ iPlayerID ].iAccountID + ".ini" , "iAccountSettings" , PlayerData[ iPlayerID ].iAccountSettings.tostring( ) );
    iniSetParam( "data/accounts/" + PlayerData[ iPlayerID ].iAccountID + ".ini" , "iGameSettings" , PlayerData[ iPlayerID ].iGameSettings.tostring( ) );
    
    return true;
}

function isPlayerRegistered( iPlayerID ) {
    local iAccountID = iniGetParam( "data/accountlist.ini" , getDataSafeName( playerGetName( iPlayerID ) ) , "-1" );
    
    iAccountID = iAccountID.tointeger( );
    
    if( !iAccountID ) {
        return false;
    }
    
    if( iAccountID == -1 ) {
        return false;
    }
    
    if( !iniFileExists( "data/accounts/" + iAccountID + ".ini" ) ) {
        return false;
    }
    
    return true;
}

function loadPlayerFromDatabase( iPlayerID ) {
    local iAccountID = iniGetParam( "data/accountlist.ini" , getDataSafeName( playerGetName( iPlayerID ) ) , "-1" );
    
    if( !iAccountID ) {
        return false;
    }
    
    iAccountID = iAccountID.tointeger( );
    
    if( iAccountID == -1 ) {
        return false;
    }
    
    if( !iniFileExists( "data/accounts/" + iAccountID + ".ini" ) ) {
        return false;
    }
    
    PlayerData[ iPlayerID ].iAccountID <- iAccountID;
    
    local fPosX = iniGetParam( "data/accounts/" + iAccountID + ".ini" , "fSavedPosX" , GlobalConfig.NewCharacter.fSpawnX.tostring( ) );
    local fPosY = iniGetParam( "data/accounts/" + iAccountID + ".ini" , "fSavedPosY" , GlobalConfig.NewCharacter.fSpawnY.tostring( ) );
    local fPosZ = iniGetParam( "data/accounts/" + iAccountID + ".ini" , "fSavedPosZ" , GlobalConfig.NewCharacter.fSpawnZ.tostring( ) );
    local fRotA = iniGetParam( "data/accounts/" + iAccountID + ".ini" , "fSavedRotA" , "0.0" );
    local iStaffFlags = iniGetParam( "data/accounts/" + iAccountID + ".ini" , "iStaffFlags" , "unknown" );
    local szLastIP = iniGetParam( "data/accounts/" + iAccountID + ".ini" , "szLastIP" , "unknown" );
    local iLastOnlineUnixTS = iniGetParam( "data/accounts/" + iAccountID + ".ini" , "iLastOnlineUnixTS" , "-1" );
    local iRegisterUnixTS = iniGetParam( "data/accounts/" + iAccountID + ".ini" , "iRegisteredUnixTS" , "-1" );
    local szPassword = iniGetParam( "data/accounts/" + iAccountID + ".ini" , "szPassword" , "unknown" );
    local iMoney = iniGetParam( "data/accounts/" + iAccountID + ".ini" , "iMoney" , "0" );
    local iSkinID = iniGetParam( "data/accounts/" + iAccountID + ".ini" , "iSkinID" , "0" );
    local iAccountSettings = iniGetParam( "data/accounts/" + iAccountID + ".ini" , "iAccountSettings" , "0" );
    local iGameSettings = iniGetParam( "data/accounts/" + iAccountID + ".ini" , "iGameSettings" , "0" );
    
    fPosX = fPosX.tofloat( );
    fPosY = fPosY.tofloat( );
    fPosZ = fPosZ.tofloat( );
    fRotA = fRotA.tofloat( );
    iStaffFlags = iStaffFlags.tointeger( );
    szLastIP = szLastIP.tostring( );
    iLastOnlineUnixTS = iLastOnlineUnixTS.tointeger( );
    iRegisterUnixTS = iRegisterUnixTS.tointeger( );
    szPassword = szPassword.tostring( );
    iMoney = iMoney.tointeger( );
    iSkinID = iSkinID.tointeger( );
    iAccountSettings = iAccountSettings.tointeger( );
    iGameSettings = iGameSettings.tointeger( );
    
    PlayerData[ iPlayerID ].iStaffFlags <- iStaffFlags
    PlayerData[ iPlayerID ].szLastIP <- szLastIP;
    PlayerData[ iPlayerID ].szPassword <- szPassword;
    PlayerData[ iPlayerID ].iSkinID <- iSkinID;
    PlayerData[ iPlayerID ].SavedPos <- [ fPosX , fPosY , fPosZ ];
    PlayerData[ iPlayerID ].iMoney <- iMoney;
    PlayerData[ iPlayerID ].SavedRot <- fRotA;
    PlayerData[ iPlayerID ].iLastOnlineUnixTS <- iLastOnlineUnixTS;
    PlayerData[ iPlayerID ].iRegisterUnixTS <- iLastOnlineUnixTS;
    PlayerData[ iPlayerID ].iAccountSettings <- iAccountSettings;
    PlayerData[ iPlayerID ].iGameSettings <- iGameSettings;
    
    return true;
}

function saveAllPlayersToDatabase( ) {
    for( local i = 0 ; i < serverGetMaxPlayers( ) ; i++ ) {
        if( playerIsConnected( i ) ) {
            if( !iniFileExists( "data/accounts/" + PlayerData[ i ].iAccountID + ".ini" ) ) {
                addPlayerToDatabase( i );
            }
            
            savePlayerToDatabase( i );
        }
    }
}

function createBitwiseTable( tablekeys ) {
    local temp_bitval = 0;
    local temp_bittable = { };

    foreach( ii , iv in tablekeys ) {
        temp_bittable[ iv ] <- temp_bitval;
        temp_bitval = 1 << temp_bitval;
    }

    return temp_bittable;
}

function playerRestoreSavedPosition( iPlayerID ) {
    playerSetPosition( iPlayerID , PlayerData[ iPlayerID ].SavedPos[ 0 ] , PlayerData[ iPlayerID ].SavedPos[ 1 ] , PlayerData[ iPlayerID ].SavedPos[ 2 ] );
}

function playerRestoreSavedRotation( iPlayerID ) {
    playerSetRotation( iPlayerID , PlayerData[ iPlayerID ].SavedRot );
}

function playerRestoreSavedMoney( iPlayerID ) {
    playerSetMoney( iPlayerID , PlayerData[ iPlayerID ].iMoney );
    playerEnableMoney( iPlayerID , PlayerData[ iPlayerID ].iMoney );
}

function playerRestoreSavedSkin( iPlayerID ) {
    playerChangeSkin( iPlayerID , PlayerData[ iPlayerID ].iSkinID );
}

function playerRestoreSavedWeapons( iPlayerID ) {
    
}

function loginSuccess( iPlayerID ) {
    PlayerData[ iPlayerID ].bLoggedIn <- true;

    //playerRestoreSavedPosition( iPlayerID );
    //playerRestoreSavedRotation( iPlayerID );
    //playerRestoreSavedSkin( iPlayerID );
    //playerRestoreSavedWeapons( iPlayerID );
    //playerRestoreSavedMoney( iPlayerID );
    
    playerLockControls( iPlayerID , true );   

    PlayerData[ iPlayerID ].iSpawnWaitTick <- iServerSecondTicks;
}

function checkSpawnRestoreCooldown( ) {
    for( local i = 0 ; i < serverGetMaxPlayers( ) ; i++ ) {
        if( playerIsConnected( i ) ) {
            if( PlayerData[ i ].bLoggedIn ) {
                if( !PlayerData[ i ].bSpawned ) {
                    checkPlayerSpawnRestoreCooldown( i );
                }
            }
        }
    }
}

function checkPlayerSpawnRestoreCooldown( iPlayerID ) {
    local iSecondsLeft = abs( ( PlayerData[ iPlayerID ].iSpawnWaitTick + ( GlobalConfig.iSpawnTickWait ) ) - iServerSecondTicks );
    
    if( iSecondsLeft > 0 ) {
        playerMessageAlert( iPlayerID , "Your spawn position will be restored in " + getSecondsText( iSecondsLeft )  );
        return 1;
    }
    
    if( PlayerData[ iPlayerID ].bNewlyRegistered ) {
        playerSetPosition( iPlayerID , GlobalConfig.NewCharacter.fSpawnX , GlobalConfig.NewCharacter.fSpawnY ,GlobalConfig.NewCharacter.fSpawnZ );
        savePlayerToDatabase( iPlayerID );
    } else {
        playerRestoreSavedPosition( iPlayerID );
        playerRestoreSavedRotation( iPlayerID );
        playerRestoreSavedSkin( iPlayerID );
        playerRestoreSavedWeapons( iPlayerID );
        playerRestoreSavedMoney( iPlayerID );    
    }
    
    playerLockControls( iPlayerID , false );
    PlayerData[ iPlayerID ].iSpawnWaitTick <- 0;
    PlayerData[ iPlayerID ].bSpawned <- true;
}

function getSecondsText( iSeconds ) {
    if( iSeconds == 1 ) {
        return "1 second";
    }
    
    return iSeconds + " seconds";
}

function checkServerSaveCooldown( ) {
    if( ( iServerSecondTicks - iLastServerSaveTick ) >= GlobalConfig.iServerSaveInterval ) {
        saveAllServerData( );
        iLastServerSaveTick <- iServerSecondTicks;
    }
}

function saveAllServerData( ) {
    saveAllVehiclesToDatabase( );
    saveAllPlayersToDatabase( );
}

function createPlayerDataSlot( iPlayerID ) {
    PlayerData[ iPlayerID ] <- { };
    PlayerData[ iPlayerID ].iAccountID <- -1;
    PlayerData[ iPlayerID ].Characters <- { };
    PlayerData[ iPlayerID ].CurrentCharacter <- { };
    PlayerData[ iPlayerID ].bSpawned <- false;
    PlayerData[ iPlayerID ].bMuted <- false;
    PlayerData[ iPlayerID ].iRadioID <- 0;
    PlayerData[ iPlayerID ].iStaffFlags <- StaffFlags.None;
    PlayerData[ iPlayerID ].iSkinID <- 0;
    PlayerData[ iPlayerID ].iMoney <- 0;
    PlayerData[ iPlayerID ].SavedPos <- [ 0.0 , 5.0 , 0.0 ];
    PlayerData[ iPlayerID ].SavedRot <- 0.0;
    PlayerData[ iPlayerID ].szPassword <- "test";
    PlayerData[ iPlayerID ].bLoggedIn <- false;
    PlayerData[ iPlayerID ].iSpawnWaitTick <- 0;
    PlayerData[ iPlayerID ].iFactionID <- 0;
    PlayerData[ iPlayerID ].iVehRentStart <- 0;
    PlayerData[ iPlayerID ].szLastIP <- "0.0.0.0";
    PlayerData[ iPlayerID ].iAccountSettings <- AccountSettings.None;
    PlayerData[ iPlayerID ].iGameSettings <- GameSettings.None;
    PlayerData[ iPlayerID ].bIsDead <- false;
    PlayerData[ iPlayerID ].bNewlyRegistered <- false;
}

function deletePlayerDataSlot( iPlayerID ) {
    PlayerData[ iPlayerID ] <- null;
}

function consoleMessage( szMessage ) {
    print( szMessage );
}

function getPlayerNameAndID( iPlayerID ) {
    return "Player " + playerGetName( iPlayerID ) + "[" + iPlayerID + "]";
}

function getOnlineAdmins( ) {
    local temp_admins = { };
    
    for( local i = 0 ; i < serverGetMaxPlayers( ) ; i++ ) {
        if( playerIsConnected( i ) ) {
            if( PlayerData[ i ].iStaffFlags != 0 ) {
                if( PlayerData[ i ].bLoggedIn ) {
                    temp_admins[ i ] <-  { };
                    temp_admins[ i ].szPlayerName <- playerGetName( i );
                    temp_admins[ i ].szStaffTitle <- iniGetParam( "data/stafftitles.ini" , getDataSafeName( playerGetName( i ) ) , "Unknown" );
                }
            }
        }
    }
    
    return temp_admins;
}

function doesIPMatch( szIP1 , szIP2 ) {
    if( szIP1 == szIP2 ) {
        return true;
    }
    
    return false;
}

function loadGlobalConfig( ) {
    GlobalConfig.fVehicleSpawnDistance <- iniGetParam( "data/globalconfig.ini" , "fVehicleSpawnDistance" , "5.0" ).tofloat( );
    GlobalConfig.fVehicleTrunkDistance <- iniGetParam( "data/globalconfig.ini" , "fVehicleTrunkDistance" , "3.0" ).tofloat( );
    GlobalConfig.NewCharacter.iAccountSettings <- iniGetParam( "data/globalconfig.ini" , "iDefaultAccountSettings" , "0" ).tointeger( );
    GlobalConfig.NewCharacter.iStaffFlags <- iniGetParam( "data/globalconfig.ini" , "iDefaultStaffFlags" , "0" ).tointeger( );
    GlobalConfig.NewCharacter.iGameSettings <- iniGetParam( "data/globalconfig.ini" , "iDefaultGameSettings" , "0" ).tointeger( );
    GlobalConfig.szServerName <- iniGetParam( "data/globalconfig.ini" , "szServerName" , "Unknown" ).tostring( );
}

function resyncIndexIniFile( ) {
    return true;
}

function getDataSafeName( szNormalName ) {
    local szSplitName = split( szNormalName , " " );
    local szSafeName = "";
    
    if( szSplitName.len( ) > 1 ) {
        foreach( ii , iv in szSplitName ) {
            if( szSafeName.len( ) == 0 ) {
                szSafeName = iv;
            } else {
                szSafeName = szSafeName + "_" + iv;
            }
        }
        
        return szSafeName;
    }
    
    return szNormalName;
}
