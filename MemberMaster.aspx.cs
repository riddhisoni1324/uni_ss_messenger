using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class MemberMaster : System.Web.UI.Page
{
    SqlCommand cmd, insert_otp_cmd; string cs; SqlDataReader rdr; int j = 0; int OTP; string get_OTP, set_OTP;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("TypeMaster.aspx");
    }
    //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    var s = DropDownList1.SelectedItem.Value;
    //    Response.Write("select is "+s);
    //        ListItem li = new ListItem();

    //        DropDownList2.Items.Clear();
    //        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    //        SqlConnection con = new SqlConnection(cs);
    //        con.Open();
    //        cmd = new SqlCommand("select * from categorymaster where typeid=@tid", con);
    //        cmd.Parameters.Add("@tid", s);
    //        cmd.Connection = con;
    //        rdr = cmd.ExecuteReader();

    //        if (rdr != null)
    //        {
    //            while (rdr.Read())
    //            {
    //                j++;
    //                li.Text = rdr.GetString(2);
    //                li.Value = rdr[0].ToString();
    //                Response.Write(li.Text+"\n");
    //                DropDownList2.Items.Add(li.Text);
    //            }
    //        }
    //        con.Close();


    //}
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListBox2.Items.Clear();

        string message = "";
        foreach (ListItem item in ListBox1.Items)
        {

            if (item.Selected)
            {
                message += item.Text + " " + item.Value + "\\n";
                ListItem li = new ListItem();

                //ListBox2.Items.Clear();
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                con.Open();
                //select * from CategoryMaster inner join TypeMaster on CategoryMaster.TypeId=TypeMaster.TypeId
                cmd = new SqlCommand("select * from categorymaster inner join TypeMaster on CategoryMaster.TypeId=TypeMaster.TypeId where CategoryMaster.TypeId=@tid", con);
                cmd.Parameters.Add("@tid", item.Value);
                cmd.Connection = con;
                rdr = cmd.ExecuteReader();

                if (rdr != null)
                {
                    while (rdr.Read())
                    {
                        j++;
                        li.Text = rdr.GetString(2) + "-" + rdr.GetString(7);
                        li.Value = rdr[0].ToString();
                        Response.Write(li.Text + "\n");
                        ListBox2.Items.Add(li.Text);
                    }
                }
                con.Close();

            }
        }


        //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
    }

}