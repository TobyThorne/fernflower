//This looks to be the traitor win tracker code.
client/proc/add_roundsjoined()
	if(!makejson)
		return
	var/DBConnection/dbcon = new()

	dbcon.Connect("dbi:mysql:[sqldb]:[sqladdress]:[sqlport]","[sqllogin]","[sqlpass]")
	if(!dbcon.IsConnected()) return

	var/DBQuery/cquery = dbcon.NewQuery("INSERT INTO `roundsjoined` (`ckey`) VALUES ('[ckey(src.key)]')")
	if(!cquery.Execute()) message_admins(cquery.ErrorMsg())

client/proc/add_roundssurvived()
	if(!makejson)
		return
	var/DBConnection/dbcon = new()

	dbcon.Connect("dbi:mysql:[sqldb]:[sqladdress]:[sqlport]","[sqllogin]","[sqlpass]")
	if(!dbcon.IsConnected()) return

	var/DBQuery/cquery = dbcon.NewQuery("INSERT INTO `roundsurvived` (`ckey`) VALUES ('[ckey(src.key)]')")
	if(!cquery.Execute()) message_admins(cquery.ErrorMsg())

client/proc/onDeath()
	if(!makejson)
		return
	roundinfo.deaths++

client/proc/onBought(names)
	if(!makejson) return
	if(!names) return
	var/DBConnection/dbcon = new()

	dbcon.Connect("dbi:mysql:[sqldb]:[sqladdress]:[sqlport]","[sqllogin]","[sqlpass]")
	if(!dbcon.IsConnected()) return

	var/DBQuery/cquery = dbcon.NewQuery("INSERT INTO `traitorbuy` (`type`) VALUES ([dbcon.Quote(names)])")
	if(!cquery.Execute()) message_admins(cquery.ErrorMsg())

datum/roundinfo
	var/core = 0
	var/deaths = 0
	var/revies = 0
	var/starttime = 0
	var/endtime = 0
	var/lenght = 0
	var/mode = 0