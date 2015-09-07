using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class TypeMaster : System.Web.UI.Page
{
    string cs1; SqlCommand insert_type;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void btn_add_type(object sender, EventArgs e)
    {
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();
        insert_type = new SqlCommand("INSERT INTO TypeMaster (TypeDesc,UpdatedBy) VALUES(@TypeDesc,@UpdatedBy)", con1);
        insert_type.Parameters.Add("@TypeDesc", t_type_desc.Text);
        insert_type.Parameters.Add("@UpdatedBy", t_type_update.Text);
        if ((con1.State & ConnectionState.Open) > 0)
        {
            Response.Write("Connection OK!");
            int i = insert_type.ExecuteNonQuery();
            if (i != 0)
            {
                Response.Write(i);
                Response.Write("row inserted");
            }
            else
            {
                Response.Write("row not inserted");
            }
        }
        else
        {
            Response.Write("not conncted");
        }

        con1.Close();
    }
}