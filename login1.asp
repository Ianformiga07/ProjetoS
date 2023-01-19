<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file ="lib/Conexao.asp"-->
<!DOCTYPE html>
<%
Existe = 0
call abreConexao
sql = "Select TOP (200)* From TB_Produtor INNER JOIN TB_Propriedade ON TB_Propriedade.CNPJCPFProprietario = TB_Produtor.CNPJCPFProdutor"
set rs = conn.execute(sql)
Session("CPF_Usu") = replace(replace(request.form("cpf"),".",""),"-","")

%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.2.1/dist/sweetalert2.min.js"></script>

<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords">
       
</head>

<body>
        <div class="page-wrapper" style="min-height: 250px;">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb bg-white">
                <div class="row align-items-center">
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="white-box">
                            <h3 class="box-title">Cadastro</h3>
							
	
<div class="container">
<form method=post>
  <div class="table-responsive">          
  <table class="table" border="1" align="center">
    <thead>
      <%if rs.eof then%>
  <tr><td>Não Existe Nenhum Registro na base de Dados!</td></tr>
  <%else%>
      <tr>
        <th>#</th>
        <th>CPF</th>
        <th>Nome Completo</th>
        <th>Codigo Incra</th>	
      </tr>
    </thead>
    <tbody>
<%
do while not rs.eof
%>
      <tr>
        <td>
 <a href="frm_Cad_Alter_Suino.asp?INCRAProp=<%=rs("INCRAProp")%>&CNPJCPFProdutor=<%=rs("CNPJCPFProdutor")%>">
 <img src="imagens/alt3.png" width="30">
        </a>		
		</td>
        <td><%=rs("CNPJCPFProdutor")%></td>
        <td><%=rs("NomeProdutor")%></td>
        <td><%=rs("INCRAProp")%></td>
      </tr>
	  <%

rs.movenext
loop
end if
call fechaConexao

%>
    </tbody>
  </table>

  </div>


</form>

</div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center"> 2021 © <a
                    href="https://www.wrappixel.com/">ADAPEC-TO</a>
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/app-style-switcher.js"></script>
    <!--Wave Effects -->
    <script src="js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="js/custom.js"></script>
</body>

</html>