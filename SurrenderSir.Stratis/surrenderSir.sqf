// Concept 1 - In enemy init field: nul=["Action Name",this] execVM "surrenderSir.sqf"
// Concept 2 - In enemy init field: this addAction["Action Name", "surrenderSir.sqf", nil, 6, True, True, "", "(_target distance _this) < 10"
// Concept 3 - In player init field: nul=[this,surrenderType,distance] execVM "surrenderSir.sqf"

_activatingPlayer = _this select 0;
distTo = _this select 2;

{
   if (((side _x) != (side _activatingPlayer))) then
   {
		_x addAction["Surrender!", "surrender.sqf", nil, 6, True, True, "", "(_target distance _this) < distTo"]
   };
} forEach allUnits;

