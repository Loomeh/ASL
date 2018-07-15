/***************************** Created by Austin 'Auddy' Davenport ******************************************/

//  Devil May Cry 3: Special Editon / HD Collection - Full Game Timer

state("dmc3")
{
	int bulletScreenHD : 0xCF2718;  			// Bullet screens at the end of missions
	int falseStartHD : 0xC90DF8, 0x40; 			// New Game+ start on mission select
	int finalBossHealthHD : 0xC90FC0, 0xEB28;	// The final boss health
	int levelHD : 0xC8F250;  					// The number of the level we are on
	int loadingScreenHD : 0x5D93E0;				// The loading screens
	int mainMenuHD : 0xC9DDC4;					// The main menu screen
	int menuTransitionHD : 0xC0CBB0;			// Main menu transitions
	int NGStartHD : 0x5CF9F0; 					// New Game start after hitting Gold on the menu
	int plusStartHD : 0x5D95DC; 				// New Game+ start on mission select
}

state("dmc3se")
{
	int bulletScreen : 0x205CF14;  		// Bullet screens at the end of missions
	int danteBossHealth : 0x19BF1F4; 	// Dante's health when you fight him as Vergil
	int level : 0x381494;  				// The number of the level we are on
	int loadingScreen : 0x76BB20;  		// The black loading screens
	int menu : 0x70D2E0; 				// The menu in general, changes numbers on different menus / inventory screens
	int NGStart : 0x70D2DC; 			// New Game start after hitting Gold on the menu
	int plusStart : 0x188EDB4; 			// New Game+ start on mission select
	int vergilBossHealth : 0x1A1B1F4;  	// Vergil's health when you fight him as Dante
}

init
{
	vars.bulletSplit = 0;
}

startup
{
	settings.Add("version",true, "Version");
	settings.SetToolTip("version", "Do not uncheck this box");
	
	settings.CurrentDefaultParent = "version";
	settings.Add("HD", true, "HD");
	settings.SetToolTip("HD", "Check this option if you are running the HD Collection version of DMC3");
	
	settings.CurrentDefaultParent = "version";
	settings.Add("SE", false, "SE");
	settings.SetToolTip("SE", "Check this option if you are running the Special Edition version of DMC3");
	
	settings.CurrentDefaultParent = null;
	settings.Add("options",true, "Options");
	settings.CurrentDefaultParent = "options";
	settings.Add("Load Remover",true,"Load Remover");
	settings.SetToolTip("Load Remover", "Check this Option if you want to use the Load Remover feature");
}

start
{
	// Settings for DMC3HD
	if(settings["HD"]){
		// Settings for New Game Start
		if(current.NGStartHD == 5 && old.NGStartHD == 4 && current.levelHD == 1 && current.falseStartHD != 1 && current.mainMenuHD != 0){
			vars.bulletSplit = 0;
			return true;
		}
		
		// Settings for New Game+ Start
		if(current.plusStartHD == 344 && old.plusStartHD == 272 && current.mainMenuHD != 650 && current.menuTransitionHD != 37476){
			vars.bulletSplit = 0;
			return true;
		}
	}

	/************************************************************************************/
	
	// Settings for DMC3SE
	if(settings["SE"]){
		// Settings for New Game Start
		if(current.NGStart == 7 && old.NGStart == 0 && current.level == 1){
			vars.bulletSplit = 0;
			return true;
		}
	
		// Settings for New Game+ Start
		if(current.plusStart == 1 && old.plusStart == 0){
			vars.bulletSplit = 0;
			return true;
		}
	}
}

split
{
	// Settings for DMC3HD
	if(settings["HD"]){
		// Split if a bullet screen is active for Dante
		if(current.bulletScreenHD != 0 && old.bulletScreenHD == 0){
			vars.bulletSplit = 1;
			return true;
		}
		
		// Split if new level starts
		if(current.levelHD > old.levelHD && vars.bulletSplit == 0){
			return true;
		}
	
		// Split if we kill the final boss
		if((current.finalBossHealthHD < 1000000000 && old.finalBossHealthHD > 1000000000 && current.levelHD == 20) ||
		   (current.finalBossHealthHD == 3212836864 && old.finalBossHealthHD > 1000000000 && current.levelHD == 20)){
			return true;
		}
	}

	/************************************************************************************/
	
	// Settings for DMC3SE
	if(settings["SE"]){
		// Split if a bullet screen is active for Dante
		if(current.bulletScreen != 0 && old.bulletScreen == 0){
			vars.bulletSplit = 1;
			return true;
		}
	
		// Split if new level starts
		if(current.level > old.level && vars.bulletSplit == 0){
			return true;
		}
	
		// Split if we kill Vergil
		if((current.vergilBossHealth < 1000000000 && old.vergilBossHealth > 1100000000 && current.level == 20) ||
	       (current.vergilBossHealth == 3212836864 && old.vergilBossHealth > 1000000000 && current.level == 20)){
			return true;
		}
	
		// Split if we kill Dante
		if((current.danteBossHealth < 1000000000 && old.danteBossHealth > 1100000000 && current.level == 20) ||
	       (current.danteBossHealth == 3212836864 && old.danteBossHealth > 1000000000 && current.level == 20)){
			return true;
		}
	}
}

isLoading
{
	// Settings for DMC3HD
	if(settings["HD"]){
		if(current.loadingScreenHD == 72){
			return true;
		}
		else{
			return false;
		}
	}
	
	/************************************************************************************/
	
	// Settings for DMC3SE
	if(settings["SE"]){
		if(current.loadingScreen == 1){
			return true;
		}
		else{
			return false;
		}
	}
}
