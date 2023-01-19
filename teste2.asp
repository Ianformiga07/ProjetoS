<html>
<p>oiii</p>
<body>
	<script>
		//Manipulando as linhas
		function ocultaRow (rowIndex) {
			var table = document.getElementById('tabela1');
			table.rows[rowIndex].style.display = 'none';
		}

		function mostraRow (rowIndex) {
			var table = document.getElementById('tabela1');
			table.rows[rowIndex].style.display = '';
		}
		
		//Manipulando as colunas
		function ocultaColumn (colIndex) {
			var table = document.getElementById('tabela1');
			for (var r = 0; r < table.rows.length; r++)
				table.rows[r].cells[colIndex].style.display = 'none';
		}
		function mostraColumn (colIndex) {
			var table = document.getElementById('tabela1');
			for (var r = 0; r < table.rows.length; r++)
				table.rows[r].cells[colIndex].style.display = '';
		}
	</SCRIPT>

	<FORM>
		Manipular Linhas
		<SELECT NAME="rowIdx">
		<script>
			for (var i = 1; i <= 4; i++)
				document.write('<OPTION VALUE="' + i + '">' + i);
		</SCRIPT>
		</SELECT>
		<INPUT TYPE="button" VALUE="esconder linha" ONCLICK="ocultaRow(this.form.rowIdx.selectedIndex);">
		<INPUT TYPE="button" VALUE="mostrar linha" ONCLICK="mostraRow(this.form.rowIdx.selectedIndex);">
	</FORM>
	
	<FORM>
		Manipular Colunas
		<SELECT NAME="colIdx">
		<script>
			for (var i = 1; i <= 2; i++)
				document.write('<OPTION VALUE="' + i + '">' + i);
		</SCRIPT>
		</SELECT>
		<INPUT TYPE="button" VALUE="esconder coluna" ONCLICK="ocultaColumn(this.form.colIdx.selectedIndex);">
		<INPUT TYPE="button" VALUE="mostrar coluna" ONCLICK="mostraColumn(this.form.colIdx.selectedIndex);">
	</FORM>
	
	<table width="100%"  border="1" id="tabela1">
		<tr id="1">
			<td>LINHA 1</td>
			<td>TESTE 1</td>
		</tr>
		<tr id="2">
			<td>LINHA 2</td>
			<td>TESTE 2</td>
		</tr>
		<tr id="3">
			<td>LINHA 3</td>
			<td>TESTE 3</td>
		</tr>
		<tr id="4">
			<td>LINHA 4</td>
			<td>TESTE 4</td>
		</tr>
	</table>

</body>
</html>