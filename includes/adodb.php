<?php

defined('_QWEXEC') or die;


/* ADODB Options */

// ADODB_ASSOC_CASE - You can control the associative fetch case for certain drivers which behave differently. - native is default since v2.90
//define('ADODB_ASSOC_CASE', 1);  // set what case to use for recordsets where the field name (not table names): 0 = lowercase, 1 = uppercase, 2 = native case

// $ADODB_FETCH_MODE - This is a global variable that determines how arrays are retrieved by recordsets. 
//$ADODB_FETCH_MODE = ADODB_FETCH_NUM; 

/* -- */

// Set Path for ADODB in the php include path
set_include_path(get_include_path() . PATH_SEPARATOR . LIBRARIES_DIR.'adodb'.SEP);
require('adodb.inc.php');

// create adodb database connection
$db = ADONewConnection('mysqli');
$db->Connect($QConfig->db_host, $QConfig->db_user, $QConfig->db_pass, $QConfig->db_name);
