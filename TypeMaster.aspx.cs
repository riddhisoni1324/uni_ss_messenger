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
    string cs1; SqlCommand insert_type; SqlDataReader rdr;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
           // BindFields();
        }

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
            //Response.Write("Connection OK!");
            int i = insert_type.ExecuteNonQuery();
            if (i != 0)
            {
                Response.Write(i);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Type Added Succesfully.');", true);
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
        t_type_desc.Text = "";
        t_type_update.Text = " ";

        con1.Close();
    }




    protected void Edit_Command(object source, DataListCommandEventArgs e)
    {
        int ID = Convert.ToInt32(e.CommandArgument);

        Response.Write("hello efit clicked" + ID + "..");
        //btnBack.Text = "Cancel";
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();

        SqlCommand cmd = new SqlCommand();

        // SqlCommand cmd = new SqlCommand("SELECT * FROM TypeMaster where typeid=1",con1);
        cmd.CommandText = "SELECT * FROM TypeMaster where typeid=@ID";
        cmd.Parameters.Add("@ID", ID);


        cmd.Connection = con1;
        rdr = cmd.ExecuteReader();
        int j = 0;
        if (rdr != null)
        {
            while (rdr.Read())
            {
                j++;
                // var myString = rdr.GetString(0); 
                //txtFacultyCode.Text = 1;
                t_type_id1.Text = rdr.GetDecimal(0).ToString();
                t_type_desc1.Text = rdr.GetString(1);
                Response.Write(t_type_desc.Text);
                   

            }
            Response.Write(" " + j + " ");
        }
    }




    protected void btnSave_Click(object sender, EventArgs e)
    {

        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(cs);
        con.Open();
        SqlCommand cmd = new SqlCommand("update TypeMaster set TypeDesc=@TypeDesc where TypeId=@TypeId", con);
        cmd.Parameters.Add("@TypeId", t_type_id1.Text);
        cmd.Parameters.Add("@Typedesc", t_type_desc1.Text);
        if ((con.State & ConnectionState.Open) > 0)
        {
            Response.Write("Connection OK!");
            int i = cmd.ExecuteNonQuery();
            if (i != 0)
            {
                Response.Write(i);
                Response.Write("row inserted");
                con.Close();
            }
            else
            {
                Response.Write("row not inserted");
            }

        }
        else
        {
            Response.Write("Connection no good!");
        }
    }
}