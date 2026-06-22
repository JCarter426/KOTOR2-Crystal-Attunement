////////////////////////////////////////////////////////////////////////////////
/*  c_q_cryst_change
	
	Checks if the player can receive a new Quest Crystal.
	
	Returns TRUE if the condition associated with every script parameter
	evaluates as true.
	
	P1: Is the crystal in the player's inventory?
	- 1: Crystal is in inventory
	- 0: Always true
	
	P2: Is the crystal in tune with the player?
	- 1: The crystal is in tune with the player
	- 0: The crystal is NOT in tune with the player
	
	P3: Who is attempting to attune the crystal?
	- 1: PC
	- 0: Always true
	
	P4: PC's history of attuning the crystal (only used if P3 specifies PC)
	- 2: PC has attuned the crystal before
	- 1: PC can attune the crystal but has NOT done so before
	- 0: Always true
	
    JC 2026-06-21                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "jc_inc_qc"

int checkCharacter(int nCharater, int nRequiredState);
int checkCrystal(int nInventoryStatus, int nRequiredState);

int StartingConditional() {
	if (checkCrystal(GetScriptParameter(1), GetScriptParameter(2))
		&& checkCharacter(GetScriptParameter(3), GetScriptParameter(4))) {
		return TRUE;
	}
	return FALSE;
}

int checkCharacter(int nCharacter, int nRequiredState) {
	// For Kreia, no checks are required
	if (nCharacter == 0) {
		return TRUE;
	}
	
	// Nothing to check in this case
	if (nRequiredState == 0) {
		return TRUE;
	}
	
	// After Kreia is gone from the party, other requirements are waived
	if (!IsAvailableCreature(NPC_KREIA)) {
		return TRUE;
	}
	
	// Check Kreia global
	if (nRequiredState == 2) {
		if (QC_GetKreiaGlobal() > 2) {
			return TRUE;
		}
		return FALSE;
	}
	if (QC_GetKreiaGlobal() == 2) {
		return TRUE;
	}
	
	return FALSE;
}

int checkCrystal(int nInventoryStatus, int nRequiredState) {
	int nGlobal = QC_GetCrystalGlobal();
	int nCurrent = QC_GetCurrentCrystal();
	
	// B when the state does not meet the expectation
	if (nRequiredState == 1) {
		if (nGlobal != nCurrent) {
			return FALSE;
		}
	}
	else if (nGlobal == nCurrent) {
		return FALSE;
	}
	
	// Inventory check not required in this case
	if (nInventoryStatus == 0) {
		return TRUE;
	}
	
	// Check if crystal is in inventory
	if (GetIsObjectValid(GetItemPossessedBy(GetFirstPC(), QC_GetCrystalTag(nGlobal)))) {
		return TRUE;
	}
	
	return FALSE;
}