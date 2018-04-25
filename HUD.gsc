init_Menu_HUDS()
{
	// Inventory Menu
	self.inventory_display_string = "Select Side\nHeros\nVillians\n>--------<\n>--------<\n>--------<\n>--------<\n>--------<\n>--------<";
	self.inventory_menu_open = false;
	self.inventory_menu_pos = 0;
	self.inventory_menu_menu = 0;
	
	if (level.isteambasedmode)
	{
		if (self.side == "axis") { self.inventory_menu_menu = 2; }
		else { self.inventory_menu_menu = 1; }
	}
	self.inventory_menu_HUD = self CreateText(self.inventory_display_string, 2, 100, 0, (0,.7,0), 0, 10, true, false, true, true);
	self.inventory_menu_BG = self SpawnShader("white", -190, 0, 150, 250, (0,0,0), 0, 5);
	self.inventory_menu_Scroller = self SpawnShader("white", -190, 25, 150, 25, (1,1,1), 0, 5);
	self.SideHUDForce = self CreateText(self.force, 2, 0, 250, (1, 1, 1), 1, 10, false, false, true, true);
	self.SideHUDForce.label = &"Force: ";
	if (level.isteambasedmode)
	{
		if (self.side == "axis") { Menu_UI_Villians(); }
		else { Menu_UI_Heros(); }
	}
	self thread Menu_Inventory_Open_Bind();
}
Menu_UI_FFAMain()
{
	if (self.inventory_menu_menu != 0) { return; }
	self.inventory_display_string = "Select Side\nHeros\nVillians\n>--------<\n>--------<\n>--------<\n>--------<\n>--------<\n>--------<";
	self.inventory_menu_HUD setSafeText(self.inventory_display_string);
}
Menu_UI_Heros()
{
	if (self.inventory_menu_menu != 1) { return; }
	self.inventory_display_string = "Heros\nLuke Skywalker\nRey\nHan Solo\nChewbacca\nMace Windo\nObi Wan\nYoda\nBack";
	self.inventory_menu_HUD setSafeText(self.inventory_display_string);
}
Menu_UI_Villians()
{
	if (self.inventory_menu_menu != 2) { return; }
	self.inventory_display_string = "Villians\nDarth Vader\nBoba Fett\nJango Fett\nAnakin Skywalker\nCount Doku\nThe Emporer\nGeneral Grevious\nBack";
	self.inventory_menu_HUD setSafeText(self.inventory_display_string);
}
RebuildHUDS()
{
	self.inventory_menu_HUD setSafeText(self.inventory_display_string);
	if (isDefined(self.SideHUDForce)) { self.SideHUDForce destroy(); }
	self.SideHUDForce = self CreateText(self.force, 2, 0, 250, (1, 1, 1), 1, 10, false, false, true, true);
	self.SideHUDForce.label = &"Force: ";
}
Menu_Inventory_Controls()
{
	self endon("disconnect");
	while(self.inventory_menu_open)
	{
		if (self actionslotonebuttonpressed() && self.inventory_menu_pos > 0)
		{
			self.inventory_menu_Scroller moveOverTime(.05);
			self.inventory_menu_Scroller.y -= 24;
			self.inventory_menu_pos--;
			wait .05;
		}
		else if (self actionslottwobuttonpressed()  && self.inventory_menu_pos < 7)
		{
			self.inventory_menu_Scroller moveOverTime(.05);
			self.inventory_menu_Scroller.y += 24;
			self.inventory_menu_pos++;
			wait .05;
		}
		else if (self usebuttonpressed())
		{
			if (self.inventory_menu_pos == 0 && self.inventory_menu_menu == 0) { self.inventory_menu_menu = 1; self Menu_UI_Heros(); }
			else if (self.inventory_menu_pos == 1 && self.inventory_menu_menu == 0) { self.inventory_menu_menu = 2; self Menu_UI_Villians(); }
			else if (self.inventory_menu_pos > 1 && self.inventory_menu_menu == 0) { self Menu_Inventory_Close(); return; }
			else if (self.inventory_menu_pos == 0 && self.inventory_menu_menu == 1) { self.heroclass = "Luke Skywalker"; }
			else if (self.inventory_menu_pos == 1 && self.inventory_menu_menu == 1) { self.heroclass = "Rey"; }
			else if (self.inventory_menu_pos == 2 && self.inventory_menu_menu == 1) { self.heroclass = "Han Solo"; }
			else if (self.inventory_menu_pos == 3 && self.inventory_menu_menu == 1) { self.heroclass = "Chewbacca"; }
			else if (self.inventory_menu_pos == 4 && self.inventory_menu_menu == 1) { self.heroclass = "Mace Windo"; }
			else if (self.inventory_menu_pos == 5 && self.inventory_menu_menu == 1) { self.heroclass = "Obi Wan"; }
			else if (self.inventory_menu_pos == 6 && self.inventory_menu_menu == 1) { self.heroclass = "Yoda"; }
			else if (self.inventory_menu_pos > 6 && self.inventory_menu_menu == 1) 
			{ 
				if (level.isteambasedmode) { self iprintln("^1Not useable in TDM Hero Assult!"); }
				else { self.inventory_menu_menu = 0; self Menu_UI_FFAMain(); }
			}
			// Luke Skywalker\nRey\nHan Solo\nChewbacca\nMace Windo\nObi Wan\nYoda
			else if (self.inventory_menu_pos == 0 && self.inventory_menu_menu == 2) { self.heroclass = "Darth Vader"; }
			else if (self.inventory_menu_pos == 1 && self.inventory_menu_menu == 2) { self.heroclass = "Boba Fett"; }
			else if (self.inventory_menu_pos == 2 && self.inventory_menu_menu == 2) { self.heroclass = "Jango Fett"; }
			else if (self.inventory_menu_pos == 3 && self.inventory_menu_menu == 2) { self.heroclass = "Anakin Skywalker"; }
			else if (self.inventory_menu_pos == 4 && self.inventory_menu_menu == 2) { self.heroclass = "Count Doku"; }
			else if (self.inventory_menu_pos == 5 && self.inventory_menu_menu == 2) { self.heroclass = "The Emporer"; }
			else if (self.inventory_menu_pos == 6 && self.inventory_menu_menu == 2) { self.heroclass = "General Grevious"; }
			else if (self.inventory_menu_pos > 6 && self.inventory_menu_menu == 2) 
			{ 
				if (level.isteambasedmode) { self iprintln("^1Not useable in TDM Hero Assult!"); }
				else { self.inventory_menu_menu = 0; self Menu_UI_FFAMain(); }
			}
			if (self.inventory_menu_pos < 7 && self.inventory_menu_menu != 0) { self iprintlnbold("Class: " + self.heroclass + " selected for next spawn!"); }
			// Darth Vader\nBoba Fett\nJango Fett\nAnakin Skywalker\nCount Doku\nThe Emporer\nGeneral Grevious\nBack
			wait .5;
		}
		else if (self jumpbuttonpressed())
		{
			self Menu_Inventory_Close();
			return;
		}
		wait .05;
	}
}
Menu_Inventory_Open_Bind()
{
	self endon("disconnect");
	while(!self.inventory_menu_open)
	{
		if (self adsbuttonpressed() && self meleebuttonpressed()) { self thread Menu_Inventory_Open(); break; }
		wait .1;
	}
}
Menu_Inventory_Open()
{
	self.inventory_menu_open = true;
	self.inventory_menu_HUD FadeOverTime(.5);
	self.inventory_menu_BG FadeOverTime(.5);
	self.inventory_menu_BG.color = (0,0,0);
	self.inventory_menu_HUD.color = (0,.7,0);
	self.inventory_menu_Scroller FadeOverTime(.5);
	self.inventory_menu_HUD.alpha = 1;
	self.inventory_menu_BG.alpha = 1;
	self.inventory_menu_Scroller.alpha = 1;
	self iprintlnbold("Opened Menu");
	wait .5;
	self thread Menu_Inventory_Controls();
}
Menu_Inventory_Close()
{
	self.inventory_menu_open = false;
	self.inventory_menu_HUD FadeOverTime(.5);
	self.inventory_menu_BG FadeOverTime(.5);
	self.inventory_menu_Scroller FadeOverTime(.5);
	self.inventory_menu_HUD.alpha = 0;
	self.inventory_menu_BG.alpha = 0;
	self.inventory_menu_Scroller.alpha = 0;
	self iprintlnbold("Closed Menu");
	wait .5;
	self thread Menu_Inventory_Open_Bind();
}
CreateText(item, fontScale, x, y, color, alpha, sort, text, allpeeps, foreground, normal)
{
	if (!allpeeps)
		hud = self createFontString("objective", fontScale);
	else
		hud = level createServerFontString("objective", fontScale);
	if (!text)
    	hud setValue(item);
    else
    	hud setSafeText(item);
    hud.x = x;
	hud.y = y;
	hud.color = color;
	hud.alpha = alpha;
    hud.sort = sort;
	hud.foreground = foreground;
	if (!isDefined(normal) || normal)
	{
		hud.alignX = "left";
		hud.horzAlign = "left";
		hud.vertAlign = "center";
	}
	return hud;
}
SpawnShader(shader, x, y, width, height, color, alpha, sort)
{
	hud = newClientHudElem(self);
    hud.elemtype = "icon";
    hud.color = color;
    hud.alpha = alpha;
    hud.sort = sort;
    hud.children = [];
    hud setParent(level.uiParent);
    hud setShader(shader, width, height);
    hud.x = x;
    hud.y = y;
    hud.foreground = true;
    return hud;
}
overflowfix()
{
	level endon("game_ended");
	level endon("host_migration_begin");
	
	test = level createServerFontString("default", 1);
	test setText("xTUL");
	test.alpha = 0;

	if(GetDvar("g_gametype") == "sd")
    	limit = 35;
    else
    	limit = 45; 

	while(1)
	{
		level waittill("textset"); 
		if(level.strings.size >= limit)
		{
			test ClearAllTextAfterHudElem();
			level.strings = [];//re-building the string array
			//iprintln("^1Debug: ^5Overflow prevented!"); //Remove after finishing your menu.
			foreach(player in level.players) { player thread RebuildHUDS(); }
		}
	}
}

setSafeText(text)
{
    if (!isInArray(level.strings, text))
    {
        level.strings[level.strings.size] = text;
        self setText(text);
        level notify("textset");
    }
    else
        self setText(text);
}


