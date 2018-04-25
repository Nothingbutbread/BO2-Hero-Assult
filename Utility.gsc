TraceShot()
{
	return bulletTrace(self getEye(), self getEye()+vectorScale(anglesToForward(self getPlayerAngles()), 1000000), false, self)["position"];
}
DisTraceShot(in)
{
	return bulletTrace(self getEye(), self getEye()+vectorScale(anglesToForward(self getPlayerAngles()), in), false, self)["position"];
}
RadiusDamamge_Mod(target, radius, dammage, weapon, canhurtself)
{
	foreach(player in level.players) 
	{
		if (Distance(target, player.origin) <= radius)
		{
			if (!canhurtself && player == self) { } // Do Nothing
			else if (canhurtself && player == self) { player DoDamage(dammage, player.origin, self, self, "none", "MOD_PROJECTILE_SPLASH", 0, weapon); }
			else if (level.isteambasedmode && player.pers[ "team" ] != self.pers[ "team" ]) { player DoDamage(dammage, player.origin, self, self, "none", "MOD_PROJECTILE_SPLASH", 0, weapon); }
			else if (!level.isteambasedmode) { player DoDamage(dammage, player.origin, self, self, "none", "MOD_PROJECTILE_SPLASH", 0, weapon); }
		}
	}
}
RadiusDamamge_ModSaber(target, radius, dammage, weapon, canhurtself)
{
	foreach(player in level.players) 
	{
		if (Distance(target, player.origin) <= radius)
		{
			if (!canhurtself && player == self) { } // Do Nothing
			else if (canhurtself && player == self) { player DoDamage(dammage, player.origin, self, self, "none", "MOD_PROJECTILE_SPLASH", 0, weapon); }
			else if (level.isteambasedmode && player.pers[ "team" ] != self.pers[ "team" ] && !player.jediblocking) { player DoDamage(dammage, player.origin, self, self, "none", "MOD_PROJECTILE_SPLASH", 0, weapon); }
			else if (!level.isteambasedmode && !player.jediblocking) { player DoDamage(dammage, player.origin, self, self, "none", "MOD_PROJECTILE_SPLASH", 0, weapon); }
		}
	}
}
DisModTraceShot(degree, lim)
{
	angle = self getPlayerAngles();
	adjustx = RandomIntRange(degree * -1, degree);
	adjusty = RandomIntRange(degree * -1, degree);
	temp = angle[0] + adjustx;
	if (temp < 0)
	{
		temp = NoN(temp);
		temp = 360 - temp;
	}
	else if (temp >= 360)
		temp -= 360;
	adjustx = temp;
	temp = angle[1] + adjusty;
	if (temp < 0)
	{
		temp = NoN(temp);
		temp = 360 - temp;
	}
	else if (temp >= 360)
		temp -= 360;
	adjusty = temp;
	angle = (adjustx, adjusty, angle[2]);
	return bulletTrace(self getEye(), self getEye()+vectorScale(anglesToForward(angle), lim), false, self)["position"];
}
ModTraceShot(degree)
{
	angle = self getPlayerAngles();
	adjustx = RandomIntRange(degree * -1, degree);
	adjusty = RandomIntRange(degree * -1, degree);
	temp = angle[0] + adjustx;
	if (temp < 0)
	{
		temp = NoN(temp);
		temp = 360 - temp;
	}
	else if (temp >= 360)
		temp -= 360;
	adjustx = temp;
	temp = angle[1] + adjusty;
	if (temp < 0)
	{
		temp = NoN(temp);
		temp = 360 - temp;
	}
	else if (temp >= 360)
		temp -= 360;
	adjusty = temp;
	angle = (adjustx, adjusty, angle[2]);
	return bulletTrace(self getEye(), self getEye()+vectorScale(anglesToForward(angle), 1000000), false, self)["position"];
}
NoN(num)
{
	if (num >= 0)
		return num;
	return num * -1;
}
BlankLoadout()
{
	self.maxhealth = 100;
	self.health = 100;
	self.force = 100;
	self.isusingforcejump = false;
	self setmovespeedscale(1);
	self SetClientUIVisibilityFlag("g_compassShowEnemies", 0);
	self takeAllWeapons();
	self ClearPerks();
	self SetActionSlot(1, "");
	self SetActionSlot(2, "");
	self SetActionSlot(3, "");
	self SetActionSlot(4, "");
	self GiveWeapon("knife_mp");
	self setperk("specialty_unlimitedsprint");
	self setperk("specialty_fallheight");
}
Giveallperks()
{
	self ClearPerks();
	self setperk("specialty_bulletflinch");
	self setperk("specialty_bulletpenetration");
	self setperk("specialty_deadshot");
	self setperk("specialty_delayexplosive");
	self setperk("specialty_detectexplosive");
	self setperk("specialty_disarmexplosive");
	self setperk("specialty_earnmoremomentum");
	self setperk("specialty_explosivedamage");
	self setperk("specialty_extraammo");
	self setperk("specialty_fallheight");
	self setperk("specialty_fastads");
	self setperk("specialty_fastequipmentuse");
	self setperk("specialty_fastladderclimb");
	self setperk("specialty_fastmantle");
	self setperk("specialty_fastmeleerecovery");
	self setperk("specialty_fastreload");
	self setperk("specialty_fasttoss");
	self setperk("specialty_fastweaponswitch");
	self setperk("specialty_fireproof");
	self setperk("specialty_flakjacket");
	self setperk("specialty_flashprotection");
	self setperk("specialty_gpsjammer");
	self setperk("specialty_grenadepulldeath");
	self setperk("specialty_healthregen");
	self setperk("specialty_holdbreath");
	self setperk("specialty_immunecounteruav");
	self setperk("specialty_immuneemp");
	self setperk("specialty_immunemms");
	self setperk("specialty_immunenvthermal");
	self setperk("specialty_immunerangefinder");
	self setperk("specialty_killstreak");
	self setperk("specialty_longersprint");
	self setperk("specialty_loudenemies");
	self setperk("specialty_marksman");
	self setperk("specialty_movefaster");
	self setperk("specialty_nomotionsensor");
	self setperk("specialty_noname");
	self setperk("specialty_nottargetedbyairsupport");
	self setperk("specialty_nokillstreakreticle");
	self setperk("specialty_nottargettedbysentry");
	self setperk("specialty_pin_back");
	self setperk("specialty_pistoldeath");
	self setperk("specialty_proximityprotection");
	self setperk("specialty_quickrevive");
	self setperk("specialty_quieter");
	self setperk("specialty_reconnaissance");
	self setperk("specialty_rof");
	self setperk("specialty_scavenger");
	self setperk("specialty_showenemyequipment");
	self setperk("specialty_stunprotection");
	self setperk("specialty_shellshock");
	self setperk("specialty_sprintrecovery");
	self setperk("specialty_showonradar");
	self setperk("specialty_stalker");
	self setperk("specialty_twogrenades");
	self setperk("specialty_twoprimaries");
	self setperk("specialty_unlimitedsprint");
	self setmovespeedscale(1.2);
	self SetClientUIVisibilityFlag("g_compassShowEnemies", 1);
}
isdateambasedgamemode()
{
	a = GetDvar("g_gametype");
	if (a == "oic" || a == "dm" || a == "gun" || a == "sas" || a == "shrp") { return false; }
	return true;
}
adjustForce(add, ammout)
{
	if (add) { self.force += ammout; }
	else { self.force -= ammout; }
	if (self.force > 100) { self.force = 100; }
	else if (self.force < 0) { self.force = 0; }
}
Forge_Spawn_Object(model, origin, angle)
{
	obj = spawnEntity(model, origin, angle);
}
spawnEntity(model, origin, angle)
{
	if (!isdefined(angle)) { angle = (0,0,0); }
    entity = spawn("script_model", origin);
    entity.angles = angle;
    entity setModel(model);
    return entity;
}
