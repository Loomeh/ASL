/************************** Created by Austin 'Auddy' Davenport **************************
************************ Special thanks to the JSRF Modding Team ************************/

//  Jet Set Radio Future Timer

state("cxbxr-ldr")
{
	int fight : 0x1E69D0;						// Enemy defeat / End of Any% & PJ%
	int mission : 0x254F6C, 0x0, 0x88, 0x1A8;	// The mission number
	int newGameStart : 0x25A4C4; 				// Start of a New Game
	int igt : 0x27B1CC;							// The In Game Timer
}

state("cxbx")
{
	int fight : 0x1E69D0;						// Enemy defeat / End of Any% & PJ%
	int mission : 0x254F6C, 0x0, 0x88, 0x1A8;	// The mission number for English
	int newGameStart : 0x25A4C4; 				// Start of a New Game
	int igt : 0x27B1CC;							// The In Game Timer
}

state("jsrf_data_container")
{
	int changeCount : 0x7A20;					// Change count
	ushort cutscene: 0x7A26;					// Cutscenes
	ushort mission : 0x7A24;					// The mission number
	int igt : 0x7A2C;							// The In Game Timer
}

init
{
	// Set initial values
	vars.gameMode = 0;	// Set the game mode to None = 0, Any% = 1, Souls% = 2 or PJ% = 3
}

