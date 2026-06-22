////////////////////////////////////////////////////////////////////////////////
/*  a_q_cryst_first
	
	Heartbeat script for the Quest Crystal placeable. Creates the initial Quest
	Crystal item the player can find in the placeable's inventory.
	
    JC 2023-03-12                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "jc_inc_qc"

void main() {
	if( !GetLocalBoolean(OBJECT_SELF, 45) ) {
		SetLocalBoolean(OBJECT_SELF, 45, TRUE);
		
		int nCrystal = QC_GetCurrentCrystal();
		QC_SetCrystalGlobal(nCrystal);
		CreateItemOnObject(QC_GetCrystalTag(nCrystal), OBJECT_SELF);
		
		RemoveHeartbeat(OBJECT_SELF);
	}
}