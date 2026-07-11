////////////////////////////////////////////////////////////////////////////////
/*  jc_c_wb_qc
	
	Checks if the option to examine the Quest Crystal should appear in the
	workbench dialogue.
	
	Returns TRUE if all of the following is true:
	- The party leader is the player
	- The player has found the Quest Crystal
	- The player has completed the Crafting a Lightsaber quest
	
    JC 2026-07-11                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "jc_inc_qc"

int StartingConditional() {
	if (GetTag(GetPartyLeader()) != "") {
		return FALSE;
	}
	if (QC_GetCrystalGlobal() == 0) {
		return FALSE;
	}
	if (GetGlobalNumber("604DAN_PC_Crystal") == 0) {
		return FALSE;
	}
	if (GetJournalEntry("LightsaberQuest") < 50) {
		return FALSE;
	}
	return TRUE;
}