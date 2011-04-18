var couchapp = require('couchapp');
ddoc = {
    _id: '_design/stats'
  , views: {}
}
module.exports = ddoc;

ddoc.views.mapaGoogli = 
{
  map: function(doc) 
	{
  	if((doc.location != "" && doc.sighted_at != "0000" && doc.duration != "")) 
		{
    	var mapka = "http://maps.google.com/maps/api/staticmap?size=480x480&sensor=true&markers=icon:http://img21.imageshack.us/img21/5336/ufou.png|"+doc.location;
    	var tekst = doc.duration + " spotkanie z ufo";
    	emit({tytul: tekst, czas: doc.sighted_at, icon: "ufo", opis: doc.description, image: mapka}, null);
  	}
	},

  reduce: function(keys, values) 
	{
    return null;
  }
}

//couchapp push ls_views.js http://localhost:5984/gutenberg

