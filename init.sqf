ENABLE_REPLAY = (paramsArray select 0) == 1;
IS_STREAMABLE = (paramsArray select 1) == 1;

enableSentences false;

if !(isDedicated) then {
	["Preload"] call BIS_fnc_arsenal;
};
if !(isDedicated) then {	
	titleCut ["", "BLACK FADED", 999];
	[] Spawn {
		titleText ["","PLAIN"];
		titleFadeOut 1;
		sleep 2;

		titleCut ["", "BLACK IN", 1];

		waitUntil {time > 3};
		
		[
			"<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>TvT@Die Hohle Gasse</t>",
			0, 0, 2, 2
		] spawn BIS_fnc_dynamicText;
	};
};

if (isServer and ENABLE_REPLAY) then {
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
