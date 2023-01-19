
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


