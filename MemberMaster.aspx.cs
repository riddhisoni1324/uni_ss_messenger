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
                        //li.Text = rdr.GetString(2) + "-" + rdr.GetString(7);
                        //li.Value = rdr[0].ToString();
                        //Response.Write(li.Text + "\n"+li.Value);
                        //ListBox2.Items.Add(li.Text);

                        ListBox2.Items.Add(rdr["categorydesc"].ToString());
                        ListBox2.DataSource = rdr;
                        ListBox2.DataTextField = rdr["categorydesc"].ToString();
                        ListBox2.DataValueField = rdr["categoryid"].ToString();
                        //ListBox2.DataBind();
                    }
                }
                con.Close();

            }
        }


        //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (ListBox1.Items.Count > 0)
        {
            for (int i = 0; i < ListBox1.Items.Count; i++)
            {
                if (ListBox1.Items[i].Selected)
                {
                    string selectedItem = ListBox1.Items[i].Value;
                    //insert command
                    Response.Write(selectedItem);
                }
            }
        }

        if (ListBox2.Items.Count > 0)
        {
            for (int i = 0; i < ListBox2.Items.Count; i++)
            {
                if (ListBox2.Items[i].Selected)
                {
                    string selectedItem1 = ListBox2.Items[i].Value;
                    //insert command
                    Response.Write(selectedItem1);
                }
            }
        }


            //SqlCommand insert_mem;
            //string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //SqlConnection con1 = new SqlConnection(cs1);
            //con1.Open();
            //insert_mem = new SqlCommand("INSERT INTO MemberMaster (MemberName,MemberDesc,Address1,Address2,PinCode,Contact1,Contact2,Contact3,EmailID,LoginID,LoginPass) VALUES(@MemberName,@MemberDesc,@Address1,@Address2,@PinCode,@Contact1,@Contact2,@Contact3,@EmailID,@LoginID,@LoginPass)", con1);
            //insert_mem.Parameters.Add("@MemberName", t_mem_name.Text);
            //insert_mem.Parameters.Add("@MemberDesc", t_mem_desc.Text);
            //insert_mem.Parameters.Add("@Address1", t_mem_add1.Text);
            //insert_mem.Parameters.Add("@Address2", t_mem_add2.Text);
            //insert_mem.Parameters.Add("@PinCode", t_mem_pin.Text);
            //insert_mem.Parameters.Add("@Contact1", t_mem_con1.Text);
            //insert_mem.Parameters.Add("@Contact2", t_mem_con2.Text);
            //insert_mem.Parameters.Add("@Contact3", t_mem_con3.Text);
            //insert_mem.Parameters.Add("@EmailID", t_mem_email.Text);
            //insert_mem.Parameters.Add("@LoginID", t_mem_login.Text);
            //insert_mem.Parameters.Add("@LoginPass", t_mem_loginpass.Text);
            //if ((con1.State & ConnectionState.Open) > 0)
            //{
            //    //Response.Write("Connection OK!");
            //    int i = insert_mem.ExecuteNonQuery();
            //    if (i != 0)
            //    {
            //        // Response.Write(i);
            //        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Type Added Succesfully.');", true);
            //    }
            //    else
            //    {
            //        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('There is some problem try after sometime.');", true);
            //    }
            //}
            //else
            //{
            //    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('There is some problem try after sometime.');", true);
            //}
            //con1.Close();
            
    }
}