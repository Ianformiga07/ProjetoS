<html>
<head>
    <title>Cadastro de Su&iacute;deos</title>
	 <link rel="stylesheet" href="estilo_Suino.css">
	<center>
<script type="text/javascript" language="JavaScript1.2" src="../../cabecalho/stmenu.js"></script>
<script type="text/javascript" language="JavaScript1.2"></script>
<link rel="stylesheet" type="text/css" href="estilo_Suino.css">

<body bgcolor="#FFFFFF" leftmargin="5" topmargin="5">
<table border="0" cellpadding="0" cellspacing="0" width="700" align="center">
  <tr>
   
  </tr>

  <tr>
  <td>
</td>
  </tr>
  <tr>
    <td>


</td>
  </tr>

</table>
<div id="Layer1" style="position:absolute; right:325px; top:20px; width:291px; height:17px; z-index:1">
  <div align="right"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Palmas,
    <script language="JavaScript">
dia = new Date();
	ano = dia.getYear();
if (ano < 2000) // corre&ccedil;ao para browsers que retornam 100 no ano 2000
{
  ano = 1900 + dia.getYear();
  }
mes = new Array("Janeiro","Fevereiro","Mar&ccedil;o","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro")
dia_semana = new Array("Domingo","Segunda-feira","Ter&ccedil;a-feira","Quarta-feira","Quinta-feira","Sexta-feira","S&aacute;bado");
hora = dia.getHours();
if (hora < 10)
  {
  hora = "0" + hora;
  }
minuto = dia.getMinutes();
if (minuto < 10)
  {
  minuto = "0" + minuto;
  }

document.writeln(dia.getDate() + " de " +  mes[dia.getMonth()] + " de " + ano);
      </script>
  </strong> </font></div>
</div></center>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.all.min.js"></script>
<script type="text/JavaScript">
function cadastrar(){

    if(validacao() == false)
    return false;
	
	document.frm_Suinos.Operacao.value = 1;
	document.frm_Suinos.action = "frm_Cad_Alter_Suino.asp";
	document.frm_Suinos.submit();
}

function alterar(idSuideos, CpfProdutor, CodINCRA)
{

	document.frm_Suinos.Operacao.value = 3;
	document.frm_Suinos.action = "frm_Cad_Alter_Suino.asp?idSuideos="+idSuideos+"&CNPJCPFProdutor="+CpfProdutor+"&INCRAProp="+CodINCRA;
	document.frm_Suinos.submit();
}

function ConsultarModulo()
{
	document.frm_Suinos.Operacao.value = 4;
	document.frm_Suinos.action = "frm_Cad_Alter_Suino.asp";
	document.frm_Suinos.submit();
}

function grau_minuto(campo)
{
	if(campo.value == "")
		return false;

	if (isNaN(parseInt(campo.value,10)))
	{          
		alert("O campo minutos deve ser um n\u00famero valido no formato 99"); 	       
		campo.value="00";
		campo.focus();
	}	 
	
	campo.value = parseInt(campo.value,10);
	if(campo.value.length == 1)
		campo.value = "0" + parseInt(campo.value,10);     
	else
		campo.value = parseInt(campo.value,10);     

}

function segundo(campo)
{
	if(campo.value == "")
		return false;

		
		
	if(isNaN(parseFloat(campo.value)))
	{
		alert("O campo segundos deve ser um n\u00famero valido formato 99.9");
		campo.value = "00.0";
		campo.focus();

	}
	campo.value = parseFloat(campo.value);
		
	if(campo.value.indexOf(".") == -1)
		if(campo.value.length <= 2)
			campo.value = campo.value + ".0";
		else
		{
			alert("A formata\u00e7\u00e3o dos segundos deve ser 99.9");
			campo.value = "00.0";
			campo.focus();
		}

	if((campo.value.indexOf(".") == 1) && (campo.value.length == 4))
		campo.value = campo.value.substr(0, campo.value.length-1);
		
	if(campo.value.length == 3)
		campo.value = "0" + campo.value;
}


function validaCoordenadas(frm_Suinos)
{
	if((frm_Suinos.edLatG.value != "") || (frm_Suinos.edLatM.value != "") || (frm_Suinos.edLatS.value != ""))
	{
		if(frm_Suinos.edLatG.value == "")
		{
			alert("O campo Graus deve ser preenchido!")
			frm_Suinos.edLatG.focus();
			return false;
		}
		if((frm_Suinos.edLatG.value < 5) || (frm_Suinos.edLatG.value > 14))
		{
			alert("A Latitude deve estar entre 5Â°S e 14Â°S!")
			frm_Suinos.edLatG.focus();
			return false;
		}
		if(frm_Suinos.edLatM.value == "")
		{
			alert("O campo Minutos deve ser preenchido!")
			frm_Suinos.edLatM.focus();
			return false;
		}
		if(frm_Suinos.edLatM.value >= 60)
		{
			alert("O campo Minutos n\u00e3o pode ser igual ou superior a 60!")
			frm_Suinos.edLatM.focus();
			return false;
		}
		if(frm_Suinos.edLatS.value == "")
		{
			alert("O campo Segundos deve ser preenchido!")
			frm_Suinos.edLatS.focus();
			return false;
		}
		if(frm_Suinos.edLatS.value >= 60)
		{
			alert("O campo Segundos n\u00e3o pode ser igual ou superior a 60!")
			frm_Suinos.edLatS.focus();
			return false;
		}
	}
	if((frm_Suinos.edLongG.value != "") || (frm_Suinos.edLongM.value != "") || (frm_Suinos.edLongS.value != ""))
	{
		if(frm_Suinos.edLongG.value == "")
		{
			alert("O campo Graus deve ser preenchido!")
			frm_Suinos.edLongG.focus();
			return false;
		}
		if((frm_Suinos.edLongG.value < 41) || (frm_Suinos.edLongG.value > 51))
		{
			alert("A Longitude deve estar entre 45Â°W e 51Â°W!")
			frm_Suinos.edLongG.focus();
			return false;
		}
		if(frm_Suinos.edLongM.value == "")
		{
			alert("O campo Minutos deve ser preenchido!")
			frm_Suinos.edLongM.focus();
			return false;
		}
		if(frm_Suinos.edLongM.value >= 60)
		{
			alert("O campo Minutos n\u00e3o pode ser igual ou superior a 60!")
			frm_Suinos.edLongM.focus();
			return false;
		}
		if(frm_Suinos.edLongS.value == "")
		{
			alert("O campo Segundos deve ser preenchido!")
			frm_Suinos.edLongS.focus();
			return false;
		}
			if(frm_Suinos.edLongS.value >= 60)
		{
			alert("O campo Segundos n\u00e3o pode ser igual ou superior a 60!")
			frm_Suinos.edLongS.focus();
			return false;
		}
	}
	return true;
}


