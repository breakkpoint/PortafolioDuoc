﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBibliotecas
{
    public partial class AdmViajes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            llenarLabelTitulo();
        }


        public void llenarLabelTitulo()
        {

            Bibliotecas.Negocio.Viaje ve = new Bibliotecas.Negocio.Viaje();
            ve.Rut = Session["CLAVE"].ToString();

            if (ve.HayViajes() == false)
            {
                lbTitulo.Text = "NO HAY VIAJES DISPONIBLES";
                btnExportar.Visible = false;
            }
            else
            {
                lbTitulo.Text = "ESTOS SON TODOS LOS VIAJES REGISTRADOS";
                btnExportar.Visible = true;
            }


        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            System.IO.StringWriter sw = new System.IO.StringWriter(sb);
            HtmlTextWriter htw = new HtmlTextWriter(sw);

            Page page = new Page();
            System.Web.UI.HtmlControls.HtmlForm form = new System.Web.UI.HtmlControls.HtmlForm();


            GridView1.AllowPaging = false;
            GridView1.DataBind();
            GridView1.EnableViewState = false;



            // Deshabilitar la validación de eventos, sólo asp.net 2
            page.EnableEventValidation = false;

            // Realiza las inicializaciones de la instancia de la clase Page que requieran los diseñadores RAD.
            page.DesignerInitialize();

            page.Controls.Add(form);
            form.Controls.Add(GridView1);

            page.RenderControl(htw);

            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/xls";
            Response.AddHeader("Content-Disposition", "attachment;filename=TodosViajes.xls");
            Response.Charset = "UTF-8";
            Response.ContentEncoding = System.Text.Encoding.Default;
            Response.Write(sb.ToString());
            Response.End();
        }
    }
}