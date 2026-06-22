////////////////////////////////////////////////////////////////////////////////
/*  Crystal Attunement
    with Standard Properties
                                                                              */
////////////////////////////////////////////////////////////////////////////////

int QC_GetCrystalColor();
int QC_GetCrystalGlobal();
int QC_GetCrystalLevel();
string QC_GetCrystalTag(int nCrystal);
int QC_GetCurrentCrystal();
int QC_GetKreiaGlobal();
void QC_SetCrystalGlobal(int nGlobal);
void QC_SetKreiaGlobal(int nGlobal);

////////////////////////////////////////////////////////////////////////////////
/*  Gets the current Quest Crystal color, based on the player's alignment.
	- Black: 0
	- Dark:  1
	- Grey:  2
	- Light: 3
	- White: 4
	
    JC 2023-03-13                                                             */
////////////////////////////////////////////////////////////////////////////////
int QC_GetCrystalColor() {
	int nAlign = GetGoodEvilValue(GetFirstPC());
	if (nAlign == 0)
		return 0;
	else if (nAlign > 0 && nAlign < 40)
		return 1;
	else if (nAlign >= 40 && nAlign <= 60)
		return 2;
	else if (nAlign > 60 && nAlign < 100)
		return 3;
	else if (nAlign == 100)
		return 4;
	return -1;
}

////////////////////////////////////////////////////////////////////////////////
/*  Gets the current value stored in the Quest Crystal global.
	
    JC 2023-03-12                                                             */
////////////////////////////////////////////////////////////////////////////////
int QC_GetCrystalGlobal() {
	int nGlobal = GetGlobalNumber("000_Quest_Crystal");
	if (nGlobal < 0)
		nGlobal += 256;
	return nGlobal;
}

////////////////////////////////////////////////////////////////////////////////
/*  Gets the current Quest Crystal level (1-9).
	
    JC 2023-03-12                                                             */
////////////////////////////////////////////////////////////////////////////////
int QC_GetCrystalLevel() {
	int nLevel = 1 + (GetGlobalNumber("G_PC_LEVEL") - 9) / 3;
	if (nLevel < 1)
		return 1;
	if (nLevel > 9)
		return 9;
	return nLevel;
}

////////////////////////////////////////////////////////////////////////////////
/*  Gets a Quest Crystal tag.
	
	- nGlobal: Quest Crystal value
	
    JC 2023-06-13                                                             */
////////////////////////////////////////////////////////////////////////////////
string QC_GetCrystalTag(int nCrystal) {
	return "qcrystal_"
		+ IntToString(nCrystal / 10) + "_"
		+ IntToString(nCrystal % 10);
}

////////////////////////////////////////////////////////////////////////////////
/*  Gets the current Quest Crystal value as a 2-digit number based on the
	player's alignment and level.
	
	- 1st digit: level (1-9)
	- 2nd digit: color (0-4)
	
    JC 2023-03-13                                                             */
////////////////////////////////////////////////////////////////////////////////
int QC_GetCurrentCrystal() {
	return QC_GetCrystalLevel() * 10
		+ QC_GetCrystalColor();
}

////////////////////////////////////////////////////////////////////////////////
/*  Gets the value stored in the Kreia Lightsaber global.
	
    JC 2026-06-21                                                             */
////////////////////////////////////////////////////////////////////////////////
int QC_GetKreiaGlobal() {
	return GetGlobalNumber("000_Kreia_Lightsaber");
}

////////////////////////////////////////////////////////////////////////////////
/*  Sets the value stored in the Quest Crystal global.
	
	- nGlobal: Quest Crystal value
	
    JC 2023-03-12                                                             */
////////////////////////////////////////////////////////////////////////////////
void QC_SetCrystalGlobal(int nGlobal) {
	if (nGlobal >= 128)
		nGlobal -= 256;
	SetGlobalNumber("000_Quest_Crystal", nGlobal);
}

////////////////////////////////////////////////////////////////////////////////
/*  Sets the value stored in the Kreia global variable.
	
	- nGlobal: global value
	
    JC 2026-06-21                                                             */
////////////////////////////////////////////////////////////////////////////////
void QC_SetKreiaGlobal(int nGlobal) {
	SetGlobalNumber("000_Kreia_Lightsaber", nGlobal);
}