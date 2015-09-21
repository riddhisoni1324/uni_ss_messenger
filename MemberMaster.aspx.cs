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
        //ListBox1.SelectedValue = "1";
        //ListBox1.SelectedValue = "2";
        //ListBox1.SelectAll();
        for (int i = 0; i < 2; i++) {
            ListBox1.SelectedValue = i.ToString();
            
        }
       
         
    
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("TypeMaster.aspx");
    }
    
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
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                cmd.Connection = con;
                rdr = cmd.ExecuteReader();

                if (rdr != null)
                {
                    while (rdr.Read())
                    {
                        ListBox2.DataSource = dt;
                        ListBox2.DataTextField = "categorydesc";
                        ListBox2.DataValueField = "categoryid";
                        ListBox2.DataBind();
                    }
                }
                con.Close();

            }
        }

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

                    string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    SqlConnection con = new SqlConnection(cs);
                    con.Open();
                    cmd = new SqlCommand("select * from categorymaster where categoryid=@cid", con);
                    cmd.Parameters.Add("@cid", selectedItem1);
                    cmd.Connection = con;
                    rdr = cmd.ExecuteReader();

                    if (rdr != null)
                    {
                        while (rdr.Read())
                        {
                            int c_id = Convert.ToInt32(rdr.GetDecimal(1));
                            Response.Write("cat is :" + selectedItem1 +"typeid : "+c_id);

                        }
                    }
                    con.Close();

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