<!-- new_payment_cash_block.tpl -->
<form method="post" action="index.php?page=payment:new&invoice_id={$invoice_id}">
    <table width="100%" cellpadding="4" cellspacing="0" border="0" >
        <tr>
            <td class="menuhead2">&nbsp;{$translate_payment_cash}</td>
        </tr>
        <tr>
            <td class="menutd2">
                <table width="100%" cellpadding="4" cellspacing="0" border="0" width="100%" class="olotable">
                    <tr class="olotd4">
                        <td class="row2"></td>
                        <td class="row2"><b>{$translate_payment_amount}</b></td>
                    </tr>
                    <tr class="olotd4">
                        <td></td>                        
                        <td>{$currency_sym}<input name="amount" class="olotd5" size="10" value="{$balance|string_format:"%.2f"}" type="text" maxlength="10" required pattern="{literal}[0-9]{1,7}(.[0-9]{0,2})?{/literal}" required onkeydown="return onlyNumbersPeriod(event);"/></td>
                    </tr>
                    <tr>
                        <td valign="top"><b>{$translate_payment_note}</b></td>
                        <td><textarea name="note" cols="60" rows="4" class="olotd4"></textarea></td>
                    </tr>
                </table>
                <p>                    
                    <input type="hidden" name="type" value="3">                    
                    <button type="submit" name="submit" value="submit">Submit Cash Payment</button>
                </p>
            </td>
        </tr>
    </table>
</form>