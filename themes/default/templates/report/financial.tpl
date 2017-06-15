<!-- financial.tpl -->
<link rel="stylesheet" href="{$theme_js_dir}jscal2/css/jscal2.css" />
<link rel="stylesheet" href="{$theme_js_dir}jscal2/css/steel/steel.css" />
<script src="{$theme_js_dir}jscal2/jscal2.js"></script>
<script src="{$theme_js_dir}jscal2/unicode-letter.js"></script>
<script>{include file="`$theme_js_dir_finc`jscal2/language.js"}</script>

<form action="index.php?page=report:financial" method="POST" name="stats_report" id="stats_report"> 
    <table width="650px" border="0" cellpadding="20" cellspacing="5">
        <tr>
            <td class="olotd">
                <table width="100%" cellpadding="4" cellspacing="0" border="0" >
                    <tr align="left">
                        <td><b>{t}Report Date From{/t}: </b></td>
                        <td><b>{t}Report Date To{/t}: </b></td>
                    </tr>
                    <tr>
                        <td align="left">
                            <input id="start_date" name="start_date" class="olotd5" size="10" value="{$start_date|date_format:$date_format}" type="text" maxlength="10" pattern="{literal}^[0-9]{1,2}(\/|-)[0-9]{1,2}(\/|-)[0-9]{2,2}([0-9]{2,2})?${/literal}" required onkeydown="return onlyDate(event);">
                            <input id="start_date_button" value="+" type="button" >
                            <script>                            
                                Calendar.setup( {
                                    trigger     : "start_date_button",
                                    inputField  : "start_date",
                                    dateFormat  : "{$date_format}"                                                                                            
                                } );                            
                            </script>                
                        </td>
                        <td>
                            <input id="end_date" name="end_date" class="olotd5" size="10" value="{$end_date|date_format:$date_format}" type="text" maxlength="10" pattern="{literal}^[0-9]{1,2}(\/|-)[0-9]{1,2}(\/|-)[0-9]{2,2}([0-9]{2,2})?${/literal}" required onkeydown="return onlyDate(event);">
                            <input id="end_date_button" value="+" type="button">                    
                            <script>                            
                                Calendar.setup( {
                                    trigger     : "end_date_button",
                                    inputField  : "end_date",
                                    dateFormat  : "{$date_format}"                                                                                            
                                } );                            
                            </script>                    
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center"><button type="submit" name="submit" value="submit">{t}Submit{/t}</button></td>
        </tr>
    </table>
    <table width="650px" class="olotable"  border="0" cellpadding="4" cellspacing="0">
        <tr>
            <td class="olotd">
                <table width="100%" cellpadding="4" cellspacing="0" border="0" >
                    <tr>
                        <td class="menuhead2" width="100%">&nbsp;{t}Basic Statisitics{/t}
                            <a style="float:right;">                                
                                <img src="{$theme_images_dir}icons/16x16/help.gif" border="0" onMouseOver="ddrivetip('<div><strong>{t escape=tooltip}REPORT_FINANCIAL_BASIC_STATS_HELP_TITLE{/t}</strong></div><hr><div>{t escape=tooltip}REPORT_FINANCIAL_BASIC_STATS_HELP_CONTENT{/t}</div>');" onMouseOut="hideddrivetip();">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="olotd5" colspan="2">
                            <table width="100%"class="olotable"  border="0" cellpadding="5" cellspacing="0">
                                <tr>
                                    <td class="olohead">{t}Customers{/t}</td>
                                    <td class="olohead">{t}Work Orders{/t}</td>
                                    <td class="olohead">{t}Invoices{/t}</td>
                                    <td class="olohead">{t}Revenue (Gross){/t}</td>
                                </tr>
                                <tr>
                                    <td class="olotd4" valign="top">
                                        <table>
                                            <tr>
                                                <td><b>{t}New{/t}:</b></td>
                                                <td><font color="red"<b> {$new_customers}</b></font></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="olotd4" valign="top">
                                        <table >
                                            <tr>
                                                <td><b>{t}Opened{/t}:</b></td>
                                                <td><font color="red"<b> {$wo_opened}</b></font></td>
                                            </tr>
                                            <tr>
                                                <td><b>{t}Closed{/t}:</b></td>
                                                <td><font color="red"<b> {$wo_closed}</b></font></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="olotd4" valign="top">
                                        <table>
                                            <tr>
                                                <td><b>{t}New{/t}:</b></td>
                                                <td><font color="red"<b> {$new_invoices}</b></font></td>
                                            </tr>
                                            <tr>
                                                <td><b>{t}Paid{/t}:</b></td>
                                                <td><font color="red"<b> {$paid_invoices}</b></font></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="olotd4" valign="top">
                                        <table>
                                            <tr>
                                                <td><b>{t}Total Invoiced{/t}:</b></td>
                                                <td><font color="red"<b>{$currency_sym}{$invoice_amount_sum|string_format:"%.2f"}</b></font></td>
                                            </tr>
                                            <tr>
                                                <td><b>{t}Total Expenses{/t}:</b></td>
                                                <td><font color="red"<b>{$currency_sym}{$expense_gross_amount_sum|string_format:"%.2f"}</b></font></td>
                                            </tr>
                                            <tr>
                                                <td> <b>{t}Total Refunds{/t}:</b></td>
                                                <td><font color="red"<b>{$currency_sym}{$refund_gross_amount_sum|string_format:"%.2f"}</b></font></td>
                                            </tr>
                                            <tr>
                                                <td><b>{t}Taxable Profit{/t}:</b></td>
                                                <td><font color="red"<b>{$currency_sym}{$taxable_profit_amount|string_format:"%.2f"}</b></font></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <div style="width: 65%; text-align: center;">{t}Taxable Profit = Invoiced - (Expenses - Refunds){/t}</div>
    <br />
    <table width="650px" class="olotable"  border="0" cellpadding="4" cellspacing="0">
        <tr>
            <td class="olotd">
                <table width="100%" cellpadding="4" cellspacing="0" border="0" >
                    <tr>
                        <td class="menuhead2" width="100%">&nbsp;{t}Advanced Statistics{/t}
                            <a style="float:right;">                                
                                <img src="{$theme_images_dir}icons/16x16/help.gif" border="0" onMouseOver="ddrivetip('<div><strong>{t escape=tooltip}REPORT_FINANCIAL_ADVANCED_STATS_HELP_TITLE{/t}</strong></div><hr><div>{t escape=tooltip}REPORT_FINANCIAL_ADVANCED_STATS_HELP_CONTENT{/t}</div>');" onMouseOut="hideddrivetip();">
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="olotd5" colspan="2">
                            <table width="100%"class="olotable"  border="0" cellpadding="5" cellspacing="0">
                                <tr>
                                    <td class="olohead">{t}Parts{/t}</td>
                                    <td class="olohead">{t}Labour{/t}</td>
                                    <td class="olohead">{t}Expenses{/t}</td>
                                    <td class="olohead">{t}Refunds{/t}</td>
                                    <td class="olohead">{t}Invoices{/t}</td>
                                </tr>
                                <tr>
                                    <td class="olotd4" valign="top">
                                        <table>
                                            <tr>
                                                <td><b>{t}Items{/t}:</b></td>
                                                <td><font color="red"<b> {$parts_different_items_count}</b></font></td>
                                            </tr>
                                            <tr>
                                                <td><b>{t}Qty{/t}:</b></td>
                                                <td><font color="red"<b> {$parts_items_sum}</b></font></td>
                                            </tr>
                                            <tr>
                                                <td><b>{t}Sub{/t}:</b></td>
                                                <td><font color="red"<b>{$currency_sym}{$parts_sub_total_sum|string_format:"%.2f"}</b></font></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="olotd4" valign="top">
                                        <table>
                                            <tr>
                                                <td><b>{t}Items{/t}:</b></td>
                                                <td><font color="red"<b> {$labour_different_items_count}</b></font></td>
                                            </tr>
                                            <tr>
                                                <td><b>{t}Qty{/t}:</b></td>
                                                <td><font color="red"<b>{$labour_items_sum}</b></font></td>
                                            </tr>
                                            <tr>
                                                <td><b>{t}Sub{/t}:</b></td>
                                                <td><font color="red"<b>{$currency_sym}{$labour_sub_total_sum|string_format:"%.2f"}</b></font></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="olotd4" valign="top">
                                        <table>
                                            <tr>
                                                <td><b>{t}Net{/t}:</b></td>
                                                <td><font color="red"<b>{$currency_sym}{$expense_net_amount_sum|string_format:"%.2f"}</b></font></td>
                                            </tr>
                                            <tr>
                                                <td><b>{t}Tax{/t}:</b></td>
                                                <td><font color="red"<b>{$currency_sym}{$expense_tax_amount_sum|string_format:"%.2f"}</b></font></td>
                                            </tr>
                                            <tr>
                                                <td><b>{t}Gross{/t}:</b></td>
                                                <td><font color="red"<b>{$currency_sym}{$expense_gross_amount_sum|string_format:"%.2f"}</b></font></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="olotd4" valign="top">
                                        <table>
                                            <tr>
                                                <td><b>{t}Net{/t}:</b></td>
                                                <td><font color="red"<b>{$currency_sym}{$refund_net_amount_sum|string_format:"%.2f"}</b></font></td>
                                            </tr>
                                            <tr>
                                                <td><b>{t}Tax{/t}:</b></td>
                                                <td><font color="red"<b>{$currency_sym}{$refund_tax_amount_sum|string_format:"%.2f"}</b></font></td>
                                            </tr>
                                            <tr>
                                                <td><b>{t}Gross{/t}:</b></td>
                                                <td><font color="red"<b>{$currency_sym}{$refund_gross_amount_sum|string_format:"%.2f"}</b></font></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td class="olotd4" valign="top">
                                        <table>
                                            <tr>
                                                <td><b>{t}Sub{/t}:</b></td>
                                                <td><font color="red"<b>{$currency_sym}{$invoice_sub_total_sum|string_format:"%.2f"}</b></font></td>
                                            </tr>
                                            <tr>
                                                <td><b>{t}Discount{/t}:</b></td>
                                                <td><font color="red"<b>{$currency_sym}{$invoice_discount_sum|string_format:"%.2f"}</b></font></td>
                                            </tr>                                            
                                            <tr>
                                                <td><b>{t}Tax{/t}:</b></td>
                                                <td><font color="red"<b>{$currency_sym}{$invoice_tax_sum|string_format:"%.2f"}</b></font></td>
                                            </tr>
                                            <tr>
                                                <td><b>{t}Gross{/t}:</b></td>
                                                <td><font color="red"<b>{$currency_sym}{$invoice_amount_sum|string_format:"%.2f"}</b></font></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>