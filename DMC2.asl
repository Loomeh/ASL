/***************************** Created by Austin 'Auddy' Davenport ******************************************/

//  Devil May Cry 2 - Full Game Timer

state("dmc2")
{
	int finalCutsceneD : 0xF2A648;	// Cutscene for Dante's the final boss
	int finalCutsceneL : 0x158AF98;	// Cutscene for Lucia's the final boss
	int level : 0x157D288;			// The level number
	int newGameStartD : 0xF12C20; 	// Start of a New Game run for Dante
	int newGameStartL : 0x1588A30;	// Start of a New Game run for Lucia
	int nowLoading : 0x7DB46C;		// The Now Loading screens
	int plusStart : 0x1588BB8; 		// Start of a New Game+ run for Dante and also Reset value
	int shatter : 0x157D2B0;		// Shatter screens, but actually bonus points
}

start
{
	// Settings for Dante New Game Start
	if(current.newGameStartD == 32 && old.newGameStartD != 32){
		return true;
	}
	
	// Settings for Lucia New Game Start
	if(current.newGameStartL == 131330 && old.newGameStartL == 258){
		return true;
	}
	
	// Settings for New Game+ Start
	if(current.plusStart != 0 && old.plusStart == 0){
		return true;
	}
}

split
{
	// Split if a bullet screen is active
	if(current.shatter != 0 && old.shatter == 0){
		return true;
	}
	
	// Split if the death cutscene for the final boss for Dante plays
	if(current.finalCutsceneD != 0 && old.finalCutsceneD == 0 && current.level == 4609){
		return true;
	}
	
	// Split if the death cutscene for the final boss for Lucia plays
	if(current.finalCutsceneL != 0 && old.finalCutsceneL == 0 && current.level == 3329){
		return true;
	}
}

isLoading
{
	// Pause the timer if the Now Loading screen is on
	if(current.nowLoading != 0){
		return true;
	}
	else{
		return false;
	}
}

reset
{
	// Reset if we are on the Main Menu
	if(current.plusStart == 0 && current.newGameStartL == 258){
		return true;
	}
}
