Power_JetPack()
{
	self endon("death");
	self endon("disconnect");
	self iprintln("^2Jet Pack Online!\n^7Hold [{+gostand}] to use!");
	while(true)
	{
		if(self jumpbuttonpressed()){
			if(self getvelocity()[2] < 300 && self.force > 0){
				self setvelocity(self getvelocity() +(0,0,75));
				self.force--;
				self.isusingforcejump = true;
			}
			else { self iprintln("Out of force!"); }
		}
		else { self.isusingforcejump = false; }
		wait .1;
	}
}
Power_ForceJump()
{
	self endon("death");
	self endon("disconnect");
	self iprintln("^2Hold [{+gostand}] to use force jump!");
	while(true)
	{
		if(self jumpbuttonpressed()){
			if(self getvelocity()[2] < 300 && self.force > 0){
				self setvelocity(self getvelocity() +(0,0,80));
				self.force--;
				self.isusingforcejump = true;
			}
			else { self iprintln("Out of force!"); }
		}
		else { self.isusingforcejump = false; }
		wait .1;
	}
}
Power_Regenerate_Force(a)
{
	self endon("death");
	self endon("disconnect");
	if (!isDefined(a)) { a = 4; }
	while(true)
	{
		if (!self.isusingforcejump){
			self.force += a;
		}
		if (self.force > 100) { self.force = 100; }
		self.SideHUDForce setValue(self.force);
		wait 1;
	}
}
Power_Unlimited_Ammo()
{
	self endon("death");
	self endon("disconnect");
	while(true)
	{
		self giveMaxAmmo(self.currentWeapon);
		wait 1;
	}
}
Power_Force_Pull()
{
	self endon("death");
	self endon("disconnect");
	while(true)
	{
		if (self.force >= 35 && self fragbuttonpressed())
		{
			o = self TraceShot();
			count = 0;
			foreach(player in level.players) 
			{
				if (Distance(o, player.origin) <= 200)
				{
					if (player == self) { } // Do Nothing
					else if (level.isteambasedmode && player.pers[ "team" ] != self.pers[ "team" ]) { player setorigin(self.origin); count++; }
					else if (!level.isteambasedmode) { player setorigin(self.origin); count++; }
				}
			}
			if (count == 0)
			{ self.force -= 10; self iprintlnbold("No targets were hit, force cost of attack reduced!"); }
			else { self.force -= 35; }
			wait 2;
		}
		wait .1;
	}
}
Power_Force_Choke()
{
	self endon("death");
	self endon("disconnect");
	while(true)
	{
		if (self.force >= 8 && self fragbuttonpressed())
		{
			self.force -= 8;
			o = self TraceShot();
			o2 = self DisTraceShot(250);
			foreach(player in level.players) 
			{
				if (Distance(o, player.origin) <= 175 || Distance(o2, player.origin) <= 250)
				{
					if (player == self) { continue; } // Do Nothing
					else if (level.isteambasedmode && player.pers[ "team" ] != self.pers[ "team" ] && !player.jediblocking) 
					{ 
						player notify("new_choker"); 
						player thread Power_Force_Choke_Effect(self);
					}
					else if (!level.isteambasedmode && !player.jediblocking) { 
						player notify("new_choker"); 
						player thread Power_Force_Choke_Effect(self);
					}
				}
			}
			wait .5;
		}
		wait .05;
	}
}
Power_Force_Choke_Effect(attacker)
{
	self endon("death");
	self endon("disconnect");
	self endon("new_choker");
	if (isDefined(self.noclipobj)) { self.noclipobj delete(); }
	self.noclipobj = spawn("script_origin", self.origin);
	self.noclipobj.angles = self.angles;
	self PlayerLinkTo(self.noclipobj, undefined);
	goup = true;
	for(x=0;x<5;x++)
	{
		if (goup){ self.noclipobj moveto(self.noclipobj.origin + (0,0,10), .1); goup = false; }
		else { self.noclipobj moveto(self.noclipobj.origin - (0,0,15), .1); goup = true; } 
		self DoDamage(5, self.origin, attacker, attacker, "none", "MOD_PROJECTILE_SPLASH", 0, "sticky_grenade_mp");
		wait .1;
	}
	wait .15;
	self unlink();
}
Power_Force_Lightning()
{
	self endon("death");
	self endon("disconnect");
	while(true)
	{
		if (self.force >= 6 && self fragbuttonpressed())
		{
			self.force -= 6;
			o = self DisTraceShot(550);
			o2 = self DisTraceShot(60);
			a = self DisModTraceShot(3, 500);
			b = self DisModTraceShot(5, 500);
			RadiusDamamge_Mod(o2, 150, 20, "sensor_grenade_mp", false);
			RadiusDamamge_Mod(o, 250, 20, "sensor_grenade_mp", false);
			RadiusDamamge_Mod(a, 150, 15, "sensor_grenade_mp", false);
			RadiusDamamge_Mod(b, 150, 12, "sensor_grenade_mp", false);
			playfx(level._effect["prox_grenade_player_shock"], o2);
			playfx(level._effect["prox_grenade_player_shock"], o);
			playfx(level._effect["prox_grenade_player_shock"], a);
			playfx(level._effect["prox_grenade_player_shock"], b);
			wait .5;
		}
		wait .1;
	}
}

Power_Force_Slam()
{
	self endon("death");
	self endon("disconnect");
	while(true)
	{
		if (self.force >= 30 && self fragbuttonpressed())
		{
			self thread Power_Force_Slam_Effect();
			wait 5;
		}
		wait .1;
	}
}
Power_Force_Slam_Effect()
{
	power = 0;
	ref = self.origin;
	for(x=0;x<30;x++)
	{
		wait .1;
		if (ref[2] > self.origin[2])
		{
			ref = self.origin;
			power++;
		}
		else if (power >= 5) { break; }
		else { adjustForce(false, 15); self iprintln("Not enough downward momentum to do forceslam!"); return; }
	}
	self EnableInvulnerability();
	adjustForce(false, power);
	RadiusDamage(self.origin,int(power * 30),int(power * 25),50,self);
	if (power >= 12)
	{
		self iprintlnbold("^2Super slam!");
		playFx(level.remote_mortar_fx["missileExplode"], self.origin + (0,0,5));
		PlaySoundAtPosition("wpn_rocket_explode", self.origin);
	}
	else
	{
		playfx(level.FXSaberAfterStrike, self.origin);
	}
	wait .5;
	self DisableInvulnerability();
}
Power_Force_Black_Hole()
{
	self endon("death");
	self endon("disconnect");
	while(true)
	{
		if (self.force >= 40 && self fragbuttonpressed())
		{
			//self.force -= 40;
			o = self TraceShot();
			foreach(player in level.players) 
			{
				if (Distance(o, player.origin) <= 250 || Distance(self.origin, player.origin) <= 250)
				{
					if (player == self) { continue; } // Do Nothing
					else if (level.isteambasedmode && player.pers[ "team" ] != self.pers[ "team" ] && !player.jediblocking) { 
						player notify("new_choker");
						player thread Power_Force_Black_Hole_Effect(self, o);
					}
					else if (!level.isteambasedmode && !player.jediblocking) { 
						player notify("new_choker"); 
						player thread Power_Force_Black_Hole_Effect(self, o);
					}
				}
			}
			wait 1.5;
			playfx(level._effect["prox_grenade_player_shock"], o);
			wait .5;
			playfx(level._effect["prox_grenade_player_shock"], o + (0,0,10));
			wait 4.5;
		}
		wait .05;
	}
}
Power_Force_Black_Hole_Effect(target, telzone)
{
	self endon("disconnect");
	self endon("death");
	self endon("new_choker");
	if (isDefined(self.noclipobj)) { self.noclipobj delete(); }
	self.noclipobj = spawn("script_origin", self.origin);
	self.noclipobj.angles = self.angles;
	self thread Power_Force_Black_Hole_Effect_Spin();
	self.noclipobj MoveTo(telzone, 1.5);
	wait 1.5;
	self thread Power_Force_Black_Hole_Effect_Rapid_Dammage(target);
	self.noclipobj MoveTo(telzone - (0,0,500) , 3);
	wait 3;
	self unlink();
    self.obj delete();
}
Power_Force_Black_Hole_Effect_Rapid_Dammage(shooter)
{
	self endon("disconnect");
	self endon("death");
	self endon("new_choker");
	self endon("power_rally");
	for(x = 0; x < 100; x++)
	{
		self DoDamage(30, self.origin, shooter, shooter, "none", "MOD_PROJECTILE_SPLASH", 0, "supplydrop_mp");
		wait .2;
	}
}
Power_Force_Black_Hole_Effect_Spin()
{
	self endon("disconnect");
	self endon("death");
	self endon("new_choker");
	for(x = -180; x < 181; x += 18)
	{ self setPlayerAngles((0,x,0)); wait .05; }
	for(x = -180; x < 181; x += 18)
	{ self setPlayerAngles((0,x,0)); wait .05; }
}
Power_Utility_Posion()
{
	self endon("death");
	self endon("disconnect");
	while(true)
	{
		if (self fragbuttonpressed())
		{
			foreach(player in level.players) 
			{
				if (Distance(self.origin, player.origin) <= 250)
				{
					if (player == self) { continue; } // Do Nothing
					else if (level.isteambasedmode && player.pers[ "team" ] != self.pers[ "team" ]) { player thread Power_Utility_Posion_Effect(self); }
					else if (!level.isteambasedmode) { player thread Power_Utility_Posion_Effect(self); }
				}
			}
			wait 15;
			self iprintln("^2Posioner ability ready to use!");
		}
		wait .1;
	}
}
Power_Utility_Posion_Effect(attacker)
{
	self endon("disconnect");
	self endon("death");
	self endon("power_rally");
	self iprintlnbold("^1You have been posioned!");
	while(true)
	{
		self DoDamage(4, self.origin, attacker, attacker, "none", "MOD_PROJECTILE_SPLASH", 0, "trophy_system_mp");
		wait .2;
	}
}
Power_Utility_Rally()
{
	self endon("death");
	self endon("disconnect");
	while(true)
	{
		if (self fragbuttonpressed())
		{
			foreach(player in level.players) 
			{
				if (Distance(self.origin, player.origin) <= 350)
				{
					if (player == self) { player thread Power_Utility_Rally_Effect(); }
					else if (level.isteambasedmode && player.pers[ "team" ] != self.pers[ "team" ]) { player thread Power_Utility_Rally_Effect(); }
					else if (!level.isteambasedmode) { player thread Power_Utility_Rally_Effect(); }
				}
			}
			wait 15;
			self iprintln("^2Rally ability ready to use!");
		}
		wait .1;
	}
}
Power_Utility_Rally_Effect()
{
	self endon("disconnect");
	self endon("death");
	self notify("power_rally");
	self iprintlnbold("^2Rally bonus has been applied!");
	self.health = self.maxhealth;
	self adjustForce(true, 35);
	self setmovespeedscale(self.curspeed + .25);
	wait 10;
	self setmovespeedscale(self.curspeed);
}
Power_Balistic_Rocket_Launcher()
{
	self endon("death");
	self endon("disconnect");
	while(true)
	{
		if (self.force >= 40 && self fragbuttonpressed())
		{
			self.force -= 40;
			target = self TraceShot();
			self playSound("wpn_rpg_whizby");
			self.bullet = spawnEntity("projectile_sidewinder_missile", self GetTagOrigin("tag_weapon_right") + (AnglesToForward(self GetPlayerAngles()) * 50), (0,0,0));
			self.bullet rotateto(VectorToAngles(target - self.bullet.origin),0.05);
			self.bullet moveto(target, 1);
			wait 1;
			self RadiusDamamge_Mod(target, 300, 225, "remote_missile_bomblet_mp", true);
			playFx(level.remote_mortar_fx["missileExplode"],self.bullet.origin+(0,0,1));
			PlaySoundAtPosition("wpn_rocket_explode", self.bullet.origin);
			self.bullet delete();
			wait 5;
		}
		wait .1;
	}
}
