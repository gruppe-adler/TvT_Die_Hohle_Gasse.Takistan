ENABLE_REPLAY = (paramsArray select 0) == 1;
IS_STREAMABLE = (paramsArray select 1) == 1;

enableSentences false;

if !(isDedicated) then {
	["Preload"] call BIS_fnc_arsenal;
};

[''] execVM "vendor\ga_common\intro.sqf";

if (isServer && ENABLE_REPLAY && !(isNil "sock_rpc")) then {
	execVM "export-missiondata.sqf";
};

if (isServer) then {
	clearWeaponCargoGlobal opfor_rpg_crate;
	opfor_rpg_crate addWeaponCargoGlobal [];
};

if ((!isServer) && ((side player) == west)) then {
	["AmmoboxInit", [blufor_crate, true, {true}]] spawn BIS_fnc_arsenal;

	blufor_crate addAction ["Ausrüstung", {
		["Open", true] spawn BIS_fnc_arsenal;
	}];
};
