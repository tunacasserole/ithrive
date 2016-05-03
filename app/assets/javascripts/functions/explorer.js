/*
  Explorer Toggler
*/

// Register a handler to the toggle event of explorer toggles
function registerExplorerToggle(name) {
    $(name + ' .toggle-switch > input.grid-toggle').on('click', function(){
    	notify("Toggle successfully updated", "inverse");
    })
};


function explorerToDateTime(value){
	var result = moment(value).format("llll");
	if(value === null){
		result = "";
	}
    return result;
}


function explorerToYesNo(value){
	var result = "Yes";
	if(value === '0' || value === false){
		result = 'No';
	}
	return result;
}

function explorerToAvatar(value){
    return "<img class='avatar-sm' src='" + value + "' />";
}