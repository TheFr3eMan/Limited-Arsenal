if(!isserver)exitWith{};

params ["_name","_index","_object"];

private _vehicleLists = _object getVariable "jng_vehicleLists";
private _vehicleList = (_jng_vehicleLists select _index);

{
	private _data = _x;
	private _name2 = _data select 0;
	if(_name isEqualTo _name2)exitWith{
		_vehicleList deleteAt _foreachindex;
		_vehicleLists set [_index, _vehicleList];
	};
} forEach _vehicleList;


_object setVariable ["jng_vehicleLists", _vehicleLists];

//update all clients that are looking in the garage
private _clients = missionnamespace getVariable ["jng_playersInGarage",[]];
if!(_clients isEqualTo [])then{
	["removeVehicle",[_data,_index]] remoteExecCall ["jn_fnc_garage",_clients];
};


