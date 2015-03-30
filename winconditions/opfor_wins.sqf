_reason = _this select 0;

hintSilent "OPFOR WINS. " + _reason;

sleep 3;

hintSilent "OPFOR WINS. " + _reason + "MISSION ENDS NOW.";
sleep 1;
hintSilent "OPFOR WINS. " + _reason + "MISSION ENDS NOW..";
sleep 1;
hintSilent "OPFOR WINS. " + _reason + "MISSION ENDS NOW...";
sleep 1;
if (side player == east) then {
[_reason,true,2] call BIS_fnc_endMission;
} else {
[_reason,false,2] call BIS_fnc_endMission;
};