startup
{
	settings.CurrentDefaultParent = null;
	settings.Add("gameMode",true, "Game Modes");
	settings.SetToolTip("gameMode", "Do not uncheck this box");
	
	// Any%
	settings.CurrentDefaultParent = "gameMode";
	settings.Add("Any", true, "Any%");
	settings.SetToolTip("Any", "Check this Option if you want to run Any%");
	
	settings.CurrentDefaultParent = "Any";
	settings.Add("splitsAny", true, "Autosplitter");
	settings.SetToolTip("splitsAny", "Check this Option if you want to use the Autosplitting feature.  You can choose your Splits below");
	
	settings.CurrentDefaultParent = "splitsAny";
	settings.Add("missionsAny", true, "Missions");
	settings.SetToolTip("missionsAny", "Check this Option if you want to Autosplit on Missions");
	
	settings.CurrentDefaultParent = "missionsAny";
	settings.Add("garageAny",true,"Garage");
	settings.Add("beatAny",false,"Beat Race");
	settings.Add("dogenAny",true,"Dogenzaka Hill");
	settings.Add("comboAny",false,"Combo Challenge");
	settings.Add("shibuyaAny",true,"Shibuya Terminal");
	settings.Add("tanksAny",false,"Tanks/Hayashi Fight");
	settings.Add("chuoAny",true,"Chuo Street");
	settings.Add("rdhCopsAny",false,"RDH Cop Fight");
	settings.Add("rdhAny",true,"Rokkaku Dai Heights");
	settings.Add("99LightAny",false,"99th Light Side");
	settings.Add("99DarkAny",false,"99th Dark Side");
	settings.Add("99Any",true,"99th Street");
	settings.Add("sewersAny",true,"Sewers");
	settings.Add("bottomAny",true,"Bottom Point");
	settings.Add("hikageTerrorAny",false,"Terror Drone Fight");
	settings.Add("hikageCopsAny",false,"Left & Right Cop Fights");
	settings.Add("hikageAny",true,"Hikage Street");
	settings.Add("kiboAny",true,"Kibogaoka Hill");
	settings.Add("sdppCopsAny",false,"SDPP Cop Fight");
	settings.Add("sdppAny",true,"Skyscraper District");
	settings.Add("highwayAny",true,"Highway Zero");
	settings.Add("doomAny",false,"Doom Riders Race");
	settings.Add("immortalsAny",false,"Immortals Race");
	settings.Add("deathballAny",true,"Death Ball");
	settings.Add("noiseDogenAny",false,"Noise Tank Cleanup Dogen");
	settings.Add("noiseShibuyaAny",false,"Noise Tank Cleanup Shibuya");
	settings.Add("noiseChuoAny",false,"Noise Tank Cleanup Chuo");
	settings.Add("noiseRDHAny",false,"Noise Tank Cleanup RDH");
	settings.Add("noiseAny",true,"Noise Tank Cleanup");
	settings.Add("skydinoAny",true,"Sky Dinosaurian Square");
	settings.Add("frzBlueAny",false,"FRZ Blue Devices");
	settings.Add("frzRedAny",false,"FRZ Red Devices");
	settings.Add("frzAny",true,"Fortified Residential Zone");
	settings.Add("clawAny",true,"Claw");
	settings.Add("flameAny",true,"Flame");
	settings.Add("trainAny",true,"Train");
	settings.Add("zerobeatAny",true,"Zero Beat");
	settings.Add("akumuAny",true,"A.KU.MU (always active)");
	
	// Souls%
	settings.CurrentDefaultParent = "gameMode";
	settings.Add("Souls", false, "Souls%");
	settings.SetToolTip("Souls", "Check this Option if you want to run Souls%");
	
	settings.CurrentDefaultParent = "Souls";
	settings.Add("splitsSouls", true, "Autosplitter");
	settings.SetToolTip("splitsSouls", "Check this Option if you want to use the Autosplitting feature.  You can choose your Splits below");
	
	settings.CurrentDefaultParent = "splitsSouls";
	settings.Add("missionsSouls", true, "Missions");
	settings.SetToolTip("missionsSouls", "Check this Option if you want to Autosplit on splits");
	
	settings.CurrentDefaultParent = "missionsSouls";
	settings.Add("garageSouls",true,"Garage");
	settings.Add("beatSouls",false,"Beat Race");
	settings.Add("dogenSouls",true,"Dogenzaka Hill");
	settings.Add("comboSouls",false,"Combo Challenge");
	settings.Add("shibuyaSouls",true,"Shibuya Terminal");
	settings.Add("tanksSouls",false,"Tanks/Hayashi Fight");
	settings.Add("chuoSouls",true,"Chuo Street");
	settings.Add("rdhCopsSouls",false,"RDH Cop Fight");
	settings.Add("rdhSouls",true,"Rokkaku Dai Heights");
	settings.Add("99LightSouls",false,"99th Light Side");
	settings.Add("99DarkSouls",false,"99th Dark Side");
	settings.Add("99Souls",true,"99th Street");
	settings.Add("sewersSouls",true,"Sewers");
	settings.Add("bottomSouls",true,"Bottom Point");
	settings.Add("hikageTerrorSouls",false,"Terror Drone Fight");
	settings.Add("hikageCopsSouls",false,"Left & Right Cop Fights");
	settings.Add("hikageSouls",true,"Hikage Street");
	settings.Add("kiboSouls",true,"Kibogaoka Hill");
	settings.Add("sdppCopsSouls",false,"SDPP Cop Fight");
	settings.Add("sdppSouls",true,"Skyscraper District");
	settings.Add("highwaySouls",true,"Highway Zero");
	settings.Add("doomSouls",false,"Doom Riders Race");
	settings.Add("immortalsSouls",false,"Immortals Race");
	settings.Add("deathballSouls",true,"Death Ball");
	settings.Add("noiseDogenSouls",true,"Noise Tank Cleanup Dogen");
	settings.Add("noiseShibuyaSouls",true,"Noise Tank Cleanup Shibuya");
	settings.Add("noiseChuoSouls",true,"Noise Tank Cleanup Chuo");
	settings.Add("noiseRDHSouls",true,"Noise Tank Cleanup RDH");
	settings.Add("noiseSouls",true,"Noise Tank Cleanup");
	settings.Add("skydinoSouls",true,"Sky Dinosaurian Square");
	settings.Add("frzBlueSouls",false,"FRZ Blue Devices");
	settings.Add("frzRedSouls",false,"FRZ Red Devices");
	settings.Add("frzSouls",true,"Fortified Residential Zone");
	settings.Add("clawSouls",true,"Claw");
	settings.Add("frz2Souls",true,"Fortified Residential Zone 2");
	settings.Add("sewers2Souls",true,"Sewers 2");
	settings.Add("flameSouls",true,"Flame");
	settings.Add("trainSouls",true,"Train");
	settings.Add("zerobeatSouls",true,"Zero Beat");
	settings.Add("akumuSouls",true,"A.KU.MU (always active)");
	
	// PJ%
	settings.CurrentDefaultParent = "gameMode";
	settings.Add("PJ", false, "PJ%");
	settings.SetToolTip("PJ", "Check this Option if you want to run PJ%");
	
	settings.CurrentDefaultParent = "PJ";
	settings.Add("splitsPJ", true, "Autosplitter");
	settings.SetToolTip("splitsPJ", "Check this Option if you want to use the Autosplitting feature.  You can choose your Splits below");
	
	settings.CurrentDefaultParent = "splitsPJ";
	settings.Add("missionsPJ", true, "Missions");
	settings.SetToolTip("missionsPJ", "Check this Option if you want to Autosplit on Missions");
	
	settings.CurrentDefaultParent = "missionsPJ";
	settings.Add("garagePJ",true,"Garage");
	settings.Add("beatPJ",false,"Beat Race");
	settings.Add("dogenPJ",true,"Dogenzaka Hill");
	settings.Add("comboPJ",false,"Combo Challenge");
	settings.Add("shibuyaPJ",true,"Shibuya Terminal");
	settings.Add("tanksPJ",false,"Tanks/Hayashi Fight");
	settings.Add("chuoPJ",true,"Chuo Street");
	settings.Add("rdhCopsPJ",false,"RDH Cop Fight");
	settings.Add("rdhPJ",true,"Rokkaku Dai Heights");
	settings.Add("99LightPJ",false,"99th Light Side");
	settings.Add("99DarkPJ",false,"99th Dark Side");
	settings.Add("99PJ",true,"99th Street");
	settings.Add("sewersPJ",true,"Sewers");
	settings.Add("bottomPJ",true,"Bottom Point (always active)");
}

