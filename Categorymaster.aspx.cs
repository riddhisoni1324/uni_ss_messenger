using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Categorymaster : System.Web.UI.Page
{
    SqlCommand insert_cat;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Response.Write("second" + DropDownList2.SelectedItem.Value +" ");
    }
   
      
    protected void btn_add_cat(object sender, EventArgs e)
    {
        var s = DropDownList2.SelectedItem.Value;
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();
        insert_cat = new SqlCommand("INSERT INTO Categorymaster (TypeID,CategoryDesc,UpdatedBy) VALUES(@TypeID,@CategoryDesc,@UpdatedBy)", con1);
        insert_cat.Parameters.Add("@TypeId", s);
        insert_cat.Parameters.Add("@CategoryDesc", t_cat_desc.Text);
        insert_cat.Parameters.Add("@UpdatedBy", t_cat_update.Text);
        if ((con1.State & ConnectionState.Open) > 0)
        {
            //Response.Write("Connection OK!");
            int i = insert_cat.ExecuteNonQuery();
            if (i != 0)
            {
                Response.Write(i);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Category Added Succesfully.');", true);
                //  Response.Write("row inserted");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('There is some problem try after sometime.');", true);
                //  Response.Write("row not inserted");
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('There is some problem try after sometime.');", true);
            //Response.Write("not conncted");
        }

        t_cat_desc.Text = " ";
        t_cat_update.Text = "";

        con1.Close();
       
        Response.Write("selected type is" + s);
    }
}