function validacao(){
	
	if (document.frm_Suinos.NumeroCadastro.value  == "")
	{
		alert("Informe o N\u00famero do Cadastro!");
	   document.frm_Suinos.NumeroCadastro.focus();
	    return false;
	}
    if (document.frm_Suinos.AreaProp.value  == "")
	{
		alert("Informe a \u00c1rea da Propriedade!");
	   document.frm_Suinos.AreaProp.focus();
	    return false;
	}
    if (document.frm_Suinos.AreaConstruida.value  == "")
	{
		alert("Informe a \u00c1rea Construida!");
	   document.frm_Suinos.AreaConstruida.focus();
	    return false;
	}
    if (document.frm_Suinos.Galpoes.value  == "")
	{
		alert("Informe a quantidade de Galp\u00f5es!");
	   document.frm_Suinos.Galpoes.focus();
	    return false;
	}

    if (document.frm_Suinos.CapacidadeAlojamento.value  == "")
	{
		alert("Informe a Capacidade de Alojamento!");
	   document.frm_Suinos.CapacidadeAlojamento.focus();
	    return false;
	}

	if (document.frm_Suinos.edLatG.value == ""){
    alert("Informe a Latitude!");
    document.frm_Suinos.edLatG.focus(); 
    return(false);   
    }
  
 	if (document.frm_Suinos.edLongG.value == ""){
    alert("Informe a Longitude!");
    document.frm_Suinos.edLongG.focus(); 
    return(false);   
 	}
	if(!validaCoordenadas(frm_Suinos))
	return(false);

    if (document.frm_Suinos.DistanciaProx.value  == "")
	{
		alert("Informe a distancia da via mais pr\u00f3xima!");
	   document.frm_Suinos.DistanciaProx.focus();
	    return false;
	}

    if (document.frm_Suinos.DistanciaEstab.value  == "")
	{
		alert("Informe a distancia do estab. com suinos mais pr\u00f3ximo!");
	   document.frm_Suinos.DistanciaEstab.focus();
	    return false;
	}

	tecnificacao = document.frm_Suinos.tecnificacao.length;
	cont = 0;
	for (i=0;i<tecnificacao;i++) { //------------------------
	  if (frm_Suinos.tecnificacao[i].checked) {
		cont++;
		break;
	  }
	}
	if (cont==0) {
	  alert("Selecione as Popula\u00e7\u00e3o!");
	  frm_Suinos.tecnificacao[0].focus();
	  return false;
	}

    if (document.frm_Suinos.qtd_matrizes.value  == "")
	{
		alert("Informe a Quantidade de Matrizes!");
	   document.frm_Suinos.qtd_matrizes.focus();
	    return false;
	}

    if (document.frm_Suinos.qtd_cachacos.value  == "")
	{
		alert("Informe a Quantidade de Cacha\u00e7os!");
	   document.frm_Suinos.qtd_cachacos.focus();
	    return false;
	}

    if (document.frm_Suinos.qtd_matern.value  == "")
	{
		alert("Informe a Quantidade de Leit\u00f5es Maternos!");
	   document.frm_Suinos.qtd_matern.focus();
	    return false;
	}

    if (document.frm_Suinos.qtd_creche.value  == "")
	{
		alert("Informe a Quantidade de Leit\u00f5es Creche!");
	   document.frm_Suinos.qtd_creche.focus();
	    return false;
	}

    if (document.frm_Suinos.qtd_term.value  == "")
	{
		alert("Informe a Quantidade de Leit\u00f5es terminais!");
	   document.frm_Suinos.qtd_term.focus();
	    return false;
	}
    if (document.frm_Suinos.qtd_matrizesNaoTec.value  == "")
	{
		alert("Informe a Quantidade de Matrizes n\u00e3o tecnificadas!");
	   document.frm_Suinos.qtd_matrizesNaoTec.focus();
	    return false;
	}

    if (document.frm_Suinos.qtd_cachacosNaoTec.value  == "")
	{
		alert("Informe a Quantidade de Cacha\u00e7os n\u00e3o tecnificadas!");
	   document.frm_Suinos.qtd_cachacosNaoTec.focus();
	    return false;
	}

    if (document.frm_Suinos.qtd_menor8.value  == "")
	{
		alert("Informe a Quantidade de Leit\u00f5es Menor de 8 meses!");
	   document.frm_Suinos.qtd_menor8.focus();
	    return false;
	}

    if (document.frm_Suinos.qtd_maior8.value  == "")
	{
		alert("Informe a Quantidade de Leit\u00f5es Maior de 8 meses!");
	   document.frm_Suinos.qtd_maior8.focus();
	    return false;
	}

	chkRisco = document.frm_Suinos.chkRisco.length;
	cont = 0;
	for (i=0;i<chkRisco;i++) { //------------------------
	  if (frm_Suinos.chkRisco[i].checked) {
		cont++;
		break;
	  }
	}
	if (cont==0) {
	  alert("Informe sobre os Riscos Atribuidos!");
	  frm_Suinos.chkRisco[0].focus();
	  return false;
	}

	aspecto = document.frm_Suinos.aspecto.length;
	cont = 0;
	for (i=0;i<aspecto;i++) { //------------------------
	  if (frm_Suinos.aspecto[i].checked) {
		cont++;
		break;
	  }
	}
	if (cont==0) {
	  alert("Informe sobre os Aspectos Produtivos!");
	  frm_Suinos.aspecto[0].focus();
	  return false;
	}

	AcessoMercado = document.frm_Suinos.AcessoMercado.length;
	cont = 0;
	for (i=0;i<AcessoMercado;i++) { //------------------------
	  if (frm_Suinos.AcessoMercado[i].checked) {
		cont++;
		break;
	  }
	}
	if (cont==0) {
	  alert("Selecione o tipo de Acesso ao Mercado!");
	  frm_Suinos.AcessoMercado[0].focus();
	  return false;
	}

	animais_vivos = document.frm_Suinos.animais_vivos.length;
	cont = 0;
	for (i=0;i<animais_vivos;i++) { //------------------------
	  if (frm_Suinos.animais_vivos[i].checked) {
		cont++;
		break;
	  }
	}
	if (cont==0) {
	  alert("Selecione o tipo de Comercio de Animais vivo!");
	  frm_Suinos.animais_vivos[0].focus();
	  return false;
	}

	abate = document.frm_Suinos.abate.length;
	cont = 0;
	for (i=0;i<abate;i++) { //------------------------
	  if (frm_Suinos.abate[i].checked) {
		cont++;
		break;
	  }
	}
	if (cont==0) {
	  alert("Selecione o tipo de abate!");
	  frm_Suinos.abate[0].focus();
	  return false;
	}

	vacinacao_regular = document.frm_Suinos.vacinacao_regular.length;
	cont = 0;
	for (i=0;i<vacinacao_regular;i++) { //------------------------
	  if (frm_Suinos.vacinacao_regular[i].checked) {
		cont++;
		break;
	  }
	}
	if (cont==0) {
	  alert("Selecione o tipo de vacina\u00e7\u00e3o regular!");
	  frm_Suinos.vacinacao_regular[0].focus();
	  return false;
	}

	vermifugacao = document.frm_Suinos.vermifugacao.length;
	cont = 0;
	for (i=0;i<vermifugacao;i++) { //------------------------
	  if (frm_Suinos.vermifugacao[i].checked) {
		cont++;
		break;
	  }
	}
	if (cont==0) {
	  alert("Selecione o tipo de vermifuga\u00e7\u00e3o!");
	  frm_Suinos.vermifugacao[0].focus();
	  return false;
	}

	instalacoes = document.frm_Suinos.instalacoes.length;
	cont = 0;
	for (i=0;i<instalacoes;i++) { //------------------------
	  if (frm_Suinos.instalacoes[i].checked) {
		cont++;
		break;
	  }
	}
	if (cont==0) {
	  alert("Selecione o tipo de instala\u00e7oes!");
	  frm_Suinos.instalacoes[0].focus();
	  return false;
	}

    if (document.frm_Suinos.resp_tecnico.value  == "")
	{
		alert("Informe o responsavel tecnico!");
	   document.frm_Suinos.resp_tecnico.focus();
	    return false;
	}


//-------------------------------------------------------

//-------------------------------------------------------

    if (document.frm_Suinos.outras_especies[0].checked){
		verificador = 0;
		if(!document.frm_Suinos.ruminantes.checked){
			if(!document.frm_Suinos.aves.checked){
				if(!document.frm_Suinos.equinos.checked){
					if(!document.frm_Suinos.peixes.checked){
						  verificador = 1;
					}
				}
			}
		}
		if(verificador != 0){
			alert ("Informe Quais Especies de Animais existem!");  
			frm_Suinos.ruminantes.focus();
			return false;
		}
	}
}

