////////////////////////////////////////////////////////////////////////////////
/*  jc_compdlg
	
	Starts a computer terminal conversation.
	
    JC 2026-06-22                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	NoClicksFor(0.1);
	object oPL = GetPartyMemberByIndex(0);
	string sDLG = GetScriptStringParameter();	
	DelayCommand(0.01, AssignCommand(OBJECT_SELF, ActionStartConversation(oPL, sDLG)));
}