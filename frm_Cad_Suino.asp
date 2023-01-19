<!--#include file ="lib/Conexao.asp"-->
<html>
<head>

    <link rel="stylesheet" href="estilo.css">
    <title>Cadastro de Su&iacute;deos</title>
	
</head>
<script>
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
			alert("A Latitude deve estar entre 5°S e 14°S!")
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
			alert("A Longitude deve estar entre 45°W e 51°W!")
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

	aspecto1 = document.frm_Suinos.aspecto1.length;
	cont = 0;
	for (i=0;i<aspecto1;i++) { //------------------------
	  if (frm_Suinos.aspecto1[i].checked) {
		cont++;
		break;
	  }
	}
	if (cont==0) {
	  alert("Informe sobre os Aspectos Produtivos!");
	  frm_Suinos.aspecto1[0].focus();
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
	
	if(parseInt(document.frm_Suinos.qtd_matrizes.value)+parseInt(document.frm_Suinos.qtd_cachacos.value)+parseInt(document.frm_Suinos.qtd_matern.value)+parseInt(document.frm_Suinos.qtd_creche.value)+parseInt(document.frm_Suinos.qtd_term.value)==0)
	{
		alert("Informe a Estratifica\u00e7\u00e3o dos Animais")
		document.frm_Suinos.qtd_matrizes.focus();
		return false;
	}
	
	if(parseInt(document.frm_Suinos.qtd_matrizes.value)+parseInt(document.frm_Suinos.qtd_cachacos.value)+parseInt(document.frm_Suinos.qtd_matern.value)+parseInt(document.frm_Suinos.qtd_creche.value)+parseInt(document.frm_Suinos.qtd_term.value)!= 0 <%'=request("TotalSuideos")%>)
	{
		alert("Numero de Suideos na propriedade esta diferente da rela\u00e7\u00e3o informada no relatorio de Propriedade Comercial!");
		return false;
	}
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

/*Fun��o que executa as Mascaras*/
function mascara(o,f){
    v_obj=o
    v_fun=f
    setTimeout("execmascara()",1)
}
 /*Fun��o que Executa os objetos*/
function execmascara(){
    v_obj.value=v_fun(v_obj.value)
}
 /*Fun��o que permite apenas numeros*/
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

function VerificarOutrasEspecie()
{

	if (document.frm_Suinos.outras_especies[1].checked)
	{
		document.frm_Suinos.ruminantes.checked = false;
		document.frm_Suinos.aves.checked = false;
		document.frm_Suinos.equinos.checked = false;
		document.frm_Suinos.peixes.checked = false;
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



</script>
<body>
    <div align="center">
            <br /><br />
			<form method="post" name="frm_Suinos" onSubmit="return(validacao())">   
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
                        <td colspan="2">1 - Nome: <b><%'=rs("NomeProdutor")%></b></td>
                        <td colspan="2">Data do Cadastro(Recadastro): <%'if isnull(rs("DataCadastro")) then response.write Date() else response.write rs("DataCadastro") end if%></td>
					</tr>
                     <tr>
                        <td colspan="2">2 - Apelido(Nome Fantasia): <b><%'=rs("Apelido")%></b></td>
                        <td colspan="1">CPF/CNPJ: <b><%'=Session("CNPJ")%></b></td>
                        <td colspan="0">RG: </td>
					</tr>
                    <tr>
                        <td colspan="2">3 - Endere&ccedil;o: <%'=rs("EndProdutor")%></td>
                        <td colspan="2">Munic&iacute;pio: <%'=rs("NomeMunicipioProdutor")%></td>
					</tr>
                    <tr>
                        <td colspan="1">4 - CEP: <%'=rs("CEPProdutor")%></td>
                        <td colspan="1">4 - CEP: <%'=rs("CEPProdutor")%></td>
                        <td colspan="1">Telefone Fixo: <%'=rs("FoneProdutor")%></td>
                        <td colspan="1">Celular: <%'=rs("CelularProdutor")%></td>
					</tr>
                    <tr><td colspan="4">&nbsp;</td></tr>
                    <tr>
                    	<td colspan="4" align="center" class="tabela_rotulo"><strong>&nbsp; Dados da Propriedade</strong></td>
                    </tr>
                    <tr>
                    	<td colspan="3">1 - Nome da Empresa/Raz&atilde;o Social: <b><%'=rs("NomeProp")%></b></td>
                        <td colspan="2">N&deg;. do Cadastro: 
                        <input name="NumeroCadastro" class="text" id="NumeroCadastro" size="7" maxlength="9" value="<%'=rs("NumeroCadastro")%>" onKeyPress="mascara(this,numeros)"></td>
                    </tr>
                    <tr>
                    	<td colspan="2">2 - CNPJ: </td>
                        <td colspan="2"> Inscr. Estadual: <%'=rs("InscricaoEstadual")%></td>
                    </tr>
                    <tr>
                    	<td colspan="2">3 - Endere&ccedil;o: <%'=rs("EndProp")%></td>
                        <td colspan="2"> Munic&iacute;pio: <%'=rs("NomeMunicipioProp")%></td>
					</tr>
                    <tr>
                    	<td colspan="2" >4 - &Aacute;rea da Propriedade: 
                        <input name="AreaProp" class="text" id="AreaProp" size="7" maxlength="9" value="<%'=rs("AreaProp")%>" onKeyPress="mascara(this,numeros)">(ha.)</td>
                        <td colspan="2">&Aacute;rea Constru&iacute;da/Area utilizada com Suinocultura: 
                        <input name="AreaConstruida" class="text" id="AreaConstruida" size="7" maxlength="9" value="<%'=rs("AreaConstruida")%>" onKeyPress="mascara(this,numeros)">(m<sup>2</sup>)</td>
                    </tr>
                    <tr>
                    	<td colspan="2">5 - N&deg;. de Galp&otilde;es/Piquetes: 
               	      <input name="Galpoes" class="text" id="Galpoes" size="7" maxlength="9" value="<%'=rs("NumerosGalpoes")%>" onKeyPress="mascara(this,numeros)"></td>
                        <td colspan="2"> Capacidade de Alojamento de Su&iacute;nos: 
                        <input name="CapacidadeAlojamento" class="text" id="CapacidadeAlojamento" size="7" maxlength="9" value="<%'=rs("CapacidadeAlojamento")%>" onKeyPress="mascara(this,numeros)"></td>
					</tr>
					<tr>
                    	<td>6 - Coordenadas Pocilga/Galp&otilde;es (SIRGAS 2000) <br>(Grau, minutos e segundos)</td> <br> 	
                    	<br> 
                        <td width="33%">Lat(S)
                            <input type="text" size="2" maxlength="2" name="edLatG" onChange="grau_minuto(this);" value="<%'=left(rs("LatitudeGalpao"), 2)%>" class="text">
                            &deg;
                            <input type="text" size="2" maxlength="2" name="edLatM" onChange="grau_minuto(this);" value="<%'=mid(rs("LatitudeGalpao"), 3, 2)%>" class="text">
                            '
                            <input type="text" size="4" maxlength="4" name="edLatS" onChange="segundo(this);" value="<%'=mid(rs("LatitudeGalpao"), 5, 2) & "." & right(trim(rs("LatitudeGalpao")), 1)%>"  class="text">
                        ''</td> &nbsp;&nbsp;&nbsp;

                        <td colspan="2">Lon(W)
                            <input type="text" size="2" maxlength="2" name="edLongG" onChange="grau_minuto(this);" value="<%'=left(rs("LongitudeGalpao"), 2)%>"  class="text">
			                &deg;
			                <input type="text" size="2" maxlength="2" name="edLongM" onChange="grau_minuto(this);"  value="<%'=mid(rs("LongitudeGalpao"), 3, 2)%>"  class="text">
		                	'
		                	<input type="text" size="4" maxlength="4" name="edLongS" onChange="segundo(this);"  value="<%'=mid(rs("LongitudeGalpao"), 5, 2) & "." & right(trim(rs("LongitudeGalpao")), 1)%>" class="text">
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
                            
                        	<INPUT id="tecnificacao"  name="tecnificacao"  type="radio" value="1" <%'if rs("Tecnificacao") = 1 then%>  <%'end if%>><strong>Tecnificada:</strong>
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="1" <%'if rs("Tecnificacao") = 1 then%>  <%'end if%>>Ciclo Completo 
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="2" <%'if rs("Tecnificacao") = 1 then%>  <%'end if%>>Unidade Produtora de Leitoes(UPL)
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="3" <%'if rs("Tecnificacao") = 1 then%>  <%'end if%>>Creche 
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="4" <%'if rs("Tecnificacao") = 1 then%>  <%'end if%>>Termina&ccedil;&atilde;o
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="5" <%'if rs("Tecnificacao") = 1 then%>  <%'end if%>>Granja de Reprodutores Su&iacute;nos certificada(GRSC)   <br>
                            <INPUT id="tecnificacao"  name="tecnificacao"  type="radio" value="1" <%'if rs("Tecnificacao") = 2 then%>  <%'end if%>><strong>N&atilde;o Tecnificada:</strong>
                            <INPUT id="tecnificacao2" name="tecnificacao2" type="radio" value="1" <%'if rs("Tecnificacao") = 2 then%>  <%'end if%>>Com&eacute;rcio Local 
                            <INPUT id="tecnificacao2" name="tecnificacao2" type="radio" value="2" <%'if rs("Tecnificacao") = 2 then%>  <%'end if%>>Subsist&ecirc;ncia     <br>
                            <INPUT id="tecnificacao4" name="tecnificacao4" type="radio" value="1" <%'if rs("Tecnificacao") = 3 then%>  <%'end if%>><strong>Cria&ccedil;&atilde;o Comercial de Cateto/Queixada</strong> <br>
                            <INPUT id="tecnificacao5" name="tecnificacao5" type="radio" value="1" <%'if rs("Tecnificacao") = 4 then%>  <%'end if%>><strong>Presen&ccedil;a de Su&iacute;nos Asselvajados</strong>
                            <INPUT id="tecnificacao3" name="tecnificacao3" type="radio" value="1" <%'if rs("Tecnificacao") = 4 then%>  <%'end if%>>SIM
                            <INPUT id="tecnificacao3" name="tecnificacao3" type="radio" value="2" <%'if rs("Tecnificacao") = 4 then%>  <%'end if%>>N&Atilde;O
						</td>
                    </tr>
                </tr>
                    <tr>
                        <td colspan="4">
                            9 - N&deg;. de Animais Existentes(<b>Tecnificadas</b>): <br> <br>
                            Matrizes: <input name="qtd_matrizes" class="text" id="qtd_matrizes" size="7" maxlength="9" value="<%'if isnull(rs("Matrizes")) then response.write 0 else response.write rs("Matrizes") end if%>" onChange="valor(qtd_matrizes)">
                            Cacha&ccedil;os: <input name="qtd_cachacos" class="text" id="qtd_cachacos" size="7" maxlength="9" value="<%'if isnull(rs("Cachacos")) then response.write 0 else response.write rs("Cachacos") end if%>" onChange="valor(qtd_cachacos)">
                            Leit&otilde;es Matern.: <input name="qtd_matern" class="text" id="qtd_matern" size="7" maxlength="9" value="<%'if isnull(rs("LeitoesMaterno")) then response.write 0 else response.write rs("LeitoesMaterno") end if%>" onChange="valor(qtd_matern)">
                            Leit&otilde;es Creche: <input name="qtd_creche" class="text" id="qtd_creche" size="7" maxlength="9" value="<%'if isnull(rs("LeitoesCreche")) then response.write 0 else response.write rs("LeitoesCreche") end if%>" onChange="valor(qtd_creche)"> <br><br>
                            Leit&otilde;es Term.: <input name="qtd_term" class="text" id="qtd_term" size="7" maxlength="9" value="<%' if isnull(rs("LeitoesCreche")) then response.write 0 else response.write rs("LeitoesTerm") end if%>" onChange="valor(qtd_term)">
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4">
                            N&deg;. de Animais Existentes(<b>N&atilde;o Tecnificadas</b>): <br> <br>
                            Matrizes: <input name="qtd_matrizesNaoTec" class="text" id="qtd_matrizesNaoTec" size="7" maxlength="9" value="<%'if isnull(rs("Matrizes")) then response.write 0 else response.write rs("Matrizes") end if%>" onChange="valor(qtd_matrizesNaoTec)">
                            Cacha&ccedil;os: <input name="qtd_cachacosNaoTec" class="text" id="qtd_cachacosNaoTec" size="7" maxlength="9" value="<%'if isnull(rs("Cachacos")) then response.write 0 else response.write rs("Cachacos") end if%>" onChange="valor(qtd_cachacosNaoTec)">
                            Leit&otilde;es < 8 meses: <input name="qtd_menor8" class="text" id="qtd_menor8" size="7" maxlength="9" value="<%'if isnull(rs("LeitoesMaterno")) then response.write 0 else response.write rs("LeitoesMaterno") end if%>" onChange="valor(qtd_menor8)">
                            Leit&otilde;es > 8 meses: <input name="qtd_maior8" class="text" id="qtd_maior8" size="7" maxlength="9" value="<%'if isnull(rs("LeitoesCreche")) then response.write 0 else response.write rs("LeitoesCreche") end if%>" onChange="valor(qtd_maior8)">
                        </td>
                    </tr>
                        <td colspan="4">
                            10 - Risco Atribu&iacute;do ao Estabelecimento de Cria&ccedil;&atilde;o: <br> <br>
                <%
                call abreConexao
                sql = "select * from TB_Risco order by id_Risco"
                set rs = conn.execute(sql)
                do while not rs.eof
                %>
                    <div class="risco_item">
                    <input type="checkbox" name="chkRisco" id="chkRisco"  value="<%'=rs("id_Risco")%>"/><%=rs("DescricaoRisco")%> <br />
                    </div>
                <%
                    rs.movenext
                    loop
                    call fechaConexao
                %>
               
                        </td>
                    <tr>
                    <td colspan="4">

                        11 - Aspectos Produtivos e Sanit&aacute;rios da Cria&ccedil;&atilde;o (Infraestrutura de Su&iacute;nos): <br> <br>
                        <strong><u>Biosseguridade</u></strong> <br><br>

                <%
                    call abreConexao
                    sql = "Select * from TB_Aspectos WHERE TB_Aspectos.id_tipo = '1';"
                    set rs = conn.execute(sql)
                    do while not rs.eof
                %>
                    <div class="biosseguridade_item">
                    <INPUT id="aspecto1" name="aspecto1" type="checkbox" value="1" onClick=""  <%'if rs("Ruminantes") = 1 then%>  <%'end if%>><%=rs("Descricao")%> 
                    </div>
                <%
                    rs.movenext
                    loop
                    call fechaConexao
                %>

                <div class="alimentacao">
                    <strong><u>Alimentacao e Agua</u></strong> <br><br>
                <%
                    call abreConexao
                    sql = "Select * from TB_Aspectos WHERE TB_Aspectos.id_tipo = '2';"
                    set rs = conn.execute(sql)
                    do while not rs.eof
                %>
                <div class="alimentacao_item">
                            <INPUT id="aspecto1" name="aspecto1" type="checkbox" value="1" onClick=""  <%'if rs("Ruminantes") = 1 then%>  <%'end if%>><%=rs("Descricao")%>
                </div>
                <%
                    rs.movenext
                    loop
                    call fechaConexao
                %>
                </div>

                <div class="destino_suinos">
                <strong><u>Destino Suinos Mortos</u></strong> <br><br>
                <%
                    call abreConexao
                    sql = "Select * from TB_Aspectos WHERE TB_Aspectos.id_tipo = '3';"
                    set rs = conn.execute(sql)
                    do while not rs.eof
                %>
                    <div class="destino_suinos_item">
                    <INPUT id="aspecto1" name="aspecto1" type="checkbox" value="1" onClick=""  <%'if rs("Ruminantes") = 1 then%>  <%'end if%>><%=rs("Descricao")%>
                    </div>
                <%
                    rs.movenext
                    loop
                    call fechaConexao
                %>
                </div>

                <div class="destino_dejetos">
                <strong><u>Destino dos Dejetos</u></strong> <br><br>
                <%
                    call abreConexao
                    sql = "Select * from TB_Aspectos WHERE TB_Aspectos.id_tipo = '4';"
                    set rs = conn.execute(sql)
                    do while not rs.eof
                %>
                    <div class="destino_dejetos_item">
                    <INPUT id="aspecto1" name="aspecto1" type="checkbox" value="1" onClick=""  <%'if rs("Ruminantes") = 1 then%>  <%'end if%>><%=rs("Descricao")%>
                    </div>
                <%
                    rs.movenext
                    loop
                    call fechaConexao
                %>
                </div>
                    </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            12 - Acesso ao Mercado: <br> <br>
                            <INPUT id="AcessoMercado" name="AcessoMercado" type="radio" onClick="fluxo(0, 'alimentacao_esp')" value="1" <%'if rs("Alimentacao") = 1 then%> checked <%'end if%>>Independente &nbsp;&nbsp;&nbsp;
                            <INPUT id="AcessoMercado" name="AcessoMercado" type="radio" onClick="fluxo(0,'alimentacao_esp')" value="2" <%'if rs("Alimentacao") = 2 then%> checked <%'end if%>>Integrado / Nome da Integra&ccedil;&atilde;o/Cooperativa:
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            13 - Com&eacute;rcio de Animais Vivos: <br> <br>
                            <INPUT id="animais_vivos" name="animais_vivos" type="radio" value="1" <%'if rs("ComercioAnimaisVivos") = 1 then%> checked <%'end if%>>Interestadual &nbsp;&nbsp;&nbsp;
                            <INPUT id="animais_vivos" name="animais_vivos" type="radio" value="2" <%'if rs("ComercioAnimaisVivos") = 2 then%> checked <%'end if%>>Intermunicipal &nbsp;&nbsp;&nbsp;
                            <INPUT id="animais_vivos" name="animais_vivos" type="radio" value="3" <%'if rs("ComercioAnimaisVivos") = 3 then%> checked <%'end if%>>Intramunicipal
                        </td>
					</tr>
                    <tr>
                        <td colspan="4">
                            14 - Tipo de Abate: <br>
                        <b>Com Inspe&ccedil;&atilde;o:</b> &nbsp; &nbsp;
                            <INPUT id="abate" name="abate" type="radio" value="1" <%'if rs("TipoAbate") = 1 then%> checked <%'end if%>>Municipal
                            <INPUT id="abate" name="abate" type="radio" value="2" <%'if rs("TipoAbate") = 2 then%> checked <%'end if%>>Estadual
                            <INPUT id="abate" name="abate" type="radio" value="3" <%'if rs("TipoAbate") = 3 then%> checked <%'end if%>>Federal
							<INPUT id="abate" name="abate" type="radio" value="4" <%'if rs("TipoAbate") = 3 then%> checked <%'end if%>>SISBI/POA
							<br /> <br>
                            <INPUT id="abate" name="abate" type="radio" value="4" <%'if rs("TipoAbate") = 4 then%> checked <%'end if%>>Na Propriedade &nbsp;
                            <INPUT id="abate" name="abate" type="radio" value="5" <%'if rs("TipoAbate") = 5 then%> checked <%'end if%>>N&atilde;o Abate &nbsp;
                            <INPUT id="abate" name="abate" type="radio" value="6" <%'if rs("TipoAbate") = 6 then%> checked <%'end if%>>Outros 
                        </td>
					</tr>
                    <tr>
                        <td colspan="4">
                            15 - Vacina&ccedil;&atilde;o Regular: <br>
                        	<INPUT id="vacinacao_regular" name="vacinacao_regular" type="radio" onClick="fluxo(0,'vacinacao_regular_esp')" value="0" <%'if rs("VacinacaoRegular") = 0 then%> checked <%'end if%>>N&atilde;o
                            <INPUT id="vacinacao_regular" name="vacinacao_regular" type="radio" onClick="fluxo(1,'vacinacao_regular_esp')" value="1" <%'if rs("VacinacaoRegular") = 1 then%> checked <%'end if%>>Sim 
                            - Quais: <input name="vacinacao_regular_esp" class="text" id="vacinacao_regular_esp" size="78" maxlength="255" value="<%'=rs("QuaisVacinacaoRegular")%>" onKeyPress="this.value = this.value.toUpperCase()" onChange="this.value = this.value.toUpperCase()" >
                        </td>
					</tr>
                    <tr>
                        <td colspan="4">
                            16 - Vermifuga&ccedil;&atilde;o Regular: <br>
                        	<INPUT id="vermifugacao" name="vermifugacao" type="radio" value="0" onClick="Verificar_vermifugacao_frequencia()" <%'if rs("VermifugacaoRegular") = 0 then%> checked <%'end if%>>N&atilde;o 
                            <INPUT id="vermifugacao" name="vermifugacao" type="radio" value="1" onClick="Verificar_vermifugacao_frequencia()" <%'if rs("VermifugacaoRegular") = 1 then%> checked <%'end if%>>Sim 
                            - Frequ&ecirc;ncia: 
                            <INPUT id="vermifugacao_frequencia" name="vermifugacao_frequencia" type="radio" value="1" onClick="Verificar_vermifugacao_frequencia()"  <%'if rs("vermifugacaofrequencia") = 1 then%> checked <%'end if%>>01 por Ano 
                            <INPUT id="vermifugacao_frequencia" name="vermifugacao_frequencia" type="radio" value="2" onClick="Verificar_vermifugacao_frequencia()"  <%'if rs("vermifugacaofrequencia") = 2 then%> checked <%'end if%>>02 por Ano 
                            <INPUT id="vermifugacao_frequencia" name="vermifugacao_frequencia" type="radio" value="3" onClick="Verificar_vermifugacao_frequencia()"  <%'if rs("vermifugacaofrequencia") = 3 then%> checked <%'end if%>>03 por Ano 
                            <INPUT id="vermifugacao_frequencia" name="vermifugacao_frequencia" type="radio" value="4" onClick="Verificar_vermifugacao_frequencia()"  <%'if rs("vermifugacaofrequencia") = 4 then%> checked <%'end if%>>04 por Ano 
                        </td>
					</tr>

                    <tr>
                        <td colspan="4">
                            17 - Tipo de Instala&ccedil;&otilde;es: <br>
                            <INPUT id="instalacoes" name="instalacoes" type="radio" value="1" <%'if rs("TipoInstalacao") = 1 then%> checked <%'end if%>>Alvenaria
                            <INPUT id="instalacoes" name="instalacoes" type="radio" value="2" <%'if rs("TipoInstalacao") = 2 then%> checked <%'end if%>>Madeira
                            <INPUT id="instalacoes" name="instalacoes" type="radio" value="3" <%'if rs("TipoInstalacao") = 3 then%> checked <%'end if%>>Metalica
                            <INPUT id="instalacoes" name="instalacoes" type="radio" value="5" <%'if rs("TipoInstalacao") = 5 then%> checked <%'end if%>>Mista
                        </td>
					</tr>
                
                    <tr>
                        <td colspan="4">
                             18 - Respons&aacute;vel T&eacute;cnico: 
                               <input name="resp_tecnico" class="text" id="resp_tecnico" size="75" maxlength="255" value="<%'=rs("NomeRTResposavel")%>"  onKeyPress="this.value = this.value.toUpperCase()" onChange="this.value = this.value.toUpperCase()"  > <br>
                        </td>
                    </tr>
                        <td colspan="4">
                             19 - Respons&aacute;vel Pelas Informa&ccedil;&otilde;es: 
                               <input name="resp_info" class="text" id="resp_info" size="67" maxlength="255" value="<%'=rs("resp_info")%>"  onKeyPress="this.value = this.value.toUpperCase()" onChange="this.value = this.value.toUpperCase()"  > <br>
                        </td>
                    </tr>

                    <tr>
                    	<td colspan="4"><strong>Respons&aacute;vel pelo cadastro</strong></td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            Nome:   <b><%'IF ISNULL(rs("NomeUsuario")) THEN RESPONSE.WRITE UCASE(session("nomeUs")) ELSE RESPONSE.WRITE UCASE(rs("NomeUsuario")) END IF %></b>	
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            Cargo:  <b><%'IF ISNULL(rs("Cargo")) THEN RESPONSE.WRITE UCASE(session("descrTipoEmitente")) ELSE RESPONSE.WRITE UCASE(rs("Cargo")) END IF%></b>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            UVL:    <b><%'IF ISNULL(rs("Unidade")) THEN RESPONSE.WRITE UCASE(session("nomeUnidade")) ELSE RESPONSE.WRITE UCASE(rs("Unidade"))%></b>
                        </td>
                    </tr>
					<tr>
                        <td colspan="4">
                            Data: <b><%'IF ISNULL(rs("DataCadastro")) THEN RESPONSE.WRITE Date() ELSE RESPONSE.WRITE rs("DataCadastro") END IF%></b>
                        </td>
                    </tr>
					<tr align="center">
                        <td colspan="4">
                            <input id="bt_cadastrar" name="bt_cadastrar" type="submit" value="Cadastrar" class="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input id="bt_Fechar" name="bt_Fechar" type="button" value="  Fechar  " class="button" onClick="javaScript:window.close();">
                        </td>
                	</tr>
				</table>
            
<%'
 'rs.Close
 'Set rs = Nothing
'call fechaConexao%>

            <br />

</div>
    </form>
</body>
</html>