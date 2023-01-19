<!--#include file ="lib/Conexao.asp"-->
<!--<script>
window.onload = function(){

if (document.getElementById("tecnificacao").checked) {
  var Existe = 3;
}else {
	Existe = 0;
	document.getElementById('divTecnificada').style.display='none';	
	document.getElementById('divNaoTecnificada').style.display='none';
}

	alert(Existe);
}
</script>-->
<%
'response.write(request("Resp"))
'response.end

CpfProdutor    = request.QueryString("CNPJCPFProdutor")
CodINCRA       = request.QueryString("INCRAProp")
idSuideos1 	   = request.QueryString("idSuideos")
IF REQUEST("OPERACAO") = 1 THEN 

	call abreConexao
		LatitudeGalpao=Request.Form("edLatG") & Request.Form("edLatM") & Replace(Request.Form("edLatS"), ".", "")
		LongitudeGalpao=Request.Form("edLongG") & Request.Form("edLongM") & Replace(Request.Form("edLongS"), ".", "")	

 		sql="SET NOCOUNT ON; INSERT INTO TB_frmSuideos(CodINCRA, CNPJCPFProdutor, NumCadastro, AreaPropriedade, AreaConstruida, NumerosGalpoes, CapacidadeAlojamento, LatitudeGalpao, LongitudeGalpao, DistanciaProx_Trans_Suinos, Distan_estabe_Suinos_proximo, PopulacaoTecnificada, PopulcaoTecnificadaId, PopulacaoCriacaoCateto, PresencaSuinosAsselvajados, Matrizes, Cachacos, LeitoesMaterno, LeitoesCreche, LeitoesTerm, MatrizesNaoTecnificada, CachacoNaoTecnificada, LeitoesMaior8, LeitoesMenor8, AcessoMercado, ComercioAnimaisVivos, TipoAbate, VacinacaoRegular, QuaisVacinacaoRegular, VermifugacaoRegular, vermifugacaofrequencia, TipoInstalacao, NomeRTResposavel, NomeResponsavelInformacaoes) VALUES('"&CodINCRA&"', '"&CpfProdutor&"','"&request.form("NumeroCadastro")&"', '"&request.form("AreaProp")&"', '"&request.form("AreaConstruida")&"', '"&request.form("Galpoes")&"', '"&request.form("CapacidadeAlojamento")&"', '"&LatitudeGalpao&"', '"&LongitudeGalpao&"', '"&request.form("DistanciaProx")&"', '"&request.form("DistanciaEstab")&"', '"&Request.form("tecnificacao")&"', '"&request.form("tecnificacao1")&"', '"&request.form("criacaoComercial")&"', '"&request.form("presencaSuinos")&"', '"&request.form("qtd_matrizes")&"', '"&request.form("qtd_cachacos")&"', '"&request.form("qtd_matern")&"', '"&request.form("qtd_creche")&"','"&request.form("qtd_term")&"', '"&request.form("qtd_matrizesNaoTec")&"', '"&request.form("qtd_cachacosNaoTec")&"', '"&request.form("qtd_maior8")&"', '"&request.form("qtd_menor8")&"', '"&request.form("AcessoMercado")&"', '"&request.form("animais_vivos")&"', '"&request.form("abate")&"', '"&request.form("vacinacao_regular")&"', '"&request.form("vacinacao_regular_esp")&"', '"&request.form("vermifugacao")&"', '"&request.form("vermifugacao_frequencia")&"', '"&request.form("instalacoes")&"', '"&request.form("resp_tecnico")&"', '"&request.form("resp_info")&"'); SET NOCOUNT OFF; SELECT SCOPE_IDENTITY() ID"
	Dim rs
	'response.write sql
	'response.end
	set rs = conn.execute(sql)

	'response.write rs("ID")
	'response.end

	for i = 1 to 15
	risco = request.form("chkRisco"&i)
	if risco <> "" then 
	sql2 = "INSERT TB_frmSuideosRiscos(idRiscos, idSuideos) VALUES('"&risco&"', '"&rs("ID")&"')"
	'response.write sql2
	'response.end
	conn.execute(sql2)
	end if
	next

	for i = 1 to 43
	aspectos = request.form("aspecto"&i&f&a&b)
	if aspectos <> "" then
	sql3 = "INSERT TB_frmSuideosAspectos(idAspectos, idSuideos) VALUES ('"&aspectos&"', '"&rs("ID")&"')"
	conn.execute(sql3)
	end if
	next
call fechaConexao
	response.Redirect("frm_Cad_Alter_Suino.asp?CNPJCPFProdutor="&CpfProdutor&"&INCRAProp="&CodINCRA&"&Resp=1")
end if

