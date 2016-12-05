<!-- main.tpl - Schedule -->

<link rel="stylesheet" href="{$theme_js_dir}jscal2/css/jscal2.css" />
<link rel="stylesheet" href="{$theme_js_dir}jscal2/css/steel/steel.css" />
<script src="{$theme_js_dir}jscal2/jscal2.js"></script>
<script src="{$theme_js_dir}jscal2/unicode-letter.js"></script>
<script>{include file='../js/jscal2/language.js'}</script>
{literal}
<script>
    function go()
    {
        box = document.forms[0].page_no;
        destination = box.options[box.selectedIndex].value;
        if (destination) location.href = destination;
    }
</script>
{/literal}
<table width="100%" border="0" cellpadding="20" cellspacing="5">
    <tr>
        <td>
            <table width="700" cellpadding="4" cellspacing="0" border="0" >
                <tr>
                    <td class="menuhead2" width="100%" align="center">&nbsp;{$translate_schedule_view} {$cur_date}</td>
                    </td>
                </tr><tr>
                    <td class="menutd2" colspan="3">
                        <table class="olotable" width="100%" border="0" cellpadding="5" cellspacing="0">
                            <tr>
                                <td class="menutd">
                        
                                    <table width="100%" border="0" cellpadding="10" cellspacing="0">
                                        <tr>
                                            <td>new<a name="assigned"></a>{include file='schedule/blocks/schedule_new_workorder_block.tpl'}</td>
                                        </tr>
                                        <tr>
                                            <td>open<a name="new"></a>{include file='schedule/blocks/schedule_open_workorder_block.tpl'}</td>
                                        </tr>                                        
                                        <tr>
                                            <td>assigned<a name="assigned"></a>{include file='schedule/blocks/schedule_assigned_workorder_block.tpl'}</td>
                                        </tr>
                                    </table>
                        
                                    {if $wo_id != 0}
                                        <table class="olotablered" width="100%" border="0" cellpadding="5" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <span class="error_font">{$translate_schedule_info} </span> {$translate_schedule_msg_1} {$wo_id} {$translate_schedule_msg_2}
                                                </td>
                                            </tr>
                                        </table>
                                        <br>
                                    {/if}
                                    
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td height="81"  align="center" >
                                                <div id="calendar-container"></div>                                
                                                {literal}
                                                <script>
                                                    Calendar.setup({
                                                        cont: 'calendar-container',                                                     
                                                        onSelect : function(calendar){                                                                        
                                                                        var selectedDate = calendar.selection.get();            // get the selected date
                                                                        var dateForLink = Calendar.intToDate(selectedDate);     // converts into a JavaScript date object
                                                                        
                                                                        var y = dateForLink.getFullYear();
                                                                        var M = dateForLink.getMonth();                         // integer, 0..11
                                                                        var m = M + 1;                                          // Correction for assignment issue above
                                                                        var d = dateForLink.getDate();                          // integer, 1..31
                                                                        // redirect...
                                                                        window.location = "?page=schedule:main&y="+y+"&m="+m+"&d="+d+"&wo_id={/literal}{$wo_id}{literal}&page_title={/literal}{$translate_schedule_schedule}{literal}";
                                                                    }
                                                    });
                                                </script>
                                                {/literal}
                                            </td>
                                        </tr>
                                    </table>
                        <!-- Content -->
                        <table width="100%" cellpadding="4" cellspacing="0" border="0">
                            <tr>
                                <td><button type="submit" name="{$translate_schedule_print}" OnClick=location.href="?page=schedule:print&amp;y={$y}&amp;m={$m}&amp;d={$d}&amp;theme=off" >{$translate_schedule_print}</button> </td>
                                <td valign="top" align="right" valign="middle">
                                {if $cred.EMPLOYEE_TYPE <> 3 }
                                    <form>
                                        <select name="page_no" onChange="go()">
                                        {section name=i loop=$tech}
                                            <option value="?page=schedule:main&amp;tech={$tech[i].EMPLOYEE_ID}
                                                {foreach from=$date_array key=key item=item}
                                                    &{$key}={$item}
                                                {/foreach}
                                                &page_title=schedule" {if $selected == $tech[i].EMPLOYEE_ID} Selected {/if}>
                                            {$tech[i].EMPLOYEE_LOGIN}
                                        </option>
                                        {/section}
                                    </select>
                                </form>
                                {/if}
                            </td>
                        </tr>
                    </table>
                        {$calendar}
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
