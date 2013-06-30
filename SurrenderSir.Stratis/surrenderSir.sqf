/* 
In player init field: nul=[player,surrenderSide,downSide,distance,surrenderType] execVM "surrenderSir.sqf"

Required parameters:
	player = Player to be given the ability to order A.I. units to surrender. Should be "this" in player init field or player unit name.
	surrenderSide = Side that will be given the option to surrender. "ENEMYSURRENDER" for enemies only, "CIVSURRENDER" for civilians only, and "ALLSURRENDER" for enemies and civilians.
	downSide = Side that will be given the option to get on the ground. "ENEMYDOWN" for enemies only, "CIVDOWN" for civilians only, and "ALLDOWN" for enemies and civilians.
	distance = How far player has to be from units to order them to surrender. 
*/

_uppercase = [];
for [{_i=0},{_i<count _this},{_i=_i+1}] do {_e=_this select _i; if (typeName _e=="STRING") then {_e=toUpper(_e)};_uppercase set [_i,_e]};

_activatingPlayer = _this select 0;
_surrenderSide = _this select 1;
_downSide = _this select 2; 
shoutDistTo = _this select 3;


if (_surrenderSide == "ENEMYSURRENDER") then 
{
	{
	   if ((((side _activatingPlayer) getFriend (side _x)) < 0.6) && alive _x) then
	   {
			_x addAction["Surrender!", "surrenderSir_s.sqf", nil, 6, True, True, "", "(_target distance _this) < shoutDistTo"]
	   };
	} forEach allUnits;
};

if (_surrenderSide == "CIVSURRENDER") then 
{
	{
	   if (((side _x) == civilian) && alive _x) then
	   {
			_x addAction["Surrender!", "surrenderSir_s.sqf", nil, 6, True, True, "", "(_target distance _this) < shoutDistTo"]
	   };
	} forEach allUnits;
};

if (_surrenderSide == "ALLSURRENDER") then 
{
	{
	   if ((((side _activatingPlayer) getFriend (side _x)) < 0.6) or ((side _x) == civilian) && alive _x) then
	   {
			_x addAction["Surrender!", "surrenderSir_s.sqf", nil, 6, True, True, "", "(_target distance _this) < shoutDistTo"]
	   };
	} forEach allUnits;
};

if (_downSide == "ENEMYDOWN") then 
{
	{
	   if ((((side _activatingPlayer) getFriend (side _x)) < 0.6) && alive _x) then
	   {
			_x addAction["Get on the ground!", "surrenderSir_g.sqf", nil, 5, True, True, "", "(_target distance _this) < shoutDistTo"]
	   };
	} forEach allUnits;
};

if (_downSide == "CIVDOWN") then 
{
	{
	   if (((side _x) == civilian) && alive _x) then
	   {
			_x addAction["Get on the ground!", "surrenderSir_g.sqf", nil, 5, True, True, "", "(_target distance _this) < shoutDistTo"]
	   };
	} forEach allUnits;
};

if (_downSide == "ALLDOWN") then 
{
	{
	   if ((((side _activatingPlayer) getFriend (side _x)) < 0.6) or ((side _x) == civilian) && alive _x) then
	   {
			_x addAction["Get on the ground!", "surrenderSir_g.sqf", nil, 5, True, True, "", "(_target distance _this) < shoutDistTo"]
	   };
	} forEach allUnits;
};