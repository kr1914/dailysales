<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<Style>
.AcctMgtInsertOverlay{width:100%;height:100%; background-color:rgb(115,115,115,0.2);
position:fixed;top:0px;  }
.AcctMgtWrap{border-radius: 19px; padding:10px; border: solid 5px #543ad4ab; background-color:#f5f5f5; position:fixed; left:150px; top:-100px; margin:0 auto;text-align: center; margin-top:200px; width: 550px;z-index:20;}
.AcctInsertTitle {text-align: left; height:30px; background:linear-gradient(150deg, #ff7575, #ff7d7dc7); border-radius: 8px; padding-left:5px; padding-top:6px; font-weight:bold;}
.AcctInsertExitBtn{	position: absolute;	right: 5px;	top: 5px; cursor: pointer;}
.AcctInsertExitBtn > img {width:20px;}
.AcctInsertTable table{text-align: center; padding: 10px 30px 30px 30px; margin-top:15px;}
.AcctInsertTable td{ padding: 5px 0 5px 0; font-size:11px;}
.AcctInsertTable td:nth-child(2n-1){width:130px;}
.AcctInsertTable td:nth-child(2n){text-align: left; padding-right:10px; width: 150px;}
.AcctInsertTable textarea{border-radius: 15px; box-shadow:2px 2px 2px gray; padding-left:5px; margin-top:-2px; border:none; width:100%;}
.postInput {width:60px;}
.addrInput {width:100%;}
.findPost1, .findPost2 {border-radius: 15px;   border: none;   margin-left: 8px;   box-shadow: 1px 1px 3px #00000085;    background-color: #ffd7d7;}
.acctInput {border-radius: 15px; box-shadow:2px 2px 2px gray; height:18px;  padding-left:5px; margin-top:-2px; border:none;}
.acctInput:focus, .AcctInsertTable textarea:focus { outline:none; border: solid 1px red;}
.acctInputBtn {width:70px; height: 25px; margin:5px 10px 5px 10px;}
.acctInputBtn:first-child {box-shadow: 3px 5px 6px 0.5px #8e888887; border: none; background: linear-gradient(132deg, #1b3fef, #171a8b87); color: white; border-radius: 6px; font-weight: bold;}
.acctInputBtn:last-child {box-shadow: 3px 5px 6px 0.5px #8e888887; border: none; background: linear-gradient(132deg, #f3c7c7, #45424217); border-radius: 6px;}
</Style>
<script type="text/javascript">
	
//????????? ??????
	$(document).on('click','input[type="submit"]', function() {
		var check = new Array();
		var memo = $('textarea[name="acct_memo"]').val();

		
		//jquery??? ?????? ?????? _ 
		$('.acctInput').each(function name(index, item) {
			check.push($(item).val());
		});
	
		
	);
	
</script>
	<div class="AcctMgtInsertOverlay">
	</div>
	<div class="AcctMgtInsertWrap">
		<div class="AcctMgtWrap">
			<form action="AcctMgtInsert.do">
				<div class="AcctInsertTitle">
				?????? ??????
				<div class="AcctInsertExitBtn"><img src="../../img/exit_01.png" alt="??????"></div>
				</div>
				<div class="AcctInsertTable">
				<table>
					<tr>
						<td>?????????*</td>
						<td><input class="acctInput" type="text" name="acct_name" value=""></td>
						<td>??????</td>
						<td><input class="acctInput" type="text" name="acct_cla" value=""></td>
					</tr>
					<tr>
						<td>?????????</td>
						<td><input class="acctInput" type="text" name="acct_bank" value=""></td>
						<td>????????????</td>
						<td><input class="acctInput" type="text" name="acct_owner" value=""></td>
					</tr>
					<tr>
						<td>????????????</td>
						<td colspan="3"><input class="acctInput" type="text" name="acct_id" value=""></td>
					</tr>
					<tr>
						<td>??????</td>
						<td colspan="3"><textarea name="acct_memo" rows="6" cols="50"></textarea></td>
					</tr>
					<tr>
						<td colspan="4"><input class="acctInputBtn" type="submit" value="??????"><input class="acctInputBtn acctInsertCancel" type="button" value="??????"></td>
					</tr>
				</table>
				</div>
			</form>
		</div>
	</div>
