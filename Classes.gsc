// Class slots: Weapon, Jump Power, Utility Ability, Utility Attack.
UseClass()
{
	if (self.heroclass == "Luke Skywalker") { self thread LukeSkyWalker(); }
	else if (self.heroclass == "Rey") { self thread Rey(); }
	else if (self.heroclass == "Han Solo") { self thread HanSolo(); }
	else if (self.heroclass == "Chewbacca") { self thread Chewbacca(); }
	else if (self.heroclass == "Mace Windo") { self thread MaceWindo(); }
	else if (self.heroclass == "Obi Wan") { self thread ObiWan(); }
	else if (self.heroclass == "Yoda") { self thread Yoda(); }
	else if (self.heroclass == "Darth Vader") { self thread DarthVader(); }
	else if (self.heroclass == "Boba Fett") { self thread BobaFett(); } 
	else if (self.heroclass == "Jango Fett") { self thread JangoFett(); }
	else if (self.heroclass == "Anakin Skywalker") { self thread AnakinSkywalker(); }
	else if (self.heroclass == "Count Doku") { self thread CountDoku(); } 
	else if (self.heroclass == "The Emporer") { self thread Paluptine(); }
	else if (self.heroclass == "General Grevious") { self thread GeneralGrevious(); }
}
// Villians
BobaFett()
{
	self BlankLoadout();
	self setperk("specialty_fastads");
	self setperk("specialty_fastreload");
	self.curspeed = 1.2;
	self setmovespeedscale(1.2);
	self thread Balistic_KickBack();
	self thread Power_Balistic_Rocket_Launcher();
	self thread Power_JetPack();
	self thread Power_Regenerate_Force(8);
	self thread Power_Unlimited_Ammo();
}
JangoFett()
{
	self BlankLoadout();
	self setperk("specialty_fastads");
	self setperk("specialty_fastreload");
	self.curspeed = 1.3;
	self setmovespeedscale(1.3);
	self thread Balistic_Slinger();
	self thread Power_Balistic_Rocket_Launcher();
	self thread Power_JetPack();
	self thread Power_Regenerate_Force(7);
	self thread Power_Unlimited_Ammo();
}
DarthVader()
{
	self BlankLoadout();
	self.curspeed = 1;
	self thread Saber_Darth_Vader();
	self thread Power_ForceJump();
	self thread Power_Regenerate_Force(4);
	self thread Power_Force_Choke();
	self thread Power_Unlimited_Ammo();
}
Paluptine()
{
	self BlankLoadout();
	self.curspeed = 1;
	self thread Saber_Default_Villian();
	self thread Power_ForceJump();
	self thread Power_Regenerate_Force(4);
	self thread Power_Force_Lightning();
	self thread Power_Unlimited_Ammo();
}
AnakinSkywalker()
{
	self BlankLoadout();
	self.curspeed = 1.05;
	self setmovespeedscale(1.05);
	self thread Saber_AnakinSkywalker();
	self thread Power_ForceJump();
	self thread Power_Regenerate_Force(4);
	self thread Power_Force_Pull();
	self thread Power_Unlimited_Ammo();
}
GeneralGrevious()
{
	self BlankLoadout();
	self.curspeed = 1.65;
	self setmovespeedscale(1.65);
	self.SideHUDForce setValue(100);
	self thread Saber_General_Grevious();
	self thread Power_Utility_Posion();
}
CountDoku()
{
	self BlankLoadout();
	self.curspeed = 1;
	self thread Saber_Count_Doku();
	self thread Power_ForceJump();
	self thread Power_Regenerate_Force(3);
	self thread Power_Force_Lightning();
	self thread Power_Unlimited_Ammo();
}
// Heros
Chewbacca()
{
	self BlankLoadout();
	self setperk("specialty_fastads");
	self setperk("specialty_fastreload");
	self.curspeed = 1;
	self setmovespeedscale(1);
	self.maxhealth = 250;
	self.health = 250;
	self.SideHUDForce setValue(100);
	self thread Balistic_BowCaster();
	self thread Power_Utility_Rally();
	self thread Power_Unlimited_Ammo();
}
HanSolo()
{
	self BlankLoadout();
	self setperk("specialty_fastads");
	self setperk("specialty_fastreload");
	self.curspeed = 1.35;
	self setmovespeedscale(1.35);
	self.maxhealth = 125;
	self.health = 125;
	self.SideHUDForce setValue(100);
	self thread Balistic_Blaster();
	self thread Power_Utility_Rally();
	self thread Power_Unlimited_Ammo();
}
LukeSkyWalker()
{
	self BlankLoadout();
	self.curspeed = 1;
	self thread Saber_Default_Hero();
	self thread Power_ForceJump();
	self thread Power_Regenerate_Force(4);
	self thread Power_Force_Pull();
	self thread Power_Unlimited_Ammo();
}
Rey()
{
	self BlankLoadout();
	self.curspeed = 1;
	self thread Saber_Rey();
	self thread Power_ForceJump();
	self thread Power_Regenerate_Force(5);
	self thread Power_Force_Black_Hole();
	self thread Power_Unlimited_Ammo();
}
ObiWan()
{
	self BlankLoadout();
	self.curspeed = 1;
	self thread Saber_Obiwan();
	self thread Power_ForceJump();
	self thread Power_Regenerate_Force(4);
	self thread Power_Force_Pull();
	self thread Power_Unlimited_Ammo();
}
Yoda()
{
	self BlankLoadout();
	self.curspeed = 1.1;
	self setmovespeedscale(1.1);
	self thread Saber_Yoda();
	self thread Power_ForceJump();
	self thread Power_Regenerate_Force(3);
	self thread Power_Force_Black_Hole();
	self thread Power_Unlimited_Ammo();
}
MaceWindo()
{
	self BlankLoadout();
	self.curspeed = 1;
	self thread Saber_MaceWindo();
	self thread Power_ForceJump();
	self thread Power_Regenerate_Force(3);
	self thread Power_Force_Slam();
	self thread Power_Unlimited_Ammo();
}

