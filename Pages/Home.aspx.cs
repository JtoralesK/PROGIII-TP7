using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROGIII_TP8
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                Conexion cn = new Conexion();
                DataSet dataset = cn.ObtenerDatos("select id_Provincia,DescripcionProvincia from Provincia");
                DataTable dt = dataset.Tables[0];
                foreach (DataRow row in dt.Rows)
                {
                    string id = row["id_Provincia"].ToString();
                    string descripcion = row["DescripcionProvincia"].ToString();
                    ddlExample.Items.Add(new ListItem(descripcion, id));
                }
                cn.CerrarConexion();
            }
        }

        protected DataTable crearTablaSeleccion()
        {
            DataTable TablaSeleccion = new DataTable();
            if (Session["TablaSeleccion"] == null)
            {
                // Definir columnas
                TablaSeleccion.Columns.Add("id_Sucursal", typeof(string));
                TablaSeleccion.Columns.Add("nombreSucursal", typeof(string));
                TablaSeleccion.Columns.Add("descripcionSucursal", typeof(string));
                Session["TablaSeleccion"] = TablaSeleccion;
            }
            else
            {
                TablaSeleccion = (DataTable)Session["TablaSeleccion"];
            }
            return TablaSeleccion;
        }
           

        protected bool registroRepetido(DataTable tabla,string variable1)
        {
            bool noExisteIdSucursal = false;
            foreach (DataRow row in tabla.Rows)
            {
                if (row["id_Sucursal"].ToString() == variable1)
                {
                    noExisteIdSucursal = true;
                    break;
                }
            }
            return noExisteIdSucursal;
        }
        protected void InsertaRow(DataSet dataset,string id_Sucursal)
        {
            string contenido = string.Empty;
            DataTable tabla = crearTablaSeleccion();
            DataTable registro1Tb = dataset.Tables[0];
            string  nombre, descripcion;
            foreach (DataRow row in registro1Tb.Rows)
            {
                nombre = row["nombreSucursal"].ToString();
                descripcion = row["descripcionSucursal"].ToString();
                contenido = "id:"+ id_Sucursal + ",nombre:"+nombre+",descripcion:"+descripcion;
                bool noExisteIdSucursal = registroRepetido(tabla, id_Sucursal);
                if (!noExisteIdSucursal)
                {
                    tabla.Rows.Add(id_Sucursal, nombre,descripcion);
                }
            }
            Label1.Text = contenido;
            Session["TablaSeleccion"] = tabla;
        }
        protected void Button1_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "botonSeleccionar")
            {
                String id_Sucursal = e.CommandArgument.ToString();
                Conexion cn = new Conexion();
                DataSet dataset = cn.ObtenerDatos("select id_Sucursal,nombreSucursal,descripcionSucursal FROM Sucursal where id_Sucursal=" + id_Sucursal);
                InsertaRow(dataset, id_Sucursal);
            }


        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/Home.aspx");

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ItemsSeleccionados.aspx");


        }

        protected void ddlExample_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedValue = Convert.ToInt32(ddlExample.SelectedValue);

            if (selectedValue > 0)
            {
                SqlDataSource1.SelectCommand = "select * from Sucursal where Id_ProvinciaSucursal="+selectedValue;
                Label1.Text = "item:" + ddlExample.SelectedValue;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string text = TextBox1.Text;
            SqlDataSource1.SelectCommand = "SELECT * FROM Sucursal WHERE NombreSucursal LIKE '"+ text+"%'";
        }
    }
}