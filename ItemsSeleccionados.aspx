<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemsSeleccionados.aspx.cs" Inherits="PROGIII_TP8.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tp7</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
</head>
<body>
   
    <div class="container-sm">
        
    <form id="form1" runat="server">
         <nav class="navbar navbar-expand-lg bg-body-tertiary ">
      
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
               <li class="nav-item">
                    <asp:LinkButton class="nav-link" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Listado de sucursales</asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton class="nav-link" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Mostrar listado seleccionado</asp:LinkButton>
                </li>
            </ul>
   
    </nav>
        <h1>Sucursales Seleccionados</h1>
        <div>
            <asp:GridView class="table col-10" ID="GridView1" runat="server">
            </asp:GridView>

        </div>
    </form>
    </div>
</body>
</html>
