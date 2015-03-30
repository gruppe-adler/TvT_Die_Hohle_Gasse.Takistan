ENABLE_REPLAY = (paramsArray select 0) == 1;
IS_STREAMABLE = (paramsArray select 1) == 1;

enableSentences false;

[] execVM "CSSA3\CSSA3_init.sqf";

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
if !(isServer) then {
	execVM "add-briefing.sqf";
};

if (isServer and ENABLE_REPLAY) then {
	execVM "export-missiondata.sqf";
};

if (isServer) then {
	execVM "opfor-fill-crate.sqf";
};

if ((!isServer) && ((side player) == west)) then {
	["Preload"] call BIS_fnc_arsenal;
	blufor_crate addAction ["Ausrüstung", {
		["Open", true] spawn BIS_fnc_arsenal;
	}];
};


// countdown
END_TIME = 60; //When mission should end in seconds.

if (isServer) then {
    [] spawn 
    {
                ELAPSED_TIME  = 0;
        START_TIME = diag_tickTime;
        while {ELAPSED_TIME < END_TIME} do 
        {
            ELAPSED_TIME = diag_tickTime - START_TIME;
            publicVariable "ELAPSED_TIME";
            sleep 1;
        };
    };
};


if!(isDedicated) then
{
    [] spawn 
    {
        while{ELAPSED_TIME < END_TIME } do
        {
            _time = END_TIME - ELAPSED_TIME;
            _finish_time_minutes = floor(_time / 60);
            _finish_time_seconds = floor(_time) - (60 * _finish_time_minutes);
            if(_finish_time_seconds < 10) then
            {
                _finish_time_seconds = format ["0%1", _finish_time_seconds];
            };
            if(_finish_time_minutes < 10) then
            {
                _finish_time_minutes = format ["0%1", _finish_time_minutes];
            };
            _formatted_time = format ["%1:%2", _finish_time_minutes, _finish_time_seconds];
            
            
            //hintSilent format ["Time left:\n%1", _formatted_time];
        	
            sleep 1;
        };
    };
};  
