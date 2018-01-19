/***************************** Game values found by Dread | Modified by Austin 'Auddy' Davenport & Wipefinger ******************************************/

//  Resident Evil 5: Full Game Timer

state("re5dx9")
{
	int levelNumber : 0x00DA1E38, 0x124;
	float igt : 0xDA2124, 0x27758;
}

init
{
	vars.totalGameTime = 0;
}

start
{
	if(current.levelNumber == 0 && current.igt > old.igt){
		vars.totalGameTime = 0;
		return true;
	}
}

split
{
	if(current.levelNumber > old.levelNumber){
		return true;
		vars.totalGameTime = 0;
	}
}

isLoading
{
	if(current.igt == old.igt){
		return true;
	}
}

gameTime
{
	if(current.igt > old.igt){
		return TimeSpan.FromSeconds(System.Math.Floor(current.igt));
	}
	
	if(current.igt == 0 && old.igt > 0){
		vars.totalGameTime = System.Math.Floor(vars.totalGameTime + old.igt);
		return TimeSpan.FromSeconds(vars.totalGameTime);
	}
}