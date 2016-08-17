<!-- details.tpl - Work Order Details Page -->
<script language="javascript" type="text/javascript" src="includes/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
{literal}
<script language="javascript" type="text/javascript">
    tinyMCE.init({
        mode : "textareas",
        theme : "advanced",
        plugins : "advlink,iespell,insertdatetime,preview",
        theme_advanced_buttons2_add : "separator,insertdate,inserttime,preview,separator,forecolor,backcolor",
        theme_advanced_buttons2_add_before: "cut,copy,paste",
        theme_advanced_toolbar_location : "bottom",
        theme_advanced_toolbar_align : "center",
        plugin_insertdate_dateFormat : "%Y-%m-%d",
        plugin_insertdate_timeFormat : "%H:%M:%S",
        extended_valid_elements : "a[name|href|target|title|onclick],img[class|src|border=0|alt|title|hspace|vspace|width|height|align|onmouseover|onmouseout|name],hr[class|width|size|noshade],font[face|size|color|style],span[class|align|style]",
        width : "100%"
    });
</script>
{/literal}
{section name=i loop=$single_workorder}
{if $error_msg|escape != ""}
    {include file="core/error.tpl"}
{/if}
<br>
<table width="100%">
    <tr>
        <td>
            <div id="tabs_container">
                <ul class="tabs">
                    <li class="active"><a href="#" rel="#tab_1_contents" class="tab"><img src="{$theme_images_dir}icons/workorders.gif" alt="" border="0" height="14" width="14" />&nbsp;{$translate_workorder_details_title}</a></li>
                    <li><a href="#" rel="#tab_2_contents" class="tab"><img src="{$theme_images_dir}icons/customers.gif" alt="" border="0" height="14" width="14" />&nbsp;{$translate_workorder_details_customer_details_title}</a></li>
                    <li><a href="#" rel="#tab_3_contents" class="tab"><img src="{$theme_images_dir}icons/16x16/Calendar.gif" alt="" border="0" height="14" width="14" />&nbsp;{$translate_workorder_details_schedule_title}</a></li>
                    <li><a href="#" rel="#tab_4_contents" class="tab"><img src="{$theme_images_dir}icons/note.png" alt="" border="0" height="14" width="14" /> &nbsp;{$translate_workorder_details_notes_title}</a></li>
                    <li><a href="#" rel="#tab_5_contents" class="tab"><img src="{$theme_images_dir}icons/status.gif" alt="" border="0" height="14" width="14" />&nbsp;{$translate_workorder_details_parts_title}</a></li>
                    <li><a href="#" rel="#tab_6_contents" class="tab"><img src="{$theme_images_dir}icons/clock.gif" alt="" border="0" height="14" width="14" />&nbsp;{$translate_workorder_details_history_title}</a></li>
                </ul>

                <!-- This is used so the contents don't appear to the
                     right of the tabs -->
                <div class="clear"></div>

                <!-- This is a div that hold all the tabbed contents -->
                <div class="tab_contents_container">
                    
                    <!-- Tab 1 Contents - Work Order Details -->
                    <div id="tab_1_contents" class="tab_contents tab_contents_active">
                        <table width="100%" border="0" cellpadding="20" cellspacing="0">
                            <tr>
                                <td>
                                    <table width="700" cellpadding="5" cellspacing="0" border="0" >
                                        <tr>
                                            <td class="menuhead2" width="80%">&nbsp;{$translate_workorder_work_order_id} {$single_workorder[i].WORK_ORDER_ID}</td>
                                            <td class="menuhead2" width="20%" align="right" valign="middle">                                               
                                                <a href="index.php?page=workorder:print&amp;wo_id={$wo_id}&amp;print_content=technician_workorder_slip&amp;print_output_method=html&theme=off&page_title=CHANGE THIS TITLE" target="_blank">                                                    
                                                    <img src="{$theme_images_dir}icons/print.gif" alt="Print Works Order" border="0" height="14" width="14"
                                                    onMouseOver="ddrivetip('{$translate_workorder_print_work_order} <br> Tech translate me');"
                                                    onMouseOut="hideddrivetip();" />
                                                </a>
                                                <a href="index.php?page=workorder:print&amp;wo_id={$wo_id}&amp;print_content=customer_workorder_slip&amp;print_output_method=html&theme=off&page_title=CHANGE THIS TITLE" target="_blank">                                                    
                                                    <img src="{$theme_images_dir}icons/print.gif" alt="Print Works Order" border="0" height="14" width="14"
                                                    onMouseOver="ddrivetip('{$translate_workorder_print_work_order} <br> Customer translate me');"
                                                    onMouseOut="hideddrivetip();" />
                                                </a>
                                                <a href="index.php?page=workorder:print&amp;wo_id={$wo_id}&amp;print_content=job_sheet&amp;print_output_method=html&theme=off&page_title=CHANGE THIS TITLE" target="_blank">                                                    
                                                    <img src="{$theme_images_dir}icons/print.gif" alt="Print Works Order" border="0" height="14" width="14"
                                                    onMouseOver="ddrivetip('{$translate_workorder_print_work_order} <br> Job sheet translate me');"
                                                    onMouseOut="hideddrivetip();" />
                                                </a>
                                                <a href="" target="new">
                                                    <img src="{$theme_images_dir}icons/16x16/help.gif" border="0" alt=""
                                                    onMouseOver="ddrivetip('<b>{$translate_workorder_details_help_title|nl2br|regex_replace:"/[\r\t\n]/":" "}</b><hr><p>{$translate_workorder_details_help_content|nl2br|regex_replace:"/[\r\t\n]/":" "}</p>');"
                                                    onMouseOut="hideddrivetip();">
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="menutd2" colspan="2">
                                                <table width="100%" class="olotable" cellpadding="5" cellspacing="0" border="0" >
                                                    <tr>
                                                        <td width="100%" valign="top" >                                                            
                                                            <!-- Display Work order -->
                                                            {include file="workorder/blocks/details_header_block.tpl"}
                                                            <br>
                                                            <!-- Display Description -->
                                                            {include file="workorder/blocks/details_description_block.tpl"}
                                                            <br>
                                                            <!-- Display Comment -->
                                                            {include file="workorder/blocks/details_comments_block.tpl"}
                                                            <br>
                                                            <!-- Display Resolution -->
                                                            {include file="workorder/blocks/details_resolution_block.tpl"}                                                            
                                                            <br>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <!-- Tab 2 Contents - Customer Contact -->
                    <div id="tab_2_contents" class="tab_contents">
                        <table width="100%" border="0" cellpadding="20" cellspacing="0">
                            <tr>
                                <td>
                                    <table width="700" cellpadding="5" cellspacing="0" border="0" >
                                        <tr>
                                            <td class="menuhead2" width="80%">&nbsp;{$translate_workorder_work_order_id} {$single_workorder[i].WORK_ORDER_ID}</td>
                                            <td class="menuhead2" width="20%" align="right" valign="middle">
                                                <a href="index.php?page=workorder:print&amp;wo_id={$wo_id}&page_title=Print&theme=off" target="_blank">
                                                    <img src="{$theme_images_dir}icons/print.gif" alt="Print Works Order" border="0" height="14" width="14"
                                                    onMouseOver="ddrivetip('{$translate_workorder_print_work_order}');"
                                                    onMouseOut="hideddrivetip();" />
                                                </a>
                                                <a href="" target="new">
                                                    <img src="{$theme_images_dir}icons/16x16/help.gif" border="0" alt=""
                                                    onMouseOver="ddrivetip('<b>{$translate_workorder_details_help_title|nl2br|regex_replace:"/[\r\t\n]/":" "}</b><hr><p>{$translate_workorder_details_help_content|nl2br|regex_replace:"/[\r\t\n]/":" "}</p>');"
                                                    onMouseOut="hideddrivetip();">
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="menutd2" colspan="2">
                                                <table width="100%" class="olotable" cellpadding="5" cellspacing="0" border="0" >
                                                    <tr>
                                                        <td width="700" valign="top">                                                            
                                                            <!-- Display Customer Contact -->
                                                            {include file="workorder/blocks/details_customer_details_block.tpl"}
                                                            <br>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <!-- Tab 3 Contents - Schedule -->
                    <div id="tab_3_contents" class="tab_contents">
                        <table width="100%" border="0" cellpadding="20" cellspacing="0">
                            <tr>
                                <td>
                                    <table width="700" cellpadding="5" cellspacing="0" border="0" >
                                        <tr>
                                            <td class="menuhead2" width="80%">&nbsp;{$translate_workorder_work_order_id} {$single_workorder[i].WORK_ORDER_ID}</td>
                                            <td class="menuhead2" width="20%" align="right" valign="middle">
                                                <a href="index.php?page=workorder:print&amp;wo_id={$wo_id}&page_title=Print&theme=off" target="_blank">
                                                    <img src="{$theme_images_dir}icons/print.gif" alt="Print Works Order" border="0" height="14" width="14"
                                                    onMouseOver="ddrivetip('{$translate_workorder_print_work_order}');"
                                                    onMouseOut="hideddrivetip();" />
                                                </a>
                                                <a href="" target="new">
                                                    <img src="{$theme_images_dir}icons/16x16/help.gif" border="0" alt=""
                                                    onMouseOver="ddrivetip('<b>{$translate_workorder_details_help_title|nl2br|regex_replace:"/[\r\t\n]/":" "}</b><hr><p>{$translate_workorder_details_help_content|nl2br|regex_replace:"/[\r\t\n]/":" "}</p>');"
                                                    onMouseOut="hideddrivetip();">
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="menutd2" colspan="2">
                                                <table width="100%" class="olotable" cellpadding="5" cellspacing="0" border="0" >
                                                    <tr>
                                                        <td width="100%" valign="top">                                                            
                                                            <!-- Display Schedule -->
                                                            {include file="workorder/blocks/details_schedule_block.tpl"}
                                                            <br>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    
                    <!-- Tab 4 Contents - Notes -->
                    <div id="tab_4_contents" class="tab_contents">
                        <table width="100%" border="0" cellpadding="20" cellspacing="0">
                            <tr>
                                <td>
                                    <table width="700" cellpadding="5" cellspacing="0" border="0" >
                                        <tr>
                                            <td class="menuhead2" width="80%">&nbsp;{$translate_workorder_work_order_id} {$single_workorder[i].WORK_ORDER_ID}</td>
                                            <td class="menuhead2" width="20%" align="right" valign="middle">
                                                <a href="index.php?page=workorder:print&amp;wo_id={$wo_id}&page_title=Print&theme=off" target="_blank">
                                                    <img src="{$theme_images_dir}icons/print.gif" alt="Print Works Order" border="0" height="14" width="14"
                                                    onMouseOver="ddrivetip('{$translate_workorder_print_work_order}');"
                                                    onMouseOut="hideddrivetip();" />
                                                </a>
                                                <a href="" target="new">
                                                    <img src="{$theme_images_dir}icons/16x16/help.gif" border="0" alt=""
                                                    onMouseOver="ddrivetip('<b>{$translate_workorder_details_help_title|nl2br|regex_replace:"/[\r\t\n]/":" "}</b><hr><p>{$translate_workorder_details_help_content|nl2br|regex_replace:"/[\r\t\n]/":" "}</p>');"
                                                    onMouseOut="hideddrivetip();">
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="menutd2" colspan="2">
                                                <table width="100%" class="olotable" cellpadding="5" cellspacing="0" border="0" >
                                                    <tr>
                                                        <td width="100%" valign="top">                                                            
                                                            <!-- Display Work Order Notes -->
                                                            {include file="workorder/blocks/details_notes_block.tpl"}
                                                            <br>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <!-- Tab 5 Contents - Parts -->
                    <div id="tab_5_contents" class="tab_contents">
                        <table width="100%" border="0" cellpadding="20" cellspacing="0">
                            <tr>
                                <td>
                                    <table width="700" cellpadding="5" cellspacing="0" border="0" >
                                        <tr>
                                            <td class="menuhead2" width="80%">&nbsp;{$translate_workorder_work_order_id} {$single_workorder[i].WORK_ORDER_ID}</td>
                                            <td class="menuhead2" width="20%" align="right" valign="middle">
                                                <a href="index.php?page=workorder:print&amp;wo_id={$wo_id}&page_title=Print&theme=off" target="_blank">
                                                    <img src="{$theme_images_dir}icons/print.gif" alt="Print Works Order" border="0" height="14" width="14"
                                                    onMouseOver="ddrivetip('{$translate_workorder_print_work_order}');"
                                                    onMouseOut="hideddrivetip();" />
                                                </a>
                                                <a href="" target="new">
                                                    <img src="{$theme_images_dir}icons/16x16/help.gif" border="0" alt=""
                                                    onMouseOver="ddrivetip('<b>{$translate_workorder_details_help_title|nl2br|regex_replace:"/[\r\t\n]/":" "}</b><hr><p>{$translate_workorder_details_help_content|nl2br|regex_replace:"/[\r\t\n]/":" "}</p>');"
                                                    onMouseOut="hideddrivetip();">
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="menutd2" colspan="2">
                                                <table width="100%" class="olotable" cellpadding="5" cellspacing="0" border="0" >
                                                    <tr>
                                                        <td width="100%" valign="top">                                                            
                                                            <!-- Dispaly Parts -->
                                                            {include file="workorder/blocks/details_parts_block.tpl"}
                                                            <br>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                                                            
                    <!-- Tab 6 Contents - History -->
                    <div id="tab_6_contents" class="tab_contents">
                        <table width="100%" border="0" cellpadding="20" cellspacing="0">
                            <tr>
                                <td>
                                    <table width="700" cellpadding="5" cellspacing="0" border="0" >
                                        <tr>
                                            <td class="menuhead2" width="80%">&nbsp;{$translate_workorder_work_order_id} {$single_workorder[i].WORK_ORDER_ID}</td>
                                            <td class="menuhead2" width="20%" align="right" valign="middle">
                                                <a href="index.php?page=workorder:print&amp;wo_id={$wo_id}&page_title=Print&theme=off" target="_blank">
                                                    <img src="{$theme_images_dir}icons/print.gif" alt="Print Works Order" border="0" height="14" width="14"
                                                    onMouseOver="ddrivetip('{$translate_workorder_print_work_order}');"
                                                    onMouseOut="hideddrivetip();" />
                                                </a>
                                                <a href="" target="new">
                                                    <img src="{$theme_images_dir}icons/16x16/help.gif" border="0" alt=""
                                                    onMouseOver="ddrivetip('<b>{$translate_workorder_details_help_title|nl2br|regex_replace:"/[\r\t\n]/":" "}</b><hr><p>{$translate_workorder_details_help_content|nl2br|regex_replace:"/[\r\t\n]/":" "}</p>');"
                                                    onMouseOut="hideddrivetip();">
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="menutd2" colspan="2">
                                                <table width="100%" class="olotable" cellpadding="5" cellspacing="0" border="0" >
                                                    <tr>
                                                        <td width="100%" valign="top">                                                            
                                                            <!-- Display Work Order History -->
                                                            {include file="workorder/blocks/details_history_block.tpl"}
                                                            <br>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </td>
    </tr>
</table>
{/section}