_orderedUnit = _this select 0;
_activatingPlayer = _this select 1;
_actionId = _this select 2;

if ((_activatingPlayer distance _orderedUnit) <= shoutDistTo) then 
{
	_orderedUnit disableAI "AUTOTARGET";
	_orderedUnit setBehaviour "SAFE";
	sleep 0.1;
	_orderedUnit setUnitPos "DOWN"; 
	_orderedUnit disableAI "MOVE";
	sleep 0.1;
	if ((unitPos _orderedUnit) == "DOWN") then
	{	
		_orderedUnit removeAction _actionID;
		_orderedUnit disableAI "ANIM";
	};
	sleep (random 2);
	{
		if (((_activatingPlayer distance _x) <= shoutDistTo) && (((side _x) == civilian))) then
		{
			_x disableAI "AUTOTARGET";
			_x setBehaviour "SAFE";
			sleep 0.1;
			_x setUnitPos "DOWN";
			_x disableAI "MOVE";	
			sleep 0.1;
			if ((unitPos _x) == "DOWN") then
			{	
				_x removeAction _actionID;
				_x disableAI "ANIM";
			};
			sleep (random 2);
		}
	} forEach allUnits;
}
