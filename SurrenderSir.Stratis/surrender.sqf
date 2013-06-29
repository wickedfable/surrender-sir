_orderedUnit = _this select 0;
_activatingPlayer = _this select 1;
_actionId = _this select 2;

{
	_surDist = _activatingPlayer distance _x; 
	if (_surDist <= 10) then 
		{
			_x action ["SURRENDER",_x]; 
			sleep 0.1; 
			_x disableAI "ANIM";
			_x removeAction _actionID;
		}
} 
forEach units group _orderedUnit;
sleep 0.1;