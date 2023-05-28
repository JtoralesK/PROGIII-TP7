using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PROGIII_TP8
{
    public class Conexion
    {
            string Ruta = @"Data Source=DESKTOP-QJ5T58J\SQLEXPRESS;Initial Catalog=BDSucursales;Integrated Security=True";
            public bool HuboError = false;
            public string MensajeDeError = "";
            public string DetalleError = "";
            protected SqlConnection conexion;
            public Conexion()
            {
                this.conexion = new SqlConnection(Ruta);
            }
            public DataSet ObtenerDatos(string consulta, Dictionary<string, object> parametros = null)
            {
                DataSet dataSet = new DataSet();
                try
                {

                    using (SqlCommand command = new SqlCommand(consulta, this.conexion))
                    {
                        if (parametros != null)
                        {
                            foreach (KeyValuePair<string, object> parametro in parametros)
                            {
                                command.Parameters.AddWithValue(parametro.Key, parametro.Value);
                            }
                        }
                        using (SqlDataAdapter dataAdapter = new SqlDataAdapter(command))
                        {
                            dataAdapter.Fill(dataSet, "root");
                        }
                    }

                }
                catch (Exception ex)
                {
                    // Manejar la excepción aquí, por ejemplo:
                    HuboError = true;
                    MensajeDeError = ("Error al obtener datos de la base de datos.");
                    DetalleError = ex.ToString();
                }
                return dataSet;
            }



            public void CerrarConexion()
            {
                if (this.conexion != null)
                    this.conexion.Close();
            }
            public int EjecutarTransaccion(string consulta, Dictionary<string, object> parametros = null)
            {
                try
                {

                    using (SqlCommand comando = new SqlCommand(consulta, this.conexion))
                    {
                        if (parametros != null)
                        {
                            foreach (KeyValuePair<string, object> parametro in parametros)
                            {
                                comando.Parameters.AddWithValue(parametro.Key, parametro.Value);
                            }
                        }
                        conexion.Open();
                        int filasAfectadas = comando.ExecuteNonQuery();
                        return filasAfectadas;
                    }

                }
                catch (Exception ex)
                {
                    // Manejar la excepción aquí, por ejemplo:
                    HuboError = true;
                    MensajeDeError = ("Error al obtener datos de la base de datos.");
                    DetalleError = ex.ToString();
                    return 0;
                }
            }
        }
    }
