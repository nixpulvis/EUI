<?php
// jSON URL which should be requested
$json_url = 'https://api.github.com/repos/EUIbugs/testbugs/issues';
 
$username = 'EUIbugs';   // authentication
$password = 'EUIbugs1';  // authentication
 
// jSON String for request
$json_string = json_encode(array('title' => $_GET['title'], 'body' => $_GET['body']));
 
// Initializing curl
$ch = curl_init( $json_url );
 
// Configuring curl options
$options = array(
CURLOPT_RETURNTRANSFER => true,
CURLOPT_USERPWD => $username . ":" . $password,   // authentication
CURLOPT_HTTPHEADER => array('Content-type: application/json') ,
CURLOPT_POSTFIELDS => $json_string
);
 
// Setting curl options
curl_setopt_array( $ch, $options );
 
// Getting results
$result =  curl_exec($ch); // Getting jSON result string
?>