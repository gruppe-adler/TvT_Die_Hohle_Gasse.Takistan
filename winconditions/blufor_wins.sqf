_reason = _this select 0;

hintSilent "BLUFOR WINS. " + _reason;

sleep 3;

hintSilent "BLUFOR WINS. " + _reason + "MISSION ENDS NOW.";
sleep 1;
hintSilent "BLUFOR WINS. " + _reason + "MISSION ENDS NOW..";
sleep 1;
hintSilent "BLUFOR WINS. " + _reason + "MISSION ENDS NOW...";
sleep 1;
if (side player == east) then {
[_reason,false,2] call BIS_fnc_endMission;
} else {
[_reason,true,2] call BIS_fnc_endMission;
};