_orderedUnit = _this select 0;
_activatingPlayer = _this select 1;
_actionId = _this select 2;

{
	if ((_activatingPlayer distance _x) <= shoutDistTo) then 
		{
			// _unitWeapon = currentWeapon _x;
			// _x action ["DROPWEAPON",_x,_unitWeapon]; Unit will drop weapon before surrendering if these commands are fixed to work properly.
			_x disableAI "AUTOTARGET";
			_x switchMove "DOWN"; 
			sleep 1; 
			_x disableAI "ANIM";
			_x removeAction _actionID;
			{
				if (((_activatingPlayer distance _x) <= shoutDistTo) && (((side _x) == civilian))) then
				{
					_x disableAI "AUTOTARGET";
					_x setUnitPos "DOWN"; 
					sleep 1; 
					_x disableAI "ANIM";
					_x removeAction _actionID;
				}
			} forEach allUnits;
		}
} forEach units group _orderedUnit;
