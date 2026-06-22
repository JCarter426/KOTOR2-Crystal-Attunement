////////////////////////////////////////////////////////////////////////////////
/*  a_q_cryst_change
	
	Gives the player an up-to-date Quest Crystal. Removes the old crystal from
	the player's inventory if present.
	
	If the player's Wisdom is at least 18, allows the player to attune without
	Kreia next time.
	
    JC 2023-06-21                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "jc_inc_qc"

void main() {
	int nPrevious = QC_GetCrystalGlobal();
	int nCurrent = QC_GetCurrentCrystal();
	object oPC = GetFirstPC();	
	object oPrevious = GetItemPossessedBy(oPC, QC_GetCrystalTag(nPrevious));
	
	if( GetIsObjectValid(oPrevious) )
		DestroyObject(oPrevious);
	
	QC_SetCrystalGlobal(nCurrent);
	CreateItemOnObject(QC_GetCrystalTag(nCurrent), oPC);
	
	// Increment Kreia global if applicable
	int nGlobal = QC_GetKreiaGlobal();
	if (nGlobal < 2) {
		if (GetAbilityScore(oPC, ABILITY_WISDOM) >= 18) {
			QC_SetKreiaGlobal(2);		
		}
	}
	else if (nGlobal == 2) {
		QC_SetKreiaGlobal(3);
	}
}