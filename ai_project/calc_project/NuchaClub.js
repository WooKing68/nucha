
function q(b, a) {
	if (a==0) return null;
	if (a>0) return Math.floor(b/a);
	if (a<0) return Math.ceil(b/a);
}

function r(b, a) {
	if (a==0) return null;
	return b-a*q(b, a);
}

//-----------------------------------------------------------------------------------------------------------


function isNumeric(str) {
	if (typeof str != "string") return false; // we only process strings!  
	// use type coercion to parse the _entirety_ of the string (`parseFloat` alone does not do this)...
	// ...and ensure strings of whitespace fail
  return !isNaN(str) && !isNaN(parseFloat(str)) ;
         
}