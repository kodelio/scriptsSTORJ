<?php

require 'vendor/autoload.php';

// Replace with your apiKey :
$apiKeyPushbullet = '';

// Set the IP of the servers you want to check
$ip = [''];

$pb = new Pushbullet\Pushbullet($apiKeyPushbullet);

for ($i = 0; $i < sizeof($ip); $i++) {

	$host = $ip[$i];
	$port = 4000;

	$connection = @fsockopen($host, $port);

	if (is_resource($connection))
	{
		fclose($connection);
	}
	else
	{
		$pb->allDevices()->pushNote("STORJ Down", 'IP ' .$host. ' not accessible');
	}
}

?>
