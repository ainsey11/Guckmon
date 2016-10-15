<?PHP
$user_name = "observium";
$password = "observer15th3b055";
$database = "observium";
$server = "10.1.1.51";
$db_handle = mysql_connect($server, $user_name, $password);
$db_found = mysql_select_db($database, $db_handle);
if ($db_found) {
$SQL = "select * from `sensors-state` where sensor_id = 13";
$result = mysql_query($SQL);
while ( $db_field = mysql_fetch_assoc($result) ) {
print $db_field['sensor_value'];
}
mysql_close($db_handle);
}
else {
print "Database NOT Found ";
mysql_close($db_handle);
}

?>

