<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PROGIII_TP8.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tp7</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
</head>
<body>
    <form  id="form1" runat="server" class="d-flex flex-column container-sm" role="search">
    <nav class="navbar navbar-expand-lg bg-body-tertiary ">
        <div class="container-sm ">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <asp:LinkButton class="nav-link" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Listado de sucursales</asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton class="nav-link" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Mostrar listado seleccionado</asp:LinkButton>
                </li>
            </ul>
        </div>
    </nav>
        <div class="d-flex col-md-6">
                    <a class="nav-link" href="#">
             
             </a>
             <asp:DropDownList ID="ddlExample" runat="server" CssClass="form-control w-50 " AutoPostBack="True" OnSelectedIndexChanged="ddlExample_SelectedIndexChanged">
                    <asp:ListItem Text="--provincia--" Value="1"></asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox class="form-control me-2" type="search" placeholder="Search" aria-label="Search"  ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Button class="btn btn-outline-success" ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" />

        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BDSucursalesConnectionString2 %>" SelectCommand="SELECT * FROM [Sucursal]"></asp:SqlDataSource>
        <br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Sucursal" DataSourceID="SqlDataSource1" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color: #FFFFFF;color: #284775;">NombreSucursal:
                    <asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' />
                    <br />DescripcionSucursal:
                    <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>' />
                    <br />
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="150px" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' Width="150px" />
                    <br />
                    <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("Id_Sucursal") %>' CommandName="botonSeleccionar" OnCommand="Button1_Command" Text="Seleccionar" />
                    <br /></td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color: #999999;">Id_Sucursal:
                    <asp:Label ID="Id_SucursalLabel1" runat="server" Text='<%# Eval("Id_Sucursal") %>' />
                    <br />NombreSucursal:
                    <asp:TextBox ID="NombreSucursalTextBox" runat="server" Text='<%# Bind("NombreSucursal") %>' />
                    <br />DescripcionSucursal:
                    <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
                    <br />Id_HorarioSucursal:
                    <asp:TextBox ID="Id_HorarioSucursalTextBox" runat="server" Text='<%# Bind("Id_HorarioSucursal") %>' />
                    <br />Id_ProvinciaSucursal:
                    <asp:TextBox ID="Id_ProvinciaSucursalTextBox" runat="server" Text='<%# Bind("Id_ProvinciaSucursal") %>' />
                    <br />DireccionSucursal:
                    <asp:TextBox ID="DireccionSucursalTextBox" runat="server" Text='<%# Bind("DireccionSucursal") %>' />
                    <br />URL_Imagen_Sucursal:
                    <asp:TextBox ID="URL_Imagen_SucursalTextBox" runat="server" Text='<%# Bind("URL_Imagen_Sucursal") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">NombreSucursal:
                    <asp:TextBox ID="NombreSucursalTextBox" runat="server" Text='<%# Bind("NombreSucursal") %>' />
                    <br />DescripcionSucursal:
                    <asp:TextBox ID="DescripcionSucursalTextBox" runat="server" Text='<%# Bind("DescripcionSucursal") %>' />
                    <br />Id_HorarioSucursal:
                    <asp:TextBox ID="Id_HorarioSucursalTextBox" runat="server" Text='<%# Bind("Id_HorarioSucursal") %>' />
                    <br />Id_ProvinciaSucursal:
                    <asp:TextBox ID="Id_ProvinciaSucursalTextBox" runat="server" Text='<%# Bind("Id_ProvinciaSucursal") %>' />
                    <br />DireccionSucursal:
                    <asp:TextBox ID="DireccionSucursalTextBox" runat="server" Text='<%# Bind("DireccionSucursal") %>' />
                    <br />URL_Imagen_Sucursal:
                    <asp:TextBox ID="URL_Imagen_SucursalTextBox" runat="server" Text='<%# Bind("URL_Imagen_Sucursal") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color: #E0FFFF;color: #333333;">NombreSucursal:
                    <asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' />
                    <br />DescripcionSucursal:
                    <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>' />
                    <br />&nbsp;<asp:ImageButton ID="ImageButton1" runat="server" Height="150px" ImageUrl='<%# Eval("URL_Imagen_Sucursal") %>' Width="150px" />
                    <br />
                    <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("Id_Sucursal") %>' CommandName="botonSeleccionar" OnCommand="Button1_Command" Text="Seleccionar" />
                    <br /></td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">Id_Sucursal:
                    <asp:Label ID="Id_SucursalLabel" runat="server" Text='<%# Eval("Id_Sucursal") %>' />
                    <br />NombreSucursal:
                    <asp:Label ID="NombreSucursalLabel" runat="server" Text='<%# Eval("NombreSucursal") %>' />
                    <br />DescripcionSucursal:
                    <asp:Label ID="DescripcionSucursalLabel" runat="server" Text='<%# Eval("DescripcionSucursal") %>' />
                    <br />Id_HorarioSucursal:
                    <asp:Label ID="Id_HorarioSucursalLabel" runat="server" Text='<%# Eval("Id_HorarioSucursal") %>' />
                    <br />Id_ProvinciaSucursal:
                    <asp:Label ID="Id_ProvinciaSucursalLabel" runat="server" Text='<%# Eval("Id_ProvinciaSucursal") %>' />
                    <br />DireccionSucursal:
                    <asp:Label ID="DireccionSucursalLabel" runat="server" Text='<%# Eval("DireccionSucursal") %>' />
                    <br />URL_Imagen_Sucursal:
                    <asp:Label ID="URL_Imagen_SucursalLabel" runat="server" Text='<%# Eval("URL_Imagen_Sucursal") %>' />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>

        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