IF REQUEST("OPERACAO") = 3 THEN
call abreConexao
		LatitudeGalpao=Request.Form("edLatG") & Request.Form("edLatM") & Replace(Request.Form("edLatS"), ".", "")
		LongitudeGalpao=Request.Form("edLongG") & Request.Form("edLongM") & Replace(Request.Form("edLongS"), ".", "")

sql2 = "Update TB_frmSuideos SET NumCadastro = '"&request.form("NumeroCadastro")&"', AreaPropriedade = '"&request.form("AreaProp")&"', AreaConstruida = '"&request.form("AreaConstruida")&"', NumerosGalpoes = '"&request.form("Galpoes")&"', CapacidadeAlojamento = '"&request.form("CapacidadeAlojamento")&"', LatitudeGalpao = '"&LatitudeGalpao&"', LongitudeGalpao = '"&LongitudeGalpao&"', DistanciaProx_Trans_Suinos = '"&request.form("DistanciaProx")&"', Distan_estabe_Suinos_proximo = '"&request.form("DistanciaEstab")&"', PopulacaoTecnificada = '"&Request.form("tecnificacao")&"', PopulcaoTecnificadaId = '"&request.form("tecnificacao1")&"', PopulacaoCriacaoCateto = '"&request.form("criacaoComercial")&"', PresencaSuinosAsselvajados = '"&request.form("presencaSuinos")&"', Matrizes = '"&request.form("qtd_matrizes")&"', Cachacos = '"&request.form("qtd_cachacos")&"', LeitoesMaterno = '"&request.form("qtd_matern")&"', LeitoesCreche = '"&request.form("qtd_creche")&"', LeitoesTerm = '"&request.form("qtd_term")&"', MatrizesNaoTecnificada = '"&request.form("qtd_matrizesNaoTec")&"', CachacoNaoTecnificada = '"&request.form("qtd_cachacosNaoTec")&"', LeitoesMaior8 = '"&request.form("qtd_maior8")&"', LeitoesMenor8 = '"&request.form("qtd_menor8")&"', AcessoMercado = '"&request.form("AcessoMercado")&"', ComercioAnimaisVivos = '"&request.form("animais_vivos")&"', TipoAbate = '"&request.form("abate")&"', VacinacaoRegular = '"&request.form("vacinacao_regular")&"', QuaisVacinacaoRegular = '"&request.form("vacinacao_regular_esp")&"', VermifugacaoRegular = '"&request.form("vermifugacao")&"', vermifugacaofrequencia = '"&request.form("vermifugacao_frequencia")&"', TipoInstalacao = '"&request.form("instalacoes")&"', NomeRTResposavel = '"&request.form("resp_tecnico")&"', NomeResponsavelInformacaoes = '"&request.form("resp_info")&"' WHERE idSuideos = '"&idSuideos1&"' and CNPJCPFProdutor = '"&CpfProdutor&"' and CodINCRA = '"&CodINCRA&"'; " 
'response.write sql2
'response.end
set rs = conn.execute(sql2)

	sql5 = "DELETE FROM TB_frmSuideosRiscos WHERE idSuideos = '"&idSuideos1&"'"
	'response.write sql5
	'response.end
	conn.execute(sql5)

	for i = 1 to 15
	risco = request.form("chkRisco"&i)
	if risco <> "" then 
	sql6 = "INSERT TB_frmSuideosRiscos(idRiscos, idSuideos) VALUES('"&risco&"', '"&idSuideos1&"')"
	'response.write sql6
	'response.end
	conn.execute(sql6)
	end if
	next

	sql5 = "DELETE FROM TB_frmSuideosAspectos WHERE idSuideos = '"&idSuideos1&"'"
	'response.write sql5
	'response.end
	conn.execute(sql5)

	for i = 1 to 43
	aspectos = request.form("aspecto"&i&f&a&b)
	if aspectos <> "" then
	sql3 = "INSERT TB_frmSuideosAspectos(idAspectos, idSuideos) VALUES ('"&aspectos&"', '"&idSuideos1&"')"
	conn.execute(sql3)
	end if
	next
call fechaConexao
response.Redirect("frm_Cad_Alter_Suino.asp?CNPJCPFProdutor="&CpfProdutor&"&INCRAProp="&CodINCRA&"&Resp=2")

end if

	call abreConexao
	sql = "SELECT idSuideos, NumCadastro, AreaPropriedade, AreaConstruida, NumerosGalpoes, CapacidadeAlojamento, LatitudeGalpao, LongitudeGalpao, DistanciaProx_Trans_Suinos, Distan_estabe_Suinos_proximo, PopulacaoTecnificada, PopulcaoTecnificadaId, PopulacaoCriacaoCateto, PresencaSuinosAsselvajados, Matrizes, Cachacos, LeitoesMaterno, LeitoesCreche, LeitoesTerm, MatrizesNaoTecnificada, CachacoNaoTecnificada, LeitoesMaior8, LeitoesMenor8, AcessoMercado, ComercioAnimaisVivos, TipoAbate, VacinacaoRegular, QuaisVacinacaoRegular, VermifugacaoRegular, vermifugacaofrequencia, TipoInstalacao, NomeRTResposavel, NomeResponsavelInformacaoes FROM TB_frmSuideos WHERE CNPJCPFProdutor = '"&CpfProdutor&"'"
	'response.write sql
	'response.end
	set rs = conn.execute(sql)
	if not rs.eof then
	idSuideos 					 = rs("idSuideos")
	NumCadastro          		 = rs("NumCadastro")
	AreaPropriedade      		 = rs("AreaPropriedade")
	AreaConstruida      		 = rs("AreaConstruida")
	NumerosGalpoes       		 = rs("NumerosGalpoes")
	CapacidadeAlojamento 		 = rs("CapacidadeAlojamento")
	LatitudeGalpao       		 = rs("LatitudeGalpao")
	LongitudeGalpao      		 = rs("LongitudeGalpao")
	DistanciaProx_Trans_Suinos	 = rs("DistanciaProx_Trans_Suinos")
	Distan_estabe_Suinos_proximo = rs("Distan_estabe_Suinos_proximo")
	PopulacaoTecnificada		 = rs("PopulacaoTecnificada")
	PopulcaoTecnificadaId        = rs("PopulcaoTecnificadaId")
	PopulacaoCriacaoCateto       = rs("PopulacaoCriacaoCateto")
	PresencaSuinosAsselvajados   = rs("PresencaSuinosAsselvajados")
	Matrizes					 = rs("Matrizes")
	Cachacos					 = rs("Cachacos")
	LeitoesMaterno				 = rs("LeitoesMaterno")
	LeitoesCreche				 = rs("LeitoesCreche")
	LeitoesTerm					 = rs("LeitoesTerm")
	MatrizesNaoTecnificada       = rs("MatrizesNaoTecnificada")
	CachacoNaoTecnificada        = rs("CachacoNaoTecnificada")
	LeitoesMaior8				 = rs("LeitoesMaior8")
	LeitoesMenor8				 = rs("LeitoesMenor8")
	AcessoMercado				 = rs("AcessoMercado")
	ComercioAnimaisVivos		 = rs("ComercioAnimaisVivos")
	TipoAbate					 = rs("TipoAbate")
	VacinacaoRegular			 = rs("VacinacaoRegular")
	QuaisVacinacaoRegular		 = rs("QuaisVacinacaoRegular")
	VermifugacaoRegular			 = rs("VermifugacaoRegular")
	vermifugacaofrequencia		 = rs("vermifugacaofrequencia")
	TipoInstalacao 				 = rs("TipoInstalacao")
	NomeRTResposavel			 = rs("NomeRTResposavel")
	NomeResponsavelInformacaoes	 = rs("NomeResponsavelInformacaoes")
	Existe = 1
	end if
	
   %>



<html>
<head>
    <title>Cadastro de Su&iacute;deos</title>
	 <link rel="stylesheet" href="estilo_Suino.css">

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

function mensagem(resp){
if(resp == 1){
	Swal.fire({
      title: "\u00d3timo!!!",
      text: "Cadastrado Finalizado com Sucesso!",
      icon: "success",
      button: "Ok!",
      });
      return false;
}
else
if(resp == 2){
	 Swal.fire({
      title: "\u00d3timo!!!",
      text: "Cadastrado Alterado com Sucesso!",
      icon: "success",
      button: "Ok!",
      });
      return false;
}
}



</script>

</head>
<body>
<%if request("Resp") = 1 or request("Resp") = 2 then%>
<script>
  var resp = <%=request("Resp")%>
  mensagem(resp);
</script>
<%end if%>

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
		        <%
				call abreConexao
				sql = "SELECT * FROM TB_Produtor INNER JOIN TB_Municipios ON TB_Municipios.CodMunicipio = TB_Produtor.CodMunProdutor WHERE CNPJCPFProdutor = '"&CpfProdutor&"'"
				'response.write sql
				'response.end
				set rs = conn.execute(sql)
				if not rs.eof then
				NomeProdutor     =  rs("NomeProdutor") 
				EndProdutor      =  rs("EndProdutor")
				Apelido          =  rs("Apelido")
				DataCadProdutor  =  rs("DataCadProdutor")
				Rg               =  rs("Rg")
				NomeMunicipio    =  rs("NomeMunicipio") 
				CEPProdutor      =  rs("CEPProdutor")
				DataCadastro     =  rs("DataCadProdutor")
				FoneProdutor     =  rs("FoneProdutor")
				CelularProdutor  =  rs("CelularProdutor")	
				
				%>
                    <tr>
                    	<td colspan="4" align="center" class="tabela_rotulo"><strong>&nbsp; Dados do Propriet&aacute;rio</strong></td>
                    </tr>
                    <tr>
					
                        <td colspan="2">1 - Nome: <b><%=NomeProdutor%></b></td>
                        <td colspan="2">Data do Cadastro(Recadastro): <%if isnull(rs("DataCadProdutor")) then response.write Date() else response.write rs("DataCadProdutor") end if%></td>
					</tr>
                     <tr>
                        <td colspan="2">2 - Apelido(Nome Fantasia): <b><%=Apelido%></b></td>
                        <td colspan="1">CPF/CNPJ: <b><%=CpfProdutor%></b></td>
                        <td colspan="0">RG: <%=Rg%></td>
					</tr>
                    <tr>
                        <td colspan="2">3 - Endere&ccedil;o: <%=EndProdutor%></td>
                        <td colspan="2">Munic&iacute;pio: <%=NomeMunicipio%></td>
					</tr>
                    <tr>
                        <td colspan="1">4 - CEP: <%=CEPProdutor%></td>
                        <td colspan="1">Telefone Fixo: <%=FoneProdutor%></td>
                        <td colspan="1">Celular: <%=CelularProdutor%></td>
						<td colspan="1"></td>
					</tr>
					<%end if
					call fechaConexao%>
                    <tr><td colspan="4">&nbsp;</td></tr>
                    <tr>
                    	<td colspan="4" align="center" class="tabela_rotulo"><strong>&nbsp; Dados da Propriedade</strong></td>
                    </tr>
					<%
					call abreConexao
					sql = "SELECT * FROM TB_Propriedade INNER JOIN TB_Municipios ON TB_Municipios.CodMunicipio = TB_Propriedade.CodMunProp WHERE INCRAProp = '"&CodINCRA&"'"
					'response.write sql
					'response.end
					set rs = conn.execute(sql)

					if not rs.eof then
					NomeProp           = rs("NomeProp")
					CnpjCpfProp        = rs("CNPJCPFProprietario")
					InscricaoEstadual  = rs("InscricaoEstadual")
					EndProp            = rs("EndProp")
					NomeMunicipio  = rs("NomeMunicipio")

					%>

                    <tr>
                    	<td colspan="3">1 - Nome da Empresa/Raz&atilde;o Social: <b><%=rs("NomeProp")%></b></td>
                        <td colspan="2">N&deg;. do Cadastro: 
                        <input name="NumeroCadastro" class="text" id="NumeroCadastro" size="7" maxlength="9" value="<%=NumCadastro%>" onKeyPress="mascara(this,numeros)"></td>
                    </tr>
                    <tr>
                    	<td colspan="2">2 - CNPJ: <%=rs("CNPJCPFProprietario")%></td>
                        <td colspan="2"> Inscr. Estadual: <%=rs("InscricaoEstadual")%></td>
                    </tr>
                    <tr>
                    	<td colspan="2">3 - Endere&ccedil;o: <%=rs("EndProp")%></td>
                        <td colspan="2"> Munic&iacute;pio: <%=rs("NomeMunicipio")%></td>
					</tr>
					<%end if
					call fechaConexao%>
                    <tr>
                    	<td colspan="2" >4 - &Aacute;rea da Propriedade: 
                        <input name="AreaProp" class="text" id="AreaProp" size="7" maxlength="9" value="<%=AreaPropriedade%>" onKeyPress="mascara(this,numeros)">(ha.)</td>
                        <td colspan="2">&Aacute;rea Constru&iacute;da/Area utilizada com Suinocultura: 
                        <input name="AreaConstruida" class="text" id="AreaConstruida" size="7" maxlength="9" value="<%=AreaConstruida%>" onKeyPress="mascara(this,numeros)">(m<sup>2</sup>)</td>
                    </tr>
                    <tr>
                    	<td colspan="2">5 - N&deg;. de Galp&otilde;es/Piquetes: 
               	      <input name="Galpoes" class="text" id="Galpoes" size="7" maxlength="9" value="<%=NumerosGalpoes%>" onKeyPress="mascara(this,numeros)"></td>
                        <td colspan="2"> Capacidade de Alojamento de Su&iacute;nos: 
                        <input name="CapacidadeAlojamento" class="text" id="CapacidadeAlojamento" size="7" maxlength="9" value="<%=CapacidadeAlojamento%>" onKeyPress="mascara(this,numeros)"></td>
					</tr>
					<tr>
                    	<td>6 - Coordenadas Pocilga/Galp&otilde;es (SIRGAS 2000) <br>(Grau, minutos e segundos)</td> <br> 	
                    	<br> 
                        <td width="33%">Lat(S)
                        <input type="text" size="2" maxlength="2" name="edLatG" onChange="grau_minuto(this);" value="<%=left((LatitudeGalpao), 2)%>" class="text">
                            &deg;
                        <input type="text" size="2" maxlength="2" name="edLatM" onChange="grau_minuto(this);" value="<%=mid((LatitudeGalpao), 3, 2)%>" class="text">
                            '
                        <input type="text" size="4" maxlength="4" name="edLatS" onChange="segundo(this);" value="<%=mid((LatitudeGalpao), 5, 2) & "." & right(trim(LatitudeGalpao), 1)%>"  class="text">
                        ''</td> &nbsp;&nbsp;&nbsp;

                        <td colspan="2">Lon(W)
                        <input type="text" size="2" maxlength="2" name="edLongG" onChange="grau_minuto(this);" value="<%=left((LongitudeGalpao), 2)%>"  class="text">
			                &deg;
			            <input type="text" size="2" maxlength="2" name="edLongM" onChange="grau_minuto(this);"  value="<%=mid((LongitudeGalpao), 3, 2)%>"  class="text">
		                	'
		                <input type="text" size="4" maxlength="4" name="edLongS" onChange="segundo(this);"  value="<%=mid((LongitudeGalpao), 5, 2) & "." & right(trim(LongitudeGalpao), 1)%>" class="text">
		                	''		             
                        </td>

                    </tr>
                    <tr>
                    	<td colspan="2">7 - Dist&acirc;ncia da Via Mais Pr&oacute;xima com Tr&acirc;nsito de Su&iacute;nos:
               	      <input name="DistanciaProx" class="text" id="DistanciaProx" size="7" maxlength="9" value="<%=DistanciaProx_Trans_Suinos%>" onKeyPress="mascara(this,numeros)"></td>
                        <td colspan="2"> Dist&acirc;ncia do Estab. com Su&iacute;nos mais Pr&oacute;ximos: 
                        <input name="DistanciaEstab" class="text" id="DistanciaEstab" size="7" maxlength="9" value="<%=Distan_estabe_Suinos_proximo%>" onKeyPress="mascara(this,numeros)"></td>
					</tr>
					<div id="divPrincipal">
                    	<td colspan="4">
                            8 - Popula&ccedil;&atilde;o: <BR>
                            
                        	<INPUT id="tecnificacao"  name="tecnificacao" onClick="return tecnificada()" type="radio" value="SIM" <%if PopulacaoTecnificada = "SIM" then%> checked <%end if%>><strong>Tecnificada:</strong>
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="1" <%if PopulcaoTecnificadaId = 1 then%> checked <%end if%>>Ciclo Completo 
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="2" <%if PopulcaoTecnificadaId = 2 then%> checked <%end if%>>Unidade Produtora de Leitões(UPL)
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="3" <%if PopulcaoTecnificadaId = 3 then%> checked <%end if%>>Creche 
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="4" <%if PopulcaoTecnificadaId = 4 then%> checked <%end if%>>Termina&ccedil;&atilde;o
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="5" <%if PopulcaoTecnificadaId = 5 then%> checked <%end if%>>Granja de Reprodutores Su&iacute;nos certificada(GRSC)   <br>
                            <INPUT id="tecnificacao"  name="tecnificacao" onClick="tecnificada()" type="radio" value="NAO" <%if PopulacaoTecnificada = "NAO" then%> checked <%end if%>><strong>N&atilde;o Tecnificada:</strong>
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="6" <%if PopulcaoTecnificadaId = 6 then%> checked <%end if%>>Com&eacute;rcio Local 
                            <INPUT id="tecnificacao1" name="tecnificacao1" type="radio" value="7" <%if PopulcaoTecnificadaId = 7 then%> checked <%end if%>>Subsist&ecirc;ncia     <br>
                            <INPUT id="criacaoComercial" name="criacaoComercial" type="checkbox" value="SIM" <%if PopulacaoCriacaoCateto = "SIM" then%> checked <%end if%>><strong>Cria&ccedil;&atilde;o Comercial de Cateto/Queixada</strong> <br>
                            <INPUT id="presencaSuinos" name="presencaSuinos" type="checkbox" value="SIM" <%if PresencaSuinosAsselvajados = "SIM" then%> checked <%end if%>><strong>Presen&ccedil;a de Su&iacute;nos Asselvajados</strong>
						</td>
                    </tr>
                </tr>
					</div>
					
                    <tr>
                        <td colspan="4">
						<div id="divTecnificada" value="1">
                            9 - N&deg;. de Animais Existentes(<b>Tecnificadas</b>): <br> <br>
                            Matrizes: <input name="qtd_matrizes" class="text" id="qtd_matrizes" size="7" maxlength="9" value="<%if isnull (Matrizes) then response.write 0 else response.write (Matrizes) end if%>" onChange="valor(qtd_matrizes)">
                            Cacha&ccedil;os: <input name="qtd_cachacos" class="text" id="qtd_cachacos" size="7" maxlength="9" value="<%if isnull(Cachacos) then response.write 0 else response.write (Cachacos) end if%>" onChange="valor(qtd_cachacos)">
                            Leit&otilde;es Matern.: <input name="qtd_matern" class="text" id="qtd_matern" size="7" maxlength="9" value="<%if isnull(LeitoesMaterno) then response.write 0 else response.write (LeitoesMaterno) end if%>" onChange="valor(qtd_matern)">
                            Leit&otilde;es Creche: <input name="qtd_creche" class="text" id="qtd_creche" size="7" maxlength="9" value="<%if isnull(LeitoesCreche) then response.write 0 else response.write (LeitoesCreche) end if%>" onChange="valor(qtd_creche)"> <br><br>
                            Leit&otilde;es Term.: <input name="qtd_term" class="text" id="qtd_term" size="7" maxlength="9" value="<%if isnull(LeitoesCreche) then response.write 0 else response.write (LeitoesTerm) end if%>" onChange="valor(qtd_term)">
						</div>
                        </td>
                    </tr>
					
                    <tr>
					
                        <td colspan="4">
						<div id="divNaoTecnificada" value="2">
                            N&deg;. de Animais Existentes(<b>N&atilde;o Tecnificadas</b>): <br> <br>
                            Matrizes: <input name="qtd_matrizesNaoTec" class="text" id="qtd_matrizesNaoTec" size="7" maxlength="9" value="<%if isnull(MatrizesNaoTecnificada) then response.write 0 else response.write (MatrizesNaoTecnificada) end if%>" onChange="valor(qtd_matrizesNaoTec)">
                            Cacha&ccedil;os: <input name="qtd_cachacosNaoTec" class="text" id="qtd_cachacosNaoTec" size="7" maxlength="9" value="<%if isnull(CachacoNaoTecnificada) then response.write 0 else response.write (CachacoNaoTecnificada) end if%>" onChange="valor(qtd_cachacosNaoTec)">
                            Leit&otilde;es < 8 meses: <input name="qtd_menor8" class="text" id="qtd_menor8" size="7" maxlength="9" value="<%if isnull(LeitoesMenor8) then response.write 0 else response.write (LeitoesMenor8) end if%>" onChange="valor(qtd_menor8)">
                            Leit&otilde;es > 8 meses: <input name="qtd_maior8" class="text" id="qtd_maior8" size="7" maxlength="9" value="<%if isnull(LeitoesMaior8) then response.write 0 else response.write (LeitoesMaior8) end if%>" onChange="valor(qtd_maior8)">
							</div>
                        </td>
                    </tr>
					<script>
					    tecnificada();
						function tecnificada() {

						//alert(document.frm_Suinos.tecnificacao[0].checked)
						if(document.frm_Suinos.tecnificacao[0].checked){
						document.getElementById('divTecnificada').style.display='block';
						}else{
						document.getElementById('divTecnificada').style.display='none';
						}
						if(document.frm_Suinos.tecnificacao[1].checked){
						document.getElementById('divNaoTecnificada').style.display='block';
						}else{
						document.getElementById('divNaoTecnificada').style.display='none';
						}
						}
					</script>
                        <td colspan="4">
                            10 - Risco Atribu&iacute;do ao Estabelecimento de Cria&ccedil;&atilde;o: <br> <br>
                <%
                call abreConexao
                sql = "select * from TB_Risco order by id_Risco"
                set rs = conn.execute(sql)
				
				i=0 
                do while not rs.eof
				i=i+1

				sql2 = "Select count(*) as total from TB_frmSuideosRiscos WHERE idRiscos = '"&rs("id_Risco")&"' AND idSuideos = '"&idSuideos&"'"
				set rs1 = conn.execute(sql2)
				total = rs1("total")
				'response.write rs("id_Risco")&"--"&idSuideos&"--"&total
				
                %>
                    <div class="risco_item">
                    <input type="checkbox" name="chkRisco<%=i%>" id="chkRisco"  value="<%=rs("id_Risco")%>" <%if csng(total) > csng(0) then%>checked <%end if%>/><%=rs("DescricaoRisco")%> <br />
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
					i=0 
                    do while not rs.eof
					i=i+1

					sql2 = "Select count(*) as total from TB_frmSuideosAspectos WHERE idAspectos = '"&rs("id")&"' AND idSuideos = '"&idSuideos&"'"
					set rs1 = conn.execute(sql2)
					total = rs1("total")
					'response.write rs("id")&"--"&idSuideos&"--"&total
					
                %>

                    <div class="biosseguridade_item">
                    <INPUT id="aspecto" name="aspecto<%=i%>" type="checkbox" value="<%=rs("id")%>" <%if csng(total) > csng(0) then%>checked <%end if%> ><%=rs("Descricao")%> 
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
					f=23
                    do while not rs.eof
					f=f+1

					sql2 = "Select count(*) as total from TB_frmSuideosAspectos WHERE idAspectos = '"&rs("id")&"' AND idSuideos = '"&idSuideos&"'"
					set rs1 = conn.execute(sql2)
					total = rs1("total")
					'response.write rs("id")&"--"&idSuideos&"--"&total
										
                %>
                <div class="alimentacao_item">
                    <INPUT id="aspecto" name="aspecto<%=f%>" type="checkbox" value="<%=rs("id")%>" <%if csng(total) > csng(0) then%>checked <%end if%>><%=rs("Descricao")%>
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
					a=34
                    do while not rs.eof
					a=a+1
					sql2 = "Select count(*) as total from TB_frmSuideosAspectos WHERE idAspectos = '"&rs("id")&"' AND idSuideos = '"&idSuideos&"'"
					set rs1 = conn.execute(sql2)
					total = rs1("total")
					'response.write rs("id")&"--"&idSuideos&"--"&total
                %>
                    <div class="destino_suinos_item">
                    <INPUT id="aspecto" name="aspecto<%=a%>" type="checkbox" value="<%=rs("id")%>" <%if csng(total) > csng(0) then%>checked <%end if%>><%=rs("Descricao")%>
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
					b=38
                    do while not rs.eof
					b=b+1

					sql2 = "Select count(*) as total from TB_frmSuideosAspectos WHERE idAspectos = '"&rs("id")&"' AND idSuideos = '"&idSuideos&"'"
					set rs1 = conn.execute(sql2)
					total = rs1("total")
					'response.write rs("id")&"--"&idSuideos&"--"&total
                %>
                    <div class="destino_dejetos_item">
                    <INPUT id="aspecto" name="aspecto<%=b%>" type="checkbox" value="<%=rs("id")%>" <%if csng(total) > csng(0) then%>checked <%end if%>><%=rs("Descricao")%>
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
                            <INPUT id="AcessoMercado" name="AcessoMercado" type="radio" onClick="fluxo(0, 'alimentacao_esp')" value="1" <%if(AcessoMercado) = 1 then%> checked <%end if%>>Independente &nbsp;&nbsp;&nbsp;
                            <INPUT id="AcessoMercado" name="AcessoMercado" type="radio" onClick="fluxo(0,'alimentacao_esp')" value="2" <%if(AcessoMercado) = 2 then%> checked <%end if%>>Integrado / Nome da Integra&ccedil;&atilde;o/Cooperativa:
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            13 - Com&eacute;rcio de Animais Vivos: <br> <br>
                            <INPUT id="animais_vivos" name="animais_vivos" type="radio" value="1" <% if (ComercioAnimaisVivos) = 1 then%> checked <% end if%>>Interestadual &nbsp;&nbsp;&nbsp;
                            <INPUT id="animais_vivos" name="animais_vivos" type="radio" value="2" <% if (ComercioAnimaisVivos) = 2 then%> checked <% end if%>>Intermunicipal &nbsp;&nbsp;&nbsp;
                            <INPUT id="animais_vivos" name="animais_vivos" type="radio" value="3" <% if (ComercioAnimaisVivos) = 3 then%> checked <% end if%>>Intramunicipal
                        </td>
					</tr>
                    <tr>
                        <td colspan="4">
                            14 - Tipo de Abate: <br>
                        <b>Com Inspe&ccedil;&atilde;o:</b> &nbsp; &nbsp;
                            <INPUT id="abate" name="abate" type="radio" value="1" <% if (TipoAbate) = 1 then%> checked <% end if%>>Municipal
                            <INPUT id="abate" name="abate" type="radio" value="2" <% if (TipoAbate) = 2 then%> checked <% end if%>>Estadual
                            <INPUT id="abate" name="abate" type="radio" value="3" <% if (TipoAbate) = 3 then%> checked <% end if%>>Federal
							<INPUT id="abate" name="abate" type="radio" value="4" <% if (TipoAbate) = 3 then%> checked <% end if%>>SISBI/POA
							<br /> <br>
                            <INPUT id="abate" name="abate" type="radio" value="4" <% if (TipoAbate) = 4 then%> checked <% end if%>>Na Propriedade &nbsp;
                            <INPUT id="abate" name="abate" type="radio" value="5" <% if (TipoAbate) = 5 then%> checked <% end if%>>N&atilde;o Abate &nbsp;
                            <INPUT id="abate" name="abate" type="radio" value="6" <% if (TipoAbate) = 6 then%> checked <% end if%>>Outros 
                        </td>
					</tr>
                    <tr>
                        <td colspan="4">
                            15 - Vacina&ccedil;&atilde;o Regular: <br>
                        	<INPUT id="vacinacao_regular" name="vacinacao_regular" type="radio" onClick="fluxo(0,'vacinacao_regular_esp')" value="0" <% if (VacinacaoRegular) = 0 then%> checked <% end if%>>N&atilde;o
                            <INPUT id="vacinacao_regular" name="vacinacao_regular" type="radio" onClick="fluxo(1,'vacinacao_regular_esp')" value="1" <% if (VacinacaoRegular) = 1 then%> checked <% end if%>>Sim 
                            - Quais: <input name="vacinacao_regular_esp" class="text" id="vacinacao_regular_esp" size="78" maxlength="255" value="<%=(QuaisVacinacaoRegular)%>" onKeyPress="this.value = this.value.toUpperCase()" onChange="this.value = this.value.toUpperCase()" >
                        </td>
					</tr>
                    <tr>
                        <td colspan="4">
                            16 - Vermifuga&ccedil;&atilde;o Regular: <br>
                        	<INPUT id="vermifugacao" name="vermifugacao" type="radio" value="0" onClick="Verificar_vermifugacao_frequencia()" <% if (VermifugacaoRegular) = 0 then%> checked <% end if%>>N&atilde;o 
                            <INPUT id="vermifugacao" name="vermifugacao" type="radio" value="1" onClick="Verificar_vermifugacao_frequencia()" <% if (VermifugacaoRegular) = 1 then%> checked <% end if%>>Sim 
                            - Frequ&ecirc;ncia: 
                            <INPUT id="vermifugacao_frequencia" name="vermifugacao_frequencia" type="radio" value="1" onClick="Verificar_vermifugacao_frequencia()"  <% if (vermifugacaofrequencia) = 1 then%> checked <% end if%>>01 por Ano 
                            <INPUT id="vermifugacao_frequencia" name="vermifugacao_frequencia" type="radio" value="2" onClick="Verificar_vermifugacao_frequencia()"  <% if (vermifugacaofrequencia) = 2 then%> checked <% end if%>>02 por Ano 
                            <INPUT id="vermifugacao_frequencia" name="vermifugacao_frequencia" type="radio" value="3" onClick="Verificar_vermifugacao_frequencia()"  <% if (vermifugacaofrequencia) = 3 then%> checked <% end if%>>03 por Ano 
                            <INPUT id="vermifugacao_frequencia" name="vermifugacao_frequencia" type="radio" value="4" onClick="Verificar_vermifugacao_frequencia()"  <% if (vermifugacaofrequencia) = 4 then%> checked <% end if%>>04 por Ano 
                        </td>
					</tr>

                    <tr>
                        <td colspan="4">
                            17 - Tipo de Instala&ccedil;&otilde;es: <br>
                            <INPUT id="instalacoes" name="instalacoes" type="radio" value="1" <% if (TipoInstalacao) = 1 then%> checked <% end if%>>Alvenaria
                            <INPUT id="instalacoes" name="instalacoes" type="radio" value="2" <% if (TipoInstalacao) = 2 then%> checked <% end if%>>Madeira
                            <INPUT id="instalacoes" name="instalacoes" type="radio" value="3" <% if (TipoInstalacao) = 3 then%> checked <% end if%>>Metalica
                            <INPUT id="instalacoes" name="instalacoes" type="radio" value="5" <% if (TipoInstalacao) = 5 then%> checked <% end if%>>Mista
                        </td>
					</tr>
                
                    <tr>
                        <td colspan="4">
                             18 - Respons&aacute;vel T&eacute;cnico: 
                               <input name="resp_tecnico" class="text" id="resp_tecnico" size="75" maxlength="255" value="<%=(NomeRTResposavel)%>"  onKeyPress="this.value = this.value.toUpperCase()" onChange="this.value = this.value.toUpperCase()"  > <br>
                        </td>
                    </tr>
                        <td colspan="4">
                             19 - Respons&aacute;vel Pelas Informa&ccedil;&otilde;es: 
                               <input name="resp_info" class="text" id="resp_info" size="67" maxlength="255" value="<%=(NomeResponsavelInformacaoes)%>"  onKeyPress="this.value = this.value.toUpperCase()" onChange="this.value = this.value.toUpperCase()"  > <br>
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
                            <input id="bt_cadastrar" name="bt_cadastrar" type="submit" value="<%IF Existe = 1 THEN%>Alterar<%ELSE%>Cadastrar<%END IF%>" onClick="<%IF Existe = 1 THEN%>alterar('<%=idSuideos%>','<%=CpfProdutor%>', '<%=CodINCRA%>');<%ELSE%>cadastrar();<%END IF%>" class="button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="login1.asp"><input id="bt_Fechar" name="bt_Fechar" type="button" value="  Fechar  " class="button" onClick="javaScript:window.close();"></a>
                        </td>
                	</tr>
				</table>
            
<%'
 'rs.Close
 'Set rs = Nothing
'call fechaConexao

%>

            <br />

</div>
    </form>

</body>
</html>