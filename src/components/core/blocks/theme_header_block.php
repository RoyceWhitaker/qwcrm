<?php
/**
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
 */

defined('_QWEXEC') or die;

require_once(INCLUDES_DIR.'core_theme.php');

// Display Date and Time
$smarty->assign('todays_display_date', date('l, j F Y'));

//Add a welcome message based on time
if(!defined('QWCRM_SETUP')) {
    $smarty->assign('greeting_msg', greeting_message_based_on_time($user->login_display_name));    
} else {
    $smarty->assign('greeting_msg', greeting_message_based_on_time(null)); 
}

$BuildPage .= $smarty->fetch('core/blocks/theme_header_block.tpl');