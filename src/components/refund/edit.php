<?php
/**
 * @package   QWcrm
 * @author    Jon Brown https://quantumwarp.com/
 * @copyright Copyright (C) 2016 - 2017 Jon Brown, All rights reserved.
 * @license   GNU/GPLv3 or later; https://www.gnu.org/licenses/gpl.html
 */

defined('_QWEXEC') or die;

require(INCLUDES_DIR.'client.php');
require(INCLUDES_DIR.'company.php');
require(INCLUDES_DIR.'invoice.php');
require(INCLUDES_DIR.'refund.php');
require(INCLUDES_DIR.'report.php');
require(INCLUDES_DIR.'payment.php');
require(INCLUDES_DIR.'voucher.php');
require(INCLUDES_DIR.'workorder.php');

// Check if we have a refund_id
if(!isset($VAR['refund_id']) || !$VAR['refund_id']) {
    force_page('refund', 'search', 'warning_msg='._gettext("No Refund ID supplied."));
} 

// If details submitted run update values, if not set load edit.tpl and populate values
if(isset($VAR['submit'])) {    
        
    // Update the refund in the database
    update_refund($VAR);
    recalculate_refund_totals($VAR['refund_id']);
    
    // load details page
    force_page('refund', 'details&refund_id='.$VAR['refund_id'], 'information_msg='._gettext("Refund updated successfully.")); 
} else {
    
    // Check if refund can be edited
    if(!check_refund_can_be_edited($VAR['refund_id'])) {
        force_page('refund', 'details&refund_id='.$VAR['refund_id'], 'warning_msg='._gettext("You cannot edit this refund because its status does not allow it."));
    }

    // Build the page
    $refund_details = get_refund_details($VAR['refund_id']);
    $smarty->assign('refund_statuses', get_refund_statuses());
    $smarty->assign('refund_types', get_refund_types());        
    $smarty->assign('refund_details', $refund_details);
    $smarty->assign('client_display_name', get_client_details($refund_details['client_id'], 'display_name'));
    $BuildPage .= $smarty->fetch('refund/edit.tpl');

}
