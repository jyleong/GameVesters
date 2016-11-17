function renderColor(){
	
	var changeIndex= $("table.table > tbody > tr > td.change")
	

	var changeVal = parseFloat(changeIndex.text());
	if (changeVal < 0.0) {
		changeIndex.css('color', 'red');
	}
	else
	{
		changeIndex.css('color', 'green');
	}
}

$(document).ready(function() {

	renderColor();
	
});