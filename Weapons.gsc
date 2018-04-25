Saber_Default_Hero()
{
	self endon("death");
	self endon("disconnect");
	self thread Saber_Block();
	self thread Saber_Melee(120);
    self giveWeapon("knife_ballistic_mp",0,true(44,0,0,0,0));
	self givemaxammo("knife_ballistic_mp");
	self SwitchToWeapon("knife_ballistic_mp");
	self.jediblocking = false;
	//playFxOnTag(level.FXGreenSaber, self, "tag_weapon_right");
	while(true)
	{
	 	self waittill("weapon_fired");
	 	self.jediblocking = false;
	 	if (self.force >= 30)
	 	{
	 		self.force -= 30;
	 		self thread Saber_Throw(95, 100, 100, 600);
	 		wait 3;
	 	}
	 	else
	 	{ self iprintln("You need more force for that!"); wait .1; }
	}
}
Saber_MaceWindo()
{
	self endon("death");
	self endon("disconnect");
	self thread Saber_Melee(130);
    self giveWeapon("knife_ballistic_mp",0,true(44,0,0,0,0));
	self givemaxammo("knife_ballistic_mp");
	self SwitchToWeapon("knife_ballistic_mp");
	self.jediblocking = false;
	//playFxOnTag(level.FXGreenSaber, self, "tag_weapon_right");
	while(true)
	{
	 	self waittill("weapon_fired");
	 	self.jediblocking = false;
	 	if (self.force >= 45)
	 	{
	 		self.force -= 45;
	 		self thread Saber_Throw(125, 100, 100, 750);
	 		wait 3;
	 	}
	 	else
	 	{ self iprintln("You need more force for that!"); wait .1; }
	}
}
Saber_Obiwan()
{
	self endon("death");
	self endon("disconnect");
	self thread Saber_Melee(145);
    self giveWeapon("knife_ballistic_mp",0,true(44,0,0,0,0));
	self givemaxammo("knife_ballistic_mp");
	self SwitchToWeapon("knife_ballistic_mp");
	self.jediblocking = false;
	//playFxOnTag(level.FXGreenSaber, self, "tag_weapon_right");
	while(true)
	{
	 	self waittill("weapon_fired");
	 	self.jediblocking = false;
	 	if (self.force >= 25)
	 	{
	 		self.force -= 25;
	 		self thread Saber_Throw(95, 90, 90, 350);
	 		wait 3;
	 	}
	 	else
	 	{ self iprintln("You need more force for that!"); wait .1; }
	}
}
Saber_Yoda()
{
	self endon("death");
	self endon("disconnect");
	self thread Saber_Block();
	self thread Saber_Melee(80);
    self giveWeapon("knife_ballistic_mp",0,true(44,0,0,0,0));
	self givemaxammo("knife_ballistic_mp");
	self SwitchToWeapon("knife_ballistic_mp");
	self.jediblocking = false;
	//playFxOnTag(level.FXGreenSaber, self, "tag_weapon_right");
	while(true)
	{
	 	self waittill("weapon_fired");
	 	self.jediblocking = false;
	 	if (self.force >= 30)
	 	{
	 		self.force -= 30;
	 		self thread Saber_Throw(115, 120, 120, 900);
	 		wait 3;
	 	}
	 	else
	 	{ self iprintln("You need more force for that!"); wait .1; }
	}
}
Saber_Rey()
{
	self endon("death");
	self endon("disconnect");
	self thread Saber_Block();
	self thread Saber_Melee(105);
    self giveWeapon("knife_ballistic_mp",0,true(44,0,0,0,0));
	self givemaxammo("knife_ballistic_mp");
	self SwitchToWeapon("knife_ballistic_mp");
	self.jediblocking = false;
	//playFxOnTag(level.FXGreenSaber, self, "tag_weapon_right");
	while(true)
	{
	 	self waittill("weapon_fired");
	 	self.jediblocking = false;
	 	if (self.force >= 20)
	 	{
	 		self.force -= 20;
	 		self thread Saber_Throw(99, 100, 100, 625);
	 		wait 3;
	 	}
	 	else
	 	{ self iprintln("You need more force for that!"); wait .1; }
	}
}
// RadiusDamamge_ModSaber(target, radius, dammage, weapon, canhurtself)
Saber_Throw(damage, range, radius, maxdis)
{
	playfx(level.FXSaberAfterStrike, DisTraceShot(maxdis));
	for(x = 50; x <= maxdis; x += 70)
	{
		RadiusDamamge_ModSaber(DisTraceShot(x), radius, damage, "hatchet_mp", false);
	}
}
Saber_Block()
{
	self endon("death");
	self endon("disconnect");
	while(true)
	{
		if(self throwbuttonpressed() && !self meleebuttonpressed()) 
		{
			self.jediblocking = true;
			self iprintlnbold("Blocking!");
		}
		else
		{
			self.jediblocking = false;
		}
		wait .1;
	}
}
Saber_Melee(range)
{
	self endon("death");
	self endon("disconnect");
	while(true)
	{
		if(self meleebuttonpressed() && self.currentWeapon == "knife_ballistic_mp")
		{
			RadiusDamamge_ModSaber(DisTraceShot(range), 100, 190, "proximity_grenade_mp" , false);
			wait 2;
		}
		wait .05;
	}
}
Balistic_KickBack()
{
	self endon("death");
	self endon("disconnect");
	self giveWeapon("sig556_mp+stalker",0,true(15,0,0,0,0));
	while(1)
	{
		self waittill("weapon_fired");
		if (self.currentWeapon == "sig556_mp+stalker")
		{
			RadiusDamage(self TraceShot(),170,60,50,self);
		}
		wait .05;
	}
}
Balistic_Blaster()
{
	self endon("death");
	self endon("disconnect");
	self giveWeapon("fiveseven_mp+extbarrel",0,true(12,0,0,0,0));
	while(1)
	{
		self waittill("weapon_fired");
		if (self.currentWeapon == "fiveseven_mp+extbarrel")
		{
			RadiusDamage(self TraceShot(),65,125,50,self);
		}
		wait .05;
	}
}
Balistic_Slinger()
{
	self endon("death");
	self endon("disconnect");
	self giveWeapon("fnp45_mp+extbarrel",0,true(12,0,0,0,0));
	while(1)
	{
		self waittill("weapon_fired");
		if (self.currentWeapon == "fnp45_mp+extbarrel")
		{
			RadiusDamage(self TraceShot(),80,100,50,self);
		}
		self givemaxammo(self getcurrentweapon());
		wait .05;
	}
}
Balistic_BowCaster()
{
	self endon("death");
	self endon("disconnect");
	self giveWeapon("crossbow_mp+reflex",0,true(12,0,0,0,0));
	self.bowcharge = 0;
	self thread Balistic_BowCaster_Charger();
	while(true)
	{
		self waittill("weapon_fired");
		if (self.currentWeapon == "crossbow_mp+reflex")
		{
			if (self.bowcharge > 0)
			{ self thread Balistic_BowCaster_Payload(self.bowcharge); }
			else { self iprintln("Plese AIM to charge the bowcaster for powerful effect!"); }
			wait .5;
		}
		wait .05;
	}
}
Balistic_BowCaster_Charger()
{
	self endon("death");
	self endon("disconnect");
	while(true)
	{
		if(self adsbuttonpressed() && self.bowcharge < 30) { self.bowcharge++; }
		else if (self adsbuttonpressed()) { self playlocalsound("wpn_grenade_pull_pin");}
		else if (self.bowcharge > 0) { self.bowcharge--; }
		wait .05;
	}
}
Balistic_BowCaster_Payload(a)
{
	self endon("death");
	self endon("disconnect");
	MagicBullet("m32_wager_mp",self getEye(),self TraceShot(),self);
	wait .05;
	x = 5;
	if (a < 10) { return; }
	else if (a < 20) { x = 4; }
	else if (a < 30) { x = 2; } 
	else { x = 0; }
	for(b = x;b<6;b++)
	{
		MagicBullet("m32_wager_mp",self getEye(),self ModTraceShot(2),self);
		wait .05;
	}
}
DefineWeapondataarray()
{
	level.AttachmentArray = [];
	level.AttachmentArray[0] = "silencer"; //Suppressor
	level.AttachmentArray[1] = "dualoptic"; //Hybrid Optic
	level.AttachmentArray[2] = "extbarrel"; //Long Barrel
	level.AttachmentArray[3] = "fastads"; //Quickdraw
	level.AttachmentArray[4] = "grip"; //Fore Grip
	level.AttachmentArray[5] = "holo"; //EOTech
	level.AttachmentArray[6] = "mms"; //MMS
	level.AttachmentArray[7] = "rangefinder"; //Target Finder
	level.AttachmentArray[8] = "reflex"; //Reflex Sight
	level.AttachmentArray[9] = "rf"; //Rapid Fire
	level.AttachmentArray[10] = "stackfire"; //Tri-Bolt
	level.AttachmentArray[11] = "stalker"; //Stock
	level.AttachmentArray[12] = "tacknife"; //Tactical Knife
	level.AttachmentArray[13] = "extclip"; //Extended Clip
	level.AttachmentArray[14] = "fmj"; //FMJ
	level.AttachmentArray[15] = "steadyaim"; //Laser
	level.AttachmentArray[16] = "vzoom"; //Variable Zoom
	level.AttachmentArray[17] = "acog"; //ACOG
	level.AttachmentArray[18] = "dualclip"; //Fast Mag
	level.AttachmentArray[19] = "ir"; //Dual Band
	level.AttachmentArray[20] = "is"; //?
	level.AttachmentArray[21] = "swayreduc"; //Ballistics CPU
	//level.AttachmentArray[11] = "sf"; //Select Fire
	//level.AttachmentArray[4] = "gl"; //Grenade Launcher
	level.WeaponArray2 = [];
	level.WeaponArray2[0] = "frag_grenade_mp";
	level.WeaponArray2[1] = "sticky_grenade_mp";
	level.WeaponArray2[2] = "hatchet_mp";
	level.WeaponArray2[3] = "bouncingbetty_mp";
	level.WeaponArray2[4] = "satchet_charge_mp";
	level.WeaponArray2[5] = "claymore_mp";
	
	level.WeaponArray3 = [];
	level.WeaponArray3[0] = "concussion_grenade_mp";
	level.WeaponArray3[1] = "willy_pete_mp";
	level.WeaponArray3[2] = "sensor_grenade_mp";
	level.WeaponArray3[3] = "emp_grenade_mp";
	level.WeaponArray3[4] = "proximity_grenade_mp";
	level.WeaponArray3[5] = "pda_hack_mp";
	level.WeaponArray3[6] = "flash_grenade_mp";
	level.WeaponArray3[7] = "trophy_system_mp";
	level.WeaponArray3[8] = "tactical_insertion_mp";
	
	level.WeaponArray = [];
	level.WeaponArray[0] = "mp7_mp";
	level.WeaponArray[1] = "pdw57_mp";
	level.WeaponArray[2] = "vector_mp";
	level.WeaponArray[3] = "insas_mp";
	level.WeaponArray[4] = "qcw05_mp";
	level.WeaponArray[5] = "evoskorpion_mp";
	level.WeaponArray[6] = "peacekeeper_mp";
	level.WeaponArray[7] = "tar21_mp";
	level.WeaponArray[8] = "type95_mp";
	level.WeaponArray[9] = "sig556_mp";
	level.WeaponArray[10] = "sa58_mp";
	level.WeaponArray[11] = "hk416_mp";
	level.WeaponArray[12] = "scar_mp";
	level.WeaponArray[13] = "saritch_mp";
	level.WeaponArray[14] = "xm8_mp";
	level.WeaponArray[15] = "an94_mp";
	level.WeaponArray[16] = "870mcs_mp";
	level.WeaponArray[17] = "saiga12_mp";
	level.WeaponArray[18] = "ksg_mp";
	level.WeaponArray[19] = "srm1216_mp";
	level.WeaponArray[20] = "mk48_mp";
	level.WeaponArray[21] = "qbb95_mp";
	level.WeaponArray[22] = "lsat_mp";
	level.WeaponArray[23] = "hamr_mp";
	
	level.WeaponArray[24] = "kard_mp";	
	level.WeaponArray[25] = "fnp45_mp";
	level.WeaponArray[26] = "beretta93r_mp";
	level.WeaponArray[27] = "judge_mp";
	level.WeaponArray[28] = "fiveseven_mp";
	level.WeaponArray[29] = "svu_mp";
	level.WeaponArray[30] = "dsr50_mp";
	level.WeaponArray[31] = "ballista_mp";
	level.WeaponArray[32] = "as50_mp";
	level.WeaponArray[33] = "crossbow_mp";	
	level.WeaponArray[34] = "fiveseven_dw_mp";
	level.WeaponArray[35] = "fnp45_dw_mp";
	level.WeaponArray[36] = "beretta93r_dw_mp";
	level.WeaponArray[37] = "judge_dw_mp";
	level.WeaponArray[38] = "kard_dw_mp";
	level.WeaponArray[39] = "smaw_mp";
	level.WeaponArray[40] = "usrpg_mp";
	level.WeaponArray[41] = "knife_ballistic_mp";
	
	level.WeaponArray[42] = "fhj18_mp";
	level.WeaponArray[43] = "minigun_wager_mp";
	level.WeaponArray[44] = "m32_wager_mp";
	
	//level.WeaponArray[41] = "riotshield_mp";
}
// Saber_Throw(damage, range, radius, maxdis)
Saber_Darth_Vader()
{
	self endon("death");
	self endon("disconnect");
	self thread Saber_Melee(130);
    self giveWeapon("knife_ballistic_mp",0,true(44,0,0,0,0));
	self givemaxammo("knife_ballistic_mp");
	self SwitchToWeapon("knife_ballistic_mp");
	self.jediblocking = false;
	//playFxOnTag(level.FXRedSaber, self, "tag_weapon_right");
	while(true)
	{
	 	self waittill("weapon_fired");
	 	self.jediblocking = false;
	 	if (self.force >= 25)
	 	{
	 		self.force -= 25;
	 		self thread Saber_Throw(110, 110, 120, 650);
	 		wait 3;
	 	}
	 	else
	 	{ self iprintln("You need more force for that!"); wait .1; }
	}
}
Saber_General_Grevious()
{
	self endon("death");
	self endon("disconnect");
	self thread Saber_Block();
    self giveWeapon("knife_ballistic_mp",0,true(44,0,0,0,0));
	self givemaxammo("knife_ballistic_mp");
	self SwitchToWeapon("knife_ballistic_mp");
	self.jediblocking = false;
	//playFxOnTag(level.FXRedSaber, self, "tag_weapon_right");
	while(true)
	{
		if(self meleebuttonpressed() && self.currentWeapon == "knife_ballistic_mp")
		{
			RadiusDamamge_ModSaber(self.origin, 175, 999, "proximity_grenade_mp" , false);
			wait 2;
		}
		wait .05;
	}
}
Saber_Default_Villian()
{
	self endon("death");
	self endon("disconnect");
	self thread Saber_Block();
	self thread Saber_Melee(120);
    self giveWeapon("knife_ballistic_mp",0,true(44,0,0,0,0));
	self givemaxammo("knife_ballistic_mp");
	self SwitchToWeapon("knife_ballistic_mp");
	self.jediblocking = false;
	//playFxOnTag(level.FXRedSaber, self, "tag_weapon_right");
	while(true)
	{
	 	self waittill("weapon_fired");
	 	self.jediblocking = false;
	 	if (self.force >= 30)
	 	{
	 		self.force -= 30;
	 		self thread Saber_Throw(95, 100, 100, 600);
	 		wait 3;
	 	}
	 	else
	 	{ self iprintln("You need more force for that!"); wait .1; }
	}
}
Saber_Count_Doku()
{
	self endon("death");
	self endon("disconnect");
	self thread Saber_Block();
	self thread Saber_Melee(105);
    self giveWeapon("knife_ballistic_mp",0,true(18,0,0,0,0));
	self givemaxammo("knife_ballistic_mp");
	self SwitchToWeapon("knife_ballistic_mp");
	self.jediblocking = false;
	//playFxOnTag(level.FXRedSaber, self, "tag_weapon_right");
	while(true)
	{
	 	self waittill("weapon_fired");
	 	self.jediblocking = false;
	 	if (self.force >= 25)
	 	{
	 		self.force -= 25;
	 		self thread Saber_Throw(100, 100, 110, 800);
	 		wait 3;
	 	}
	 	else
	 	{ self iprintln("You need more force for that!"); wait .1; }
	}
}
Saber_AnakinSkywalker()
{
	self endon("death");
	self endon("disconnect");
	self thread Saber_Block();
	self thread Saber_Melee(135);
    self giveWeapon("knife_ballistic_mp",0,true(44,0,0,0,0));
	self givemaxammo("knife_ballistic_mp");
	self SwitchToWeapon("knife_ballistic_mp");
	self.jediblocking = false;
	//playFxOnTag(level.FXRedSaber, self, "tag_weapon_right");
	while(true)
	{
	 	self waittill("weapon_fired");
	 	self.jediblocking = false;
	 	if (self.force >= 22)
	 	{
	 		self.force -= 22;
	 		self thread Saber_Throw(85, 90, 90, 500);
	 		wait 3;
	 	}
	 	else
	 	{ self iprintln("You need more force for that!"); wait .1; }
	}
}