function fluxo(flag, campo){
	if(flag == 1){
		document.getElementById(campo).readOnly = false;
		document.getElementById(campo).focus();
	}
	else{
		document.getElementById(campo).readOnly = true;
		document.getElementById(campo).value = "";
	}
}

/*Funï¿½ï¿½o que executa as Mascaras*/
function mascara(o,f){
    v_obj=o
    v_fun=f
    setTimeout("execmascara()",1)
}
 /*Funï¿½ï¿½o que Executa os objetos*/
function execmascara(){
    v_obj.value=v_fun(v_obj.value)
}
 /*Funï¿½ï¿½o que permite apenas numeros*/
function numeros(v){
    return v.replace(/\D/g,"")
}
    
function valor(par)
{	
  if (isNaN(parseInt(par.value,10)))
     {           	       
     par.value=0;
	 }	 
   else
     {
     par.value=parseInt(par.value,10);     
     }	 
 } 

function somente_letras(campo){
var digits="abcdefghijklmnopqrstuvwyxzABCDEFGHIJKLMNOPQRSTUVWXYZ"
var campo_temp
for (var i=0;i<campo.value.length;i++){
campo_temp=campo.value.substring(i,i+1)
if (digits.indexOf(campo_temp)==-1){
campo.value = campo.value.substring(0,i);
break;
}
}
}

function Verificar_vermifugacao_frequencia()
{

	if(document.frm_Suinos.vermifugacao[0].checked)
	{
	vermifugacao = document.frm_Suinos.vermifugacao_frequencia.length;
	
	
	cont = 0;
	for (i=0;i<vermifugacao;i++) 
	{ 
	  frm_Suinos.vermifugacao_frequencia[i].checked = false
	  cont++;
	}
	}
}