start
{
	// Settings for New Game start Any%
	if(((current.mission == 90 && current.newGameStart == 65537 && old.newGameStart == 65536) ||
	   (current.mission == 90 && current.newGameStart == 65537 && old.newGameStart == 0) ||
	   (current.mission == 101 && current.changeCount != old.changeCount)) && settings["Any"]){
		vars.gameMode = 1;	// Set game mode
		return true;
	}
	
	// Settings for New Game start Souls%
	if(((current.mission == 90 && current.newGameStart == 65537 && old.newGameStart == 65536) ||
	   (current.mission == 90 && current.newGameStart == 65537 && old.newGameStart == 0) ||
	   (current.mission == 101 && current.changeCount != old.changeCount)) && settings["Souls"]){
		vars.gameMode = 2;	// Set game mode
		return true;
	}
	
	// Settings for New Game start PJ%
	if(((current.mission == 90 && current.newGameStart == 65537 && old.newGameStart == 65536) ||
	   (current.mission == 90 && current.newGameStart == 65537 && old.newGameStart == 0) ||
	   (current.mission == 101 && current.changeCount != old.changeCount)) && settings["PJ"]){
		vars.gameMode = 3;	// Set game mode
		return true;
	}
}

gameTime
{
	// In Game Time
	if(current.igt != old.igt && vars.gameMode != 4){
		return TimeSpan.FromSeconds(current.igt*.01666666666666666666666666666667);
	}
}

isLoading
{
	// Loading screens
	if(current.igt == old.igt){
		return true;
	}
}

split
{
	// Any%
	if((vars.gameMode == 1) &&
	(((current.mission == 65732 && old.mission == 65537) || (current.mission == 196 && old.mission == 101)) && settings["garageAny"])
	||
	(((current.mission == 65648 && old.mission == 65646) || (current.mission == 112 && old.mission == 110)) && settings["beatAny"])
	||
	(((current.mission == 65656 && old.mission == 65636) || (current.mission == 120 && old.mission == 100)) && settings["dogenAny"])
	||
	(((current.mission == 65659 && old.mission == 65657) || (current.mission == 123 && old.mission == 121)) && settings["comboAny"])
	||
	(((current.mission == 131168 && old.mission == 65658) || (current.mission == 296 && old.mission == 122)) && settings["shibuyaAny"])
	||
	(((current.mission == 131302 && old.mission == 131303) || (current.mission == 230 && old.mission == 231)) && settings["tanksAny"])
	||
	(((current.mission == 131312 && old.mission == 131272) || (current.mission == 240 && old.mission == 200)) && settings["chuoAny"])
	||
	(((current.mission == 131312 && old.mission == 131313) || (current.mission == 240 && old.mission == 241)) && settings["rdhCopsAny"])
	||
	(((current.mission == 131322 && old.mission == 131272) || (current.mission == 250 && old.mission == 200)) && settings["rdhAny"])
	||
	(((current.mission == 131322 && old.mission == 131323) || (current.mission == 250 && old.mission == 251)) && settings["99LightAny"])
	||
	(((current.mission == 131324 && old.mission == 131322) || (current.mission == 252 && old.mission == 250)) && settings["99DarkAny"])
	||
	(((current.mission == 196704 && old.mission == 131324) || (current.mission == 396 && old.mission == 252)) && settings["99Any"])
	||
	(((current.mission == 196978 && old.mission == 196968) || (current.mission == 370 && old.mission == 360)) && settings["sewersAny"])
	||
	(((current.mission == 262240 && old.mission == 196978) || (current.mission == 496 && old.mission == 370)) && settings["bottomAny"])
	||
	(((current.mission == 262594 && old.mission == 262595) || (current.mission == 450 && old.mission == 451)) && settings["hikageTerrorAny"])
	||
	(((current.mission == 262594 && old.mission == 262596) || (current.mission == 450 && old.mission == 452)) && settings["hikageCopsAny"])
	||
	(((current.mission == 262604 && old.mission == 262574) || (current.mission == 460 && old.mission == 430)) && settings["hikageAny"])
	||
	(((current.mission == 262614 && old.mission == 262584) || (current.mission == 470 && old.mission == 440)) && settings["kiboAny"])
	||
	(((current.mission == 262614 && old.mission == 262615) || (current.mission == 470 && old.mission == 471)) && settings["sdppCopsAny"])
	||
	(((current.mission == 262624 && old.mission == 262614) || (current.mission == 480 && old.mission == 470)) && settings["sdppAny"])
	||
	(((current.mission == 327776 && old.mission == 262624) || (current.mission == 596 && old.mission == 480)) && settings["highwayAny"])
	||
	(((current.mission == 328190 && old.mission == 328191) || (current.mission == 510 && old.mission == 511)) && settings["doomAny"])
	||
	(((current.mission == 328190 && old.mission == 328192) || (current.mission == 510 && old.mission == 512)) && settings["immortalsAny"])
	||
	(((current.mission == 393312 && old.mission == 328194) || (current.mission == 696 && old.mission == 514)) && settings["deathballAny"])
	||
	(((current.mission == 393826 && old.mission == 393836) || (current.mission == 610 && old.mission == 620)) && settings["noiseDogenAny"])
	||
	(((current.mission == 393831 && old.mission == 393826) || (current.mission == 615 && old.mission == 610)) && settings["noiseShibuyaAny"])
	||
	(((current.mission == 393846 && old.mission == 393816) || (current.mission == 630 && old.mission == 600)) && settings["noiseChuoAny"])
	||
	(((current.mission == 393871 && old.mission == 393816) || (current.mission == 655 && old.mission == 600)) && settings["noiseRDHAny"])
	||
	(((current.mission == 393876 && old.mission == 393891) || (current.mission == 660 && old.mission == 675)) && settings["noiseAny"])
	||
	(((current.mission == 458848 && old.mission == 393876) || (current.mission == 796 && old.mission == 660)) && settings["skydinoAny"])
	||
	(((current.mission == 459502 && current.fight == 2064 && old.fight == 1040) || (current.mission == 750 && current.cutscene == 83 && old.cutscene == 82)) && settings["frzBlueAny"])
	||
	(((current.mission == 459504 && old.mission == 459502) || (current.mission == 752 && old.mission == 750)) && settings["frzRedAny"])
	||
	(((current.mission == 524384 && old.mission == 459503) || (current.mission == 896 && old.mission == 751)) && settings["frzAny"])
	||
	(((current.mission == 525158 && old.mission == 525163) || (current.mission == 870 && old.mission == 875)) && settings["clawAny"])
	||
	(((current.mission == 525168 && old.mission == 525163) || (current.mission == 880 && old.mission == 875)) && settings["flameAny"])
	||
	(((current.mission == 525186 && old.mission == 525168) || (current.mission == 898 && old.mission == 880)) && settings["trainAny"])
	||
	(((current.mission == 525099 && old.mission == 525100) || (current.mission == 811 && old.mission == 812)) && settings["zerobeatAny"])
	||
	(((current.mission == 525178 && current.fight == 80 && old.fight == 48) || (current.mission == 890 && current.cutscene == 102 && old.cutscene == 101)) && settings["akumuAny"])
	){
		return true;
	}
	
	// Souls%
	if((vars.gameMode == 2) &&
	(((current.mission == 65732 && old.mission == 65537) || (current.mission == 196 && old.mission == 101)) && settings["garageSouls"])
	||
	(((current.mission == 65648 && old.mission == 65646) || (current.mission == 112 && old.mission == 110)) && settings["beatSouls"])
	||
	(((current.mission == 65656 && old.mission == 65636) || (current.mission == 120 && old.mission == 100)) && settings["dogenSouls"])
	||
	(((current.mission == 65659 && old.mission == 65657) || (current.mission == 123 && old.mission == 121)) && settings["comboSouls"])
	||
	(((current.mission == 131168 && old.mission == 65658) || (current.mission == 296 && old.mission == 122)) && settings["shibuyaSouls"])
	||
	(((current.mission == 131302 && old.mission == 131303) || (current.mission == 230 && old.mission == 231)) && settings["tanksSouls"])
	||
	(((current.mission == 131312 && old.mission == 131272) || (current.mission == 240 && old.mission == 200)) && settings["chuoSouls"])
	||
	(((current.mission == 131312 && old.mission == 131313) || (current.mission == 240 && old.mission == 241)) && settings["rdhCopsSouls"])
	||
	(((current.mission == 131322 && old.mission == 131272) || (current.mission == 250 && old.mission == 200)) && settings["rdhSouls"])
	||
	(((current.mission == 131322 && old.mission == 131323) || (current.mission == 250 && old.mission == 251)) && settings["99LightSouls"])
	||
	(((current.mission == 131324 && old.mission == 131322) || (current.mission == 252 && old.mission == 250)) && settings["99DarkSouls"])
	||
	(((current.mission == 196704 && old.mission == 131324) || (current.mission == 396 && old.mission == 252)) && settings["99Souls"])
	||
	(((current.mission == 196978 && old.mission == 196968) || (current.mission == 370 && old.mission == 360)) && settings["sewersSouls"])
	||
	(((current.mission == 262240 && old.mission == 196978) || (current.mission == 496 && old.mission == 370)) && settings["bottomSouls"])
	||
	(((current.mission == 262594 && old.mission == 262595) || (current.mission == 450 && old.mission == 451)) && settings["hikageTerrorSouls"])
	||
	(((current.mission == 262594 && old.mission == 262596) || (current.mission == 450 && old.mission == 452)) && settings["hikageCopsSouls"])
	||
	(((current.mission == 262604 && old.mission == 262574) || (current.mission == 460 && old.mission == 430)) && settings["hikageSouls"])
	||
	(((current.mission == 262614 && old.mission == 262584) || (current.mission == 470 && old.mission == 440)) && settings["kiboSouls"])
	||
	(((current.mission == 262614 && old.mission == 262615) || (current.mission == 470 && old.mission == 471)) && settings["sdppCopsSouls"])
	||
	(((current.mission == 262624 && old.mission == 262614) || (current.mission == 480 && old.mission == 470)) && settings["sdppSouls"])
	||
	(((current.mission == 327776 && old.mission == 262624) || (current.mission == 596 && old.mission == 480)) && settings["highwaySouls"])
	||
	(((current.mission == 328190 && old.mission == 328191) || (current.mission == 510 && old.mission == 511)) && settings["doomSouls"])
	||
	(((current.mission == 328190 && old.mission == 328192) || (current.mission == 510 && old.mission == 512)) && settings["immortalsSouls"])
	||
	(((current.mission == 393312 && old.mission == 328194) || (current.mission == 696 && old.mission == 514)) && settings["deathballSouls"])
	||
	(((current.mission == 393826 && old.mission == 393836) || (current.mission == 610 && old.mission == 620)) && settings["noiseDogenSouls"])
	||
	(((current.mission == 393831 && old.mission == 393826) || (current.mission == 615 && old.mission == 610)) && settings["noiseShibuyaSouls"])
	||
	(((current.mission == 393846 && old.mission == 393816) || (current.mission == 630 && old.mission == 600)) && settings["noiseChuoSouls"])
	||
	(((current.mission == 393871 && old.mission == 393816) || (current.mission == 655 && old.mission == 600)) && settings["noiseRDHSouls"])
	||
	(((current.mission == 393876 && old.mission == 393891) || (current.mission == 660 && old.mission == 675)) && settings["noiseSouls"])
	||
	(((current.mission == 458848 && old.mission == 393876) || (current.mission == 796 && old.mission == 660)) && settings["skydinoSouls"])
	||
	(((current.mission == 459502 && current.fight == 2064 && old.fight == 1040) || (current.mission == 750 && current.cutscene == 83 && old.cutscene == 82)) && settings["frzBlueSouls"])
	||
	(((current.mission == 459504 && old.mission == 459502) || (current.mission == 752 && old.mission == 750)) && settings["frzRedSouls"])
	||
	(((current.mission == 524384 && old.mission == 459503) || (current.mission == 896 && old.mission == 751)) && settings["frzSouls"])
	||
	(((current.mission == 525138 && old.mission == 525123) || (current.mission == 850 && old.mission == 835)) && settings["clawSouls"])
	||
	(((current.mission == 525123 && old.mission == 525138) || (current.mission == 835 && old.mission == 850)) && settings["frz2Souls"])
	||
	(((current.mission == 525158 && old.mission == 525163) || (current.mission == 870 && old.mission == 875)) && settings["sewers2Souls"])
	||
	(((current.mission == 525168 && old.mission == 525163) || (current.mission == 880 && old.mission == 875)) && settings["flameSouls"])
	||
	(((current.mission == 525186 && old.mission == 525168) || (current.mission == 898 && old.mission == 880)) && settings["trainSouls"])
	||
	(((current.mission == 525099 && old.mission == 525100) || (current.mission == 811 && old.mission == 812)) && settings["zerobeatSouls"])
	||
	(((current.mission == 525178 && current.fight == 80 && old.fight == 48) || (current.mission == 890 && current.cutscene == 102 && old.cutscene == 101)) && settings["akumuSouls"])
	){
		return true;
	}
	
	// PJ%
	if((vars.gameMode == 3) &&
	(((current.mission == 65732 && old.mission == 65537) || (current.mission == 196 && old.mission == 101)) && settings["garagePJ"])
	||
	(((current.mission == 65648 && old.mission == 65646) || (current.mission == 112 && old.mission == 110)) && settings["beatPJ"])
	||
	(((current.mission == 65656 && old.mission == 65636) || (current.mission == 120 && old.mission == 100)) && settings["dogenPJ"])
	||
	(((current.mission == 65659 && old.mission == 65657) || (current.mission == 123 && old.mission == 121)) && settings["comboPJ"])
	||
	(((current.mission == 131168 && old.mission == 65658) || (current.mission == 296 && old.mission == 122)) && settings["shibuyaPJ"])
	||
	(((current.mission == 131302 && old.mission == 131303) || (current.mission == 230 && old.mission == 231)) && settings["tanksPJ"])
	||
	(((current.mission == 131312 && old.mission == 131272) || (current.mission == 240 && old.mission == 200)) && settings["chuoPJ"])
	||
	(((current.mission == 131312 && old.mission == 131313) || (current.mission == 240 && old.mission == 241)) && settings["rdhCopsPJ"])
	||
	(((current.mission == 131322 && old.mission == 131272) || (current.mission == 250 && old.mission == 200)) && settings["rdhPJ"])
	||
	(((current.mission == 131322 && old.mission == 131323) || (current.mission == 250 && old.mission == 251)) && settings["99LightPJ"])
	||
	(((current.mission == 131324 && old.mission == 131322) || (current.mission == 252 && old.mission == 250)) && settings["99DarkPJ"])
	||
	(((current.mission == 196704 && old.mission == 131324) || (current.mission == 396 && old.mission == 252)) && settings["99PJ"])
	||
	(((current.mission == 196978 && old.mission == 196968) || (current.mission == 370 && old.mission == 360)) && settings["sewersPJ"])
	||
	(((current.mission == 196979 && current.fight == 16 && old.fight == 0) || (current.mission == 371 && current.cutscene == 65534 && old.cutscene == 65535)) && settings["bottomPJ"])
	){
		return true;
	}
}

reset
{
	// Reset if we are on the Main Menu
	if((current.mission == 90 && old.mission != 90) || (current.mission == 65535 && old.mission != 65535)){
		vars.gameMode = 0;
		return true;
	}
}
