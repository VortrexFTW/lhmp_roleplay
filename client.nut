fLastRender <- clock();
bCustomCameraEnabled <- false;
bServerStuffLoaded <- false;
iCurrentFPS <- 0;

function onRender() {
	iCurrentFPS = 1000/((1000*clock())-fLastRender);
	if(!bServerStuffLoaded) {
		if(iCurrentFPS >= 30) {
			callServerFunc("server.nut", "clientGameStarted", true);
			bServerStuffLoaded = true;
		}
	}
	
	if(bCustomCameraEnabled) {
		local pos = getPosition();
		local rotation = getRotation();
		
		local result = atan2(rotation[2], rotation[0])*180.0 / PI;
		result = (360.0 - 90.0) - result;
		
		local behind = getPosBehindPos(pos[0], pos[1], pos[2], degreesToRadians(result), 4.0);
		cameraLookAtFrom(behind[0], behind[1]+3, behind[2], pos[0], pos[1]+2.5, pos[2]);
	}
	
	fLastRender = (1000*clock());
}

function getPosBehindPos( fX , fY , fZ , fAngle , fDistance ) {

    local fX2 = ( fX + ( ( cos( -fAngle + ( PI / 2 ) ) ) * fDistance ) );
    local fZ2 = ( fZ + ( ( sin( -fAngle + ( PI / 2 ) ) ) * fDistance ) );
    
    return [ fX2 , fY , fZ2 ];
}

function degreesToRadians( fDegrees ) {
    return fDegrees * ( PI / 180 );
}