function Total()
{
  calc_total_Suino_Macho();
  calc_total_Suino_Femea();
}

function ficha_mov(form)
{
	form.action = "SessionFichaMovimentacao.asp"
	form.submit();
}



</script>
</head>
<body>


    <div align="center">
            <br /><br />
			<form method="post" name="frm_Suinos" onSubmit="return(validacao())"> 
			<input type="hidden" name="Operacao" id="Operacao" value="1"> 
            <table width="700" border="0" align="center" class="tabela_peixe">
                <tr class="tabela_titulo">
                    <td colspan="4"><strong>Cadastro de Propriedade Estabelicimento de Cria&ccedil;&atilde;o de Su&iacute;deos</strong></td>
                </tr>
                <tr>
			<td width="25%">&nbsp;</td>
            <td width="25%">&nbsp;</td>
            <td width="25%">&nbsp;</td>
            <td width="25%">&nbsp;</td>
		</tr>  
		        
                    <tr>
                    	<td colspan="4" align="center" class="tabela_rotulo"><strong>&nbsp; Dados do Propriet&aacute;rio</strong></td>
                    </tr>
                    <tr>
					
                        <td colspan="2">1 - Nome: <b>ABSALAO RODRIGUES DE ALMEIDA</b></td>
                        <td colspan="2">Data do Cadastro(Recadastro): 03/06/2009 14:41:37</td>
					</tr>
                     <tr>
                        <td colspan="2">2 - Apelido(Nome Fantasia): <b></b></td>
                        <td colspan="1">CPF/CNPJ: <b>26441233134</b></td>
                        <td colspan="0">RG: 1337721</td>
					</tr>
                    <tr>
                        <td colspan="2">3 - Endere&ccedil;o: FAZ. TUCUM</td>
                        <td colspan="2">Munic&iacute;pio: Abreulândia</td>
					</tr>
                    <tr>
                        <td colspan="1">4 - CEP: 77.693-000     </td>
                        <td colspan="1">Telefone Fixo:                     </td>
                        <td colspan="1">Celular: (00) 00000-0000     </td>
						<td colspan="1"></td>
					</tr>
					
                    <tr><td colspan="4">&nbsp;</td></tr>
                    <tr>
                    	<td colspan="4" align="center" class="tabela_rotulo"><strong>&nbsp; Dados da Propriedade</strong></td>
                    </tr>
					

                    <tr>
                    	<td colspan="3">1 - Nome da Empresa/Raz&atilde;o Social: <b>FAZ. TUCUM</b></td>
                        <td colspan="2">N&deg;. do Cadastro: 
                        <input name="NumeroCadastro" class="text" id="NumeroCadastro" size="7" maxlength="9" value="" onKeyPress="mascara(this,numeros)"></td>
                    </tr>
                    <tr>
                    	<td colspan="2">2 - CNPJ: 26441233134   </td>
                        <td colspan="2"> Inscr. Estadual: 293640602     </td>
                    </tr>
                    <tr>
                    	<td colspan="2">3 - Endere&ccedil;o: FAZ. SAO PEDRO</td>
                        <td colspan="2"> Munic&iacute;pio: Abreulândia</td>
					</tr>
					
                    <tr>
                    	<td colspan="2" >4 - &Aacute;rea da Propriedade: 
                        <input name="AreaProp" class="text" id="AreaProp" size="7" maxlength="9" value="" onKeyPress="mascara(this,numeros)">(ha.)</td>
                        <td colspan="2">&Aacute;rea Constru&iacute;da/Area utilizada com Suinocultura: 
                        <input name="AreaConstruida" class="text" id="AreaConstruida" size="7" maxlength="9" value="" onKeyPress="mascara(this,numeros)">(m<sup>2</sup>)</td>
                    </tr>
                    <tr>
                    	<td colspan="2">5 - N&deg;. de Galp&otilde;es/Piquetes: 
               	      <input name="Galpoes" class="text" id="Galpoes" size="7" maxlength="9" value="" onKeyPress="mascara(this,numeros)"></td>
                        <td colspan="2"> Capacidade de Alojamento de Su&iacute;nos: 
                        <input name="CapacidadeAlojamento" class="text" id="CapacidadeAlojamento" size="7" maxlength="9" value="" onKeyPress="mascara(this,numeros)"></td>
					</tr>
					<tr>
                    	<td>6 - Coordenadas Pocilga/Galp&otilde;es (SIRGAS 2000) <br>(Grau, minutos e segundos)</td> <br> 	
                    	<br> 
                        <td width="33%">Lat(S)
                        <input type="text" size="2" maxlength="2" name="edLatG" onChange="grau_minuto(this);" value="" class="text">
                            &deg;
                        <input type="text" size="2" maxlength="2" name="edLatM" onChange="grau_minuto(this);" value="" class="text">
                            '
                        <input type="text" size="4" maxlength="4" name="edLatS" onChange="segundo(this);" value="."  class="text">
                        ''</td> &nbsp;&nbsp;&nbsp;

                        <td colspan="2">Lon(W)
                        <input type="text" size="2" maxlength="2" name="edLongG" onChange="grau_minuto(this);" value=""  class="text">
			                &deg;
			            <input type="text" size="2" maxlength="2" name="edLongM" onChange="grau_minuto(this);"  value=""  class="text">
		                	'
		                <input type="text" size="4" maxlength="4" name="edLongS" onChange="segundo(this);"  value="." class="text">
		                	''		             
                        </td>

                    </tr>
                    <tr>
                    	<td colspan="2">7 - Dist&acirc;ncia da Via Mais Pr&oacute;xima com Tr&acirc;nsito de Su&iacute;nos:
               	      <input name="DistanciaProx" class="text" id="DistanciaProx" size="7" maxlength="9" value="" onKeyPress="mascara(this,numeros)"></td>
                        <td colspan="2"> Dist&acirc;ncia do Estab. com Su&iacute;nos mais Pr&oacute;ximos: 
                        <input name="DistanciaEstab" class="text" id="DistanciaEstab" size="7" maxlength="9" value="" onKeyPress="mascara(this,numeros)"></td>
					
					</tr>
                    	<td colspan="4">
                            8 - Popula&ccedil;&atilde;o: <BR>
                            
                        	<INPUT id="tecnificacao"  name="tecnificacao"  type="radio" onClick="tecnificada();" value="SIM"><strong>Tecnificada:</strong>
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="1" >Ciclo Completo 
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="2" >Unidade Produtora de Leitoes(UPL)
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="3" >Creche 
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="4" >Termina&ccedil;&atilde;o
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="5" >Granja de Reprodutores Su&iacute;nos certificada(GRSC)   <br>
                            <INPUT id="tecnificacao"  name="tecnificacao"  type="radio" onClick="tecnificada();" value="NAO" ><strong>N&atilde;o Tecnificada:</strong>
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="6" >Com&eacute;rcio Local 
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="7" >Subsist&ecirc;ncia     <br>
                            <INPUT id="criacaoComercial" name="criacaoComercial" type="checkbox" value="SIM" ><strong>Cria&ccedil;&atilde;o Comercial de Cateto/Queixada</strong> <br>
                            <INPUT id="presencaSuinos" name="presencaSuinos" type="checkbox" value="SIM" ><strong>Presen&ccedil;a de Su&iacute;nos Asselvajados</strong>
						</td>
                    </tr>
                </tr>
              <td colspan="4">
              <div id="divTecnificada" value="1">
                9 - N&deg;. de Animais Existentes(<b>Tecnificadas</b>): <br>
                    <tr>
                      <th>0 - 2 Meses</th>
                      <th>3 - 4 Meses</th>
                      <th>5 - 6 Meses</th>
                      <th>Total</th>
                    </tr>
                
                      <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;
                        M<input type="text" name="edQtde02MachoSuideo" size="4"  value="<%'if not rs.eof then Response.Write rs("QtdeMachos02") %>"  onblur="calc_total_Suino_Macho()" onChange="valor(edQtde02MachoSuideo)" class="text" readonly>
                            F<input type="text" name="edQtde02FemeaSuideo" size="4" value="<%'if not rs.eof then Response.Write rs("QtdeFemeas02")%>"  onblur="calc_total_Suino_Femea()" onChange="valor(edQtde02FemeaSuideo)" class="text" readonly>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        M<input type="text" name="edQtde34MachoSuideo" size="4" value="<%'if not rs.eof then Response.Write rs("QtdeMachos34")%>"  onBlur="calc_total_Suino_Macho()"  onChange="valor(edQtde34MachoSuideo)" class="text" readonly>
                            F<input type="text" name="edQtde34FemeaSuideo" size="4" value="<%'if not rs.eof then Response.Write rs("QtdeFemeas34")%>" onBlur="calc_total_Suino_Femea()" onChange="valor(edQtde34FemeaSuideo)" class="text" readonly>
                        <td>M<input type="text" name="edQtde56MachoSuideo" size="4" value="<%'if not rs.eof then Response.Write rs("QtdeMachos56")%>" onBlur="calc_total_Suino_Macho()" onChange="valor(edQtde56MachoSuideo)" class="text" readonly>
                            F<input type="text" name="edQtde56FemeaSuideo" size="4" value="<%'if not rs.eof then Response.Write rs("QtdeFemeas56")%>" onBlur="calc_total_Suino_Femea()" onChange="valor(edQtde56FemeaSuideo)" class="text" readonly>
                        <td>M<input type="text" name="TotalMachoSuideo" size="3" style="color:red;" value="<%'=totalM%>"   readonly class="text">
                            F<input type="text" name="TotalFemeaSuideo" size="3" style="color:red;" value="<%'=totalF%>"   readonly class="text">
                      </tr>
                      <tr>
                        <td><b>Cacha&ccedil;os : </b></td>
                        <td><input type="text" name="TotalCachacos" size="5" value="<%'if not rs.eof then Response.Write rs("QtdeCachacosSuino")%>" onBlur="calc_total_Suino_Macho()" onChange="valor(TotalCachacos)" class="text" readonly></td>
                        <td><b>Matrizes:</b></td>
                        <td><input type="text" name="TotalMatrizes" size="5" value="<%'if not rs.eof then Response.Write rs("QtdeMatrizesSuino")%>" onBlur="calc_total_Suino_Femea()" onChange="valor(TotalMatrizes)" class="text" readonly></td>
                      </tr>
               </div> 
              </td>
      <td colspan="4">
				<div id="divNaoTecnificada" value="1">
                9 - N&deg;. de Animais Existentes(<b>Tecnificadas</b>): <br>
				    <tr>
						<th>Leitoes < 6 Meses:</th>
						<th>Cachacos</th>
						<th>Matrizes</th>
						<th></th>
                    </tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						M<input type="text" name="edQtde02MachoSuideo" size="5" value="<%'=totalM6%>"  onblur="calc_total_Suino_Macho()" onChange="valor(edQtde02MachoSuideo)" class="text" readonly>
	  					F<input type="text" name="edQtde02FemeaSuideo" size="5" value="<%'=totalF6%>"  onblur="calc_total_Suino_Femea()" onChange="valor(edQtde02FemeaSuideo)" class="text" readonly>
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="edQtde02FemeaSuideo" size="5" value="<%'if not rs.eof then Response.Write rs("QtdeCachacosSuino")%>"  onblur="calc_total_Suino_Macho()" onChange="valor(TotalCachacos)" class="text" readonly>
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="edQtde02FemeaSuideo" size="5" value="<%'if not rs.eof then Response.Write rs("QtdeMatrizesSuino")%>"  onblur="calc_total_Suino_Femea()" onChange="valor(TotalMatrizes)" class="text" readonly>
						</td>
						<td></td>
					</tr>
					<input type="hidden" id="Totalsuinos" name="TotalSuinos" size="10" value=0>
				</div>					
			  </td>   
					<script>
					    tecnificada();
						function tecnificada() {

						//alert(document.frm_Suinos.tecnificacao[0].checked)
						if(document.frm_Suinos.tecnificacao[0].checked){
						document.getElementById('tecnificada').style.display='block';
						}else{
						document.getElementById('tecnificada').style.display='none';
						}
						if(document.frm_Suinos.tecnificacao[1].checked){
						document.getElementById('naoTecnificada').style.display='block';
						}else{
						document.getElementById('naoTecnificada').style.display='none';
						}
						}
					</script>

                        <td colspan="4">
                            10 - Risco Atribu&iacute;do ao Estabelecimento de Cria&ccedil;&atilde;o: <br> <br>
                
                    <div class="risco_item">
                    <input type="checkbox" name="chkRisco1" id="chkRisco"  value="1" />Próximo a frigorífico-abatedouro ou graxaria; <br />
                    </div>
                
                    <div class="risco_item">
                    <input type="checkbox" name="chkRisco2" id="chkRisco"  value="2" />Contíguos a depósitos de resíduos sólidos urbanos ou com risco de fornecimento de resíduos alimentares(lavagem aos suínos); <br />
                    </div>
                
                    <div class="risco_item">
                    <input type="checkbox" name="chkRisco3" id="chkRisco"  value="3" />Próximo à quarentenário de suínos; <br />
                    </div>
                
                    <div class="risco_item">
                    <input type="checkbox" name="chkRisco4" id="chkRisco"  value="4" />Com Baixos níveis de biossegurança na produção; <br />
                    </div>
                
                    <div class="risco_item">
                    <input type="checkbox" name="chkRisco5" id="chkRisco"  value="5" />localizado próximo a fronteiras internacionais ou divisas com estados, Países ou zonas não livres PSC, PSA e PRRS; <br />
                    </div>
                
                    <div class="risco_item">
                    <input type="checkbox" name="chkRisco6" id="chkRisco"  value="6" />Com fluxos intenso de suínos(hubs), principalmente com alto ingresso de diferentes origens; <br />
                    </div>
                
                    <div class="risco_item">
                    <input type="checkbox" name="chkRisco7" id="chkRisco"  value="7" />Próximo a vias com muito trânsito de suínos; <br />
                    </div>
                
                    <div class="risco_item">
                    <input type="checkbox" name="chkRisco8" id="chkRisco"  value="8" />Próximos a locais de ingresso internacional de pessoas e produtores como aeroportos, portos, ferrovias, rodoviárias e postos de fronteira internacional; <br />
                    </div>
                
                    <div class="risco_item">
                    <input type="checkbox" name="chkRisco9" id="chkRisco"  value="9" />Mantém o vínculo com diferentes estabelecimentos, especialmente em outros países ou zona não livre de PSC, PSA e PRRS; <br />
                    </div>
                
                    <div class="risco_item">
                    <input type="checkbox" name="chkRisco10" id="chkRisco"  value="10" />Localizado em áreas com alta densidade; <br />
                    </div>
                
                    <div class="risco_item">
                    <input type="checkbox" name="chkRisco11" id="chkRisco"  value="11" />Próximo a reserva naturais, áreas de proteção ambiental, parques nacionais ou locais com a presença de suínos asselvajados; <br />
                    </div>
                
                    <div class="risco_item">
                    <input type="checkbox" name="chkRisco12" id="chkRisco"  value="12" />não foi identificado critério de risco; <br />
                    </div>
                
                    <div class="risco_item">
                    <input type="checkbox" name="chkRisco13" id="chkRisco"  value="13" />- Estabelecimento com suínos contínuos ou próximos a quarentenário de suínos; <br />
                    </div>
                
                    <div class="risco_item">
                    <input type="checkbox" name="chkRisco14" id="chkRisco"  value="14" />- Estabelecimentos com fluxo intenso de suínos (hubs), principalmente com alto ingresso de diferentes origens; <br />
                    </div>
                
                    <div class="risco_item">
                    <input type="checkbox" name="chkRisco15" id="chkRisco"  value="15" />- Não foi identificado critério de risco. <br />
                    </div>
                
               
                        </td>
                    <tr>
                    <td colspan="4">

                        11 - Aspectos Produtivos e Sanit&aacute;rios da Cria&ccedil;&atilde;o (Infraestrutura de Su&iacute;nos): <br> <br>
                        <strong><u>Biosseguridade</u></strong> <br><br>

                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto1" type="checkbox" value="1"  >Inexistência de isolamento 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto2" type="checkbox" value="2"  >Embarcador no perímetro cerca 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto3" type="checkbox" value="3"  >Cerca telada 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto4" type="checkbox" value="5"  >Registo da entrada de Veículos 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto5" type="checkbox" value="6"  >Cinturão verde  
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto6" type="checkbox" value="7"  >Barreira Sanitária 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto7" type="checkbox" value="8"  >Vestiário - banho/troca de roupa 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto8" type="checkbox" value="9"  >Livro visitas 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto9" type="checkbox" value="10"  >Entrada única 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto10" type="checkbox" value="11"  >Arco desinfecção 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto11" type="checkbox" value="12"  >Rodolúvio 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto12" type="checkbox" value="13"  >Fumigador 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto13" type="checkbox" value="14"  >Silo Interno/carregamento externo  
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto14" type="checkbox" value="15"  >Tela anti-pássaro 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto15" type="checkbox" value="16"  >Baia hospital 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto16" type="checkbox" value="17"  >Quarentenário 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto17" type="checkbox" value="18"  >Contato com suínos asselvajados 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto18" type="checkbox" value="19"  >Contato com suínos de outro estabelecimento 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto19" type="checkbox" value="20"  >Criação confinada 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto20" type="checkbox" value="21"  >Criação semi-confinada 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto21" type="checkbox" value="22"  >Criação ao ar livre 
                    </div>
                

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto22" type="checkbox" value="23"  >Acesso a depósito de resíduos sólidos urbanos 
                    </div>
                

                <div class="alimentacao">
                    <strong><u>Alimentacao e Agua</u></strong> <br><br>
                
                <div class="alimentacao_item">
                    <INPUT id="aspecto" name="aspecto24" type="checkbox" value="24" >Ração de fabricação própria
                </div>
                
                <div class="alimentacao_item">
                    <INPUT id="aspecto" name="aspecto25" type="checkbox" value="25" >Ração Comercial
                </div>
                
                <div class="alimentacao_item">
                    <INPUT id="aspecto" name="aspecto26" type="checkbox" value="26" >Ração Fornecida pela integradora
                </div>
                
                <div class="alimentacao_item">
                    <INPUT id="aspecto" name="aspecto27" type="checkbox" value="28" >Farinhas de origem animal
                </div>
                
                <div class="alimentacao_item">
                    <INPUT id="aspecto" name="aspecto28" type="checkbox" value="29" >Uso de resto de abatedouro e/ou açougue
                </div>
                
                <div class="alimentacao_item">
                    <INPUT id="aspecto" name="aspecto29" type="checkbox" value="30" >Uso de resto de agroindustria(laticinio, etc)
                </div>
                
                <div class="alimentacao_item">
                    <INPUT id="aspecto" name="aspecto30" type="checkbox" value="31" >Uso de resto de Comida(Residencial, Restaurante, etc)
                </div>
                
                <div class="alimentacao_item">
                    <INPUT id="aspecto" name="aspecto31" type="checkbox" value="32" >Poço artesiano
                </div>
                
                <div class="alimentacao_item">
                    <INPUT id="aspecto" name="aspecto32" type="checkbox" value="33" >Rede publica de abastecimento
                </div>
                
                <div class="alimentacao_item">
                    <INPUT id="aspecto" name="aspecto33" type="checkbox" value="34" >Água superficial(rio, lago ou açude)
                </div>
                
                <div class="alimentacao_item">
                    <INPUT id="aspecto" name="aspecto34" type="checkbox" value="35" >Vertente/Fonte de água protegida
                </div>
                
                </div>

                <div class="destino_suinos">
                <strong><u>Destino Suinos Mortos</u></strong> <br><br>
                
                    <div class="destino_suinos_item">
                    <INPUT id="aspecto" name="aspecto35" type="checkbox" value="36" >Enterra
                    </div>
                
                    <div class="destino_suinos_item">
                    <INPUT id="aspecto" name="aspecto36" type="checkbox" value="37" >Cremação
                    </div>
                
                    <div class="destino_suinos_item">
                    <INPUT id="aspecto" name="aspecto37" type="checkbox" value="38" >Fossa asséptica
                    </div>
                
                    <div class="destino_suinos_item">
                    <INPUT id="aspecto" name="aspecto38" type="checkbox" value="39" >Composteira
                    </div>
                
                </div>

                <div class="destino_dejetos">
                <strong><u>Destino dos Dejetos</u></strong> <br><br>
                
                    <div class="destino_dejetos_item">
                    <INPUT id="aspecto" name="aspecto39" type="checkbox" value="40" >Lagoa decantação
                    </div>
                
                    <div class="destino_dejetos_item">
                    <INPUT id="aspecto" name="aspecto40" type="checkbox" value="41" >Lagoa decatação c/ biodigestor
                    </div>
                
                    <div class="destino_dejetos_item">
                    <INPUT id="aspecto" name="aspecto41" type="checkbox" value="42" >Esterqueira revestida
                    </div>
                
                    <div class="destino_dejetos_item">
                    <INPUT id="aspecto" name="aspecto42" type="checkbox" value="43" >Fossa
                    </div>
                
                    <div class="destino_dejetos_item">
                    <INPUT id="aspecto" name="aspecto43" type="checkbox" value="44" >Sem tratamento
                    </div>
                
                </div>
                    </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            12 - Acesso ao Mercado: <br> <br>
                            <INPUT id="AcessoMercado" name="AcessoMercado" type="radio" onClick="fluxo(0, 'alimentacao_esp')" value="1" >Independente &nbsp;&nbsp;&nbsp;
                            <INPUT id="AcessoMercado" name="AcessoMercado" type="radio" onClick="fluxo(0,'alimentacao_esp')" value="2" >Integrado / Nome da Integra&ccedil;&atilde;o/Cooperativa:
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            13 - Com&eacute;rcio de Animais Vivos: <br> <br>
                            <INPUT id="animais_vivos" name="animais_vivos" type="radio" value="1" >Interestadual &nbsp;&nbsp;&nbsp;
                            <INPUT id="animais_vivos" name="animais_vivos" type="radio" value="2" >Intermunicipal &nbsp;&nbsp;&nbsp;
                            <INPUT id="animais_vivos" name="animais_vivos" type="radio" value="3" >Intramunicipal
                        </td>
					</tr>
                    <tr>
                        <td colspan="4">
                            14 - Tipo de Abate: <br>
                        <b>Com Inspe&ccedil;&atilde;o:</b> &nbsp; &nbsp;
                            <INPUT id="abate" name="abate" type="radio" value="1" >Municipal
                            <INPUT id="abate" name="abate" type="radio" value="2" >Estadual
                            <INPUT id="abate" name="abate" type="radio" value="3" >Federal
							<INPUT id="abate" name="abate" type="radio" value="4" >SISBI/POA
							<br /> <br>
                            <INPUT id="abate" name="abate" type="radio" value="4" >Na Propriedade &nbsp;
                            <INPUT id="abate" name="abate" type="radio" value="5" >N&atilde;o Abate &nbsp;
                            <INPUT id="abate" name="abate" type="radio" value="6" >Outros 
                        </td>
					</tr>
                    <tr>
                        <td colspan="4">
                            15 - Vacina&ccedil;&atilde;o Regular: <br>
                        	<INPUT id="vacinacao_regular" name="vacinacao_regular" type="radio" onClick="fluxo(0,'vacinacao_regular_esp')" value="0"  checked >N&atilde;o
                            <INPUT id="vacinacao_regular" name="vacinacao_regular" type="radio" onClick="fluxo(1,'vacinacao_regular_esp')" value="1" >Sim 
                            - Quais: <input name="vacinacao_regular_esp" class="text" id="vacinacao_regular_esp" size="78" maxlength="255" value="" onKeyPress="this.value = this.value.toUpperCase()" onChange="this.value = this.value.toUpperCase()" >
                        </td>
					</tr>
                    <tr>
                        <td colspan="4">
                            16 - Vermifuga&ccedil;&atilde;o Regular: <br>
                        	<INPUT id="vermifugacao" name="vermifugacao" type="radio" value="0" onClick="Verificar_vermifugacao_frequencia()"  checked >N&atilde;o 
                            <INPUT id="vermifugacao" name="vermifugacao" type="radio" value="1" onClick="Verificar_vermifugacao_frequencia()" >Sim 
                            - Frequ&ecirc;ncia: 
                            <INPUT id="vermifugacao_frequencia" name="vermifugacao_frequencia" type="radio" value="1" onClick="Verificar_vermifugacao_frequencia()"  >01 por Ano 
                            <INPUT id="vermifugacao_frequencia" name="vermifugacao_frequencia" type="radio" value="2" onClick="Verificar_vermifugacao_frequencia()"  >02 por Ano 
                            <INPUT id="vermifugacao_frequencia" name="vermifugacao_frequencia" type="radio" value="3" onClick="Verificar_vermifugacao_frequencia()"  >03 por Ano 
                            <INPUT id="vermifugacao_frequencia" name="vermifugacao_frequencia" type="radio" value="4" onClick="Verificar_vermifugacao_frequencia()"  >04 por Ano 
                        </td>
					</tr>

                    <tr>
                        <td colspan="4">
                            17 - Tipo de Instala&ccedil;&otilde;es: <br>
                            <INPUT id="instalacoes" name="instalacoes" type="radio" value="1" >Alvenaria
                            <INPUT id="instalacoes" name="instalacoes" type="radio" value="2" >Madeira
                            <INPUT id="instalacoes" name="instalacoes" type="radio" value="3" >Metalica
                            <INPUT id="instalacoes" name="instalacoes" type="radio" value="5" >Mista
                        </td>
					</tr>
                
                    <tr>
                        <td colspan="4">
                             18 - Respons&aacute;vel T&eacute;cnico: 
                               <input name="resp_tecnico" class="text" id="resp_tecnico" size="75" maxlength="255" value=""  onKeyPress="this.value = this.value.toUpperCase()" onChange="this.value = this.value.toUpperCase()"  > <br>
                        </td>
                    </tr>
                        <td colspan="4">
                             19 - Respons&aacute;vel Pelas Informa&ccedil;&otilde;es: 
                               <input name="resp_info" class="text" id="resp_info" size="67" maxlength="255" value=""  onKeyPress="this.value = this.value.toUpperCase()" onChange="this.value = this.value.toUpperCase()"  > <br>
                        </td>
                    </tr>
                  
                    <tr>
                    	<td colspan="4"><strong>Respons&aacute;vel pelo cadastro</strong></td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            Nome:   <b>ROBERTO TESTE</b>	
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            Cargo:  <b>VETERINARIO ESTADUAL          </b>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            UVL:    <b>UNIDADE CENTRAL DA ADAPEC(SEDE)</b>
                        </td>
                    </tr>
					<tr>
                        <td colspan="4">
                            Data: <b>21/12/2022</b>
                        </td>
                    </tr>
					
					<tr align="center">
                        <td colspan="4">
                            <input id="bt_cadastrar" name="bt_cadastrar" type="submit" value="Cadastrar" onClick="cadastrar();" class="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="login1.asp"><input id="bt_Fechar" name="bt_Fechar" type="button" value="  Fechar  " class="button" onClick="javaScript:window.close();"></a>
						<input type="button" value="Registrar alteracao" name="bt_fichamov" onClick="ficha_mov(this.form)" class="button">
                        </td>
                	</tr>
				</table>
            



            <br />

</div>
    </form>
<center>

<table width="700" height="23" border="0" align="center" cellpadding="0" cellspacing="0" background="../../cabecalho/rodape.png">
  <tr> 
    <td width="1%" height="23">
      <p align="left" class="rodape">&nbsp;</p>
    </td>
    <td width="38%"><span class="rodape">Todos os Direitos Reservados &copy;2008 / 2020 ADAPEC</span></td>
    <td width="60%" align="right"><span class="rodape"> 
      TI - Tecnologia da Informa&ccedil;&atilde;o - cti@adapec.to.gov.br / (63) 3218-2168
      /3218-2181&nbsp;</span>
    </td>
    <td width="1%">&nbsp;</td>
  </tr>
</table>
</center>
</body>
</html>