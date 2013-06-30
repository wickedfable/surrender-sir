_orderedUnit = _this select 0;
_activatingPlayer = _this select 1;
_actionId = _this select 2;

if ((_activatingPlayer distance _orderedUnit) <= shoutDistTo) then 
{
	_orderedUnit disableAI "AUTOTARGET";
	// _unitWeapon = currentWeapon _orderedUnit;
	// _orderedUnit action ["DROPWEAPON",_orderedUnit,_unitWeapon]; Unit will drop weapon before surrendering if these commands are fixed to work properly.
	_orderedUnit action ["SURRENDER",_orderedUnit]; 
	_orderedUnit disableAI "ANIM";
	_orderedUnit removeAction _actionID;
	[_orderedUnit] joinSilent null;
	sleep (random 2);
	{
		if (((_activatingPlayer distance _x) <= shoutDistTo) && (((side _activatingPlayer) getFriend (side _x)) < 0.6)) then
		{
			_x disableAI "AUTOTARGET";
			_x action ["SURRENDER",_x]; 
			_x disableAI "ANIM";
			_x removeAction _actionID;
			[_x] joinSilent null;
			sleep (random 2);
		}
	} forEach allUnits;
}

