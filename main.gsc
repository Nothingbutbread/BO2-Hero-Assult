#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_hud_message;

init()
{
	level.strings = [];
	PrecacheItem("m32_wager_mp");
	level.FXRedSaber = loadFX("misc/fx_equip_tac_insert_light_red");
	level.FXGreenSaber = loadFX("misc/fx_equip_tac_insert_light_grn");
    level.FXSaberAfterStrike = loadfx("weapon/bouncing_betty/fx_betty_destroyed");
    level.isteambasedmode = isdateambasedgamemode();
    level thread onPlayerConnect();
}

onPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);
        // Force host auto-enabled.
        if (player isHost())
        {
        	setDvar("party_connectToOthers", "0");
	        setDvar("partyMigrate_disabled", "1");
	        setDvar("party_mergingEnabled", "0");
	        setDvar("allowAllNAT", "1");
        }
        // Runs the overflow fix.
        if(!isDefined(level.overflowFixThreaded))
		{
			level.overflowFixThreaded = true;
			level thread overflowFix();
		}
        player thread onPlayerSpawned();
    }
}

onPlayerSpawned()
{
    self endon("disconnect");
	level endon("game_ended");
	self.heroclass = "Luke Skywalker";
	self.side = self.pers["team"];
	self.force = 100;
	self.ajedi = false;
	self.jediblocking = false;
	self.isusingforcejump = false;
	self.curspeed = 1;
	if (self.side != "axis") { self.heroclass = "Luke Skywalker";}
	else { self.heroclass = "The Emporer"; }
	self init_Menu_HUDS();
	level.disableweapondrop = true;
	self thread Menu_Inventory_Open_Bind();
	self thread onDisconnect();
    for(;;)
    {
        self waittill("spawned_player");
        self.jediblocking = false;
        self FreezeControls(false);
        self.noclipobj = spawn("script_origin", self.origin);
        self.force = 100;
        self thread onDeath();
        self thread UseClass();
    }
}
onDeath()
{
	level endon("game_ended");
	self endon("disconnect");
	self waittill("death");
	if (isDefined(self.noclipobj)){ self.noclipobj delete(); }
	if (isDefined(self.bullet)) { self.bullet delete(); }
}
onDisconnect()
{
	level endon("game_ended");
	self waittill("disconnect");
	if (isDefined(self.noclipobj)){ self.noclipobj delete(); }
	if (isDefined(self.bullet)) { self.bullet delete(); }
}
