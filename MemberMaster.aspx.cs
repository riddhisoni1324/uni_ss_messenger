using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
public partial class MemberMaster : System.Web.UI.Page
{
    SqlCommand cmd, insert_otp_cmd; string cs; SqlDataReader rdr; int j = 0; int OTP; string get_OTP, set_OTP;
    SqlDataAdapter dadapter; DataSet dset; PagedDataSource adsource;
    string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    int pos; SqlDataReader dr1; ArrayList arrName = new ArrayList();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.SetActiveView(View1);

            this.ViewState["vs"] = 0;


        }
        pos = (int)this.ViewState["vs"];
        databind();


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
                cmd = new SqlCommand("select * from categorymaster inner join TypeMaster on CategoryMaster.TypeId=TypeMaster.TypeId where categorymaster.typeid=@tid ", con);
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
                        //j++;
                        //   li.Text = rdr.GetString(2) + "-" + rdr.GetString(7);
                        li.Text = rdr.GetString(2);
                        li.Value = rdr[0].ToString();
                       // Response.Write(li.Text + "\n");
                        ListBox2.Items.Add(li);
                        //ListBox2.DataSource = dt;
                        //ListBox2.DataTextField = "categorydesc";
                        //ListBox2.DataValueField = "categoryid";
                        //ListBox2.DataBind();
                    }
                }
                con.Close();

            }
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (h_id.Text == "fl")
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('insert.');", true);
            if (ListBox2.Items.Count > 0)
            {
                for (int i = 0; i < ListBox2.Items.Count; i++)
                {
                    if (ListBox2.Items[i].Selected)
                    {
                        string selectedItem1 = ListBox2.Items[i].Value;
                       // Response.Write("val is " + selectedItem1);

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
                                int c_id = Convert.ToInt32(rdr.GetDecimal(0));
                                int t_id = Convert.ToInt32(rdr.GetDecimal(1));
                               // Response.Write("cat is :" + c_id + "typeid : " + t_id);
                                SqlCommand insert_mem_type;
                                string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                                SqlConnection con2 = new SqlConnection(cs2);
                                con2.Open();
                                insert_mem_type = new SqlCommand("INSERT INTO Membertype (MemberId,TypeID,CategoryID) VALUES(@MemberId,@TypeID,@CategoryID)", con2);
                                insert_mem_type.Parameters.Add("@MemberId", t_mem_login.Text);
                                insert_mem_type.Parameters.Add("@TypeID", t_id);
                                insert_mem_type.Parameters.Add("@CategoryID", c_id);

                                if ((con2.State & ConnectionState.Open) > 0)
                                {
                                    //Response.Write("Connection OK!");
                                    int i1 = insert_mem_type.ExecuteNonQuery();
                                    if (i1 != 0)
                                    {
                                        // Response.Write(i);
                                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Type Added Succesfully.');", true);
                                    }
                                }
                                else
                                {
                                    con2.Close();
                                }


                            }
                        }
                        
                        con.Close();

                    }
                }
            }


            SqlCommand insert_mem;
            string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con1 = new SqlConnection(cs1);
            con1.Open();
            insert_mem = new SqlCommand("INSERT INTO MemberMaster (MemberName,MemberDesc,Address1,Address2,PinCode,Contact1,Contact2,Contact3,EmailID,LoginID,LoginPass) VALUES(@MemberName,@MemberDesc,@Address1,@Address2,@PinCode,@Contact1,@Contact2,@Contact3,@EmailID,@LoginID,@LoginPass)", con1);
            // insert_mem.Parameters.AddWithValue("@MemberName", t_mem_name.Text);
            insert_mem.Parameters.Add("@MemberName", t_mem_name.Text);
            insert_mem.Parameters.Add("@MemberDesc", t_mem_desc.Text);
            insert_mem.Parameters.Add("@Address1", t_mem_add1.Text);
            insert_mem.Parameters.Add("@Address2", t_mem_add2.Text);
            insert_mem.Parameters.Add("@PinCode", t_mem_pin.Text);
            insert_mem.Parameters.Add("@Contact1", t_mem_con1.Text);
            insert_mem.Parameters.Add("@Contact2", t_mem_con2.Text);
            insert_mem.Parameters.Add("@Contact3", t_mem_con3.Text);
            insert_mem.Parameters.Add("@EmailID", t_mem_email.Text);
            insert_mem.Parameters.Add("@LoginID", t_mem_login.Text);
            insert_mem.Parameters.Add("@LoginPass", t_mem_loginpass.Text);
            if ((con1.State & ConnectionState.Open) > 0)
            {
                //Response.Write("Connection OK!");
                int i = insert_mem.ExecuteNonQuery();
                if (i != 0)
                {
                    // Response.Write(i);
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Type Added Succesfully.');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('There is some problem try after sometime.');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('There is some problem try after sometime.');", true);
            }
            con1.Close();
            databind();
            MultiView1.SetActiveView(View1);
            
        }

        else
        {

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('update.');", true);
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("update MemberMaster set MemberName=@MemberName,memberdesc=@memberdesc,Address1=@Address1,Address2=@Address2,PinCode=@PinCode,Contact1=@Contact1,Contact2=@Contact2,Contact3=@Contact3,EmailID=@EmailID,LoginPass=@LoginPass where LoginId=@LoginId", con);


            cmd.Parameters.Add("@MemberName", t_mem_name.Text);
            cmd.Parameters.Add("@MemberDesc", t_mem_desc.Text);
            cmd.Parameters.Add("@Address1", t_mem_add1.Text);
            cmd.Parameters.Add("@Address2", t_mem_add2.Text);
            cmd.Parameters.Add("@PinCode", t_mem_pin.Text);
            cmd.Parameters.Add("@Contact1", t_mem_con1.Text);
            cmd.Parameters.Add("@Contact2", t_mem_con2.Text);
            cmd.Parameters.Add("@Contact3", t_mem_con3.Text);
            cmd.Parameters.Add("@EmailID", t_mem_email.Text);
            cmd.Parameters.Add("@LoginID", t_mem_login.Text);
            cmd.Parameters.Add("@LoginPass", t_mem_loginpass.Text);
            if ((con.State & ConnectionState.Open) > 0)
            {
                //Response.Write("Connection OK!");
                int i = cmd.ExecuteNonQuery();
                if (i != 0)
                {
                    // Response.Write(i);
                    //  Response.Write("row inserted");
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('member Updated Succesfully.');", true);
                    con.Close();
                }
                else
                {
                    //Response.Write("row not inserted");
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('There is some problem try after sometime.');", true);
                }

            }
            else
            {
                // Response.Write("Connection no good!");
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('There is some problem try after sometime.');", true);
            }
            MultiView1.SetActiveView(View1);
            databind();
        }

    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        IEnumerator ir = ListBox1.Items.GetEnumerator();
        while (ir.MoveNext())
        {
            ListItem li = (ListItem)ir.Current;
            Response.Write(" " + li.Text + "." + li.Value);
            if (li.Value == "13" || li.Value == "14")
            {
                li.Selected = true;
                Response.Write("......." + li.Text);

            }

        }

        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        //select * from CategoryMaster inner join TypeMaster on CategoryMaster.TypeId=TypeMaster.TypeId
        cmd = new SqlCommand("select * from categorymaster  inner join TypeMaster on CategoryMaster.TypeId=TypeMaster.TypeId", con);
        //cmd.Parameters.Add("@tid", item.Value);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        cmd.Connection = con;
        rdr = cmd.ExecuteReader();
        ListItem li1 = new ListItem();

        int j = 0;
        if (rdr != null)
        {
            while (rdr.Read())
            {
                j++;
                //   li.Text = rdr.GetString(2) + "-" + rdr.GetString(7);
                li1.Text = rdr.GetString(2);
                li1.Value = rdr[0].ToString();

                Response.Write(li1.Text + " " + li1.Value);
                ListBox2.Items.Add(li1);
            }
        }
        ListBox2.Items.Add(new ListItem("abc", "36"));
        for (int y = 0; y < ListBox2.Items.Count; y++)
        {

            string a = ListBox2.Items[y].Value;
            string b = "37";
            if (a.Equals(b)) { Response.Write("true"); ListBox2.Items[y].Selected = true; }
            else { Response.Write("false"); }


            Response.Write("in loop" + ListBox2.Items[y].Text + " " + ListBox2.Items[y].Value);
        }

        con.Close();



    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View1);
    }
    protected void b_add_type_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View2);
        h_id.Text = "fl";
        t_mem_name.Text = "";
        t_mem_desc.Text = "";
        t_mem_add1.Text = "";
        t_mem_add2.Text = "";
        t_mem_pin.Text = "";
        t_mem_con1.Text = "";
        t_mem_con2.Text = "";
        t_mem_con3.Text = "";
        t_mem_email.Text = "";
        t_mem_login.Text = "";
        t_mem_loginpass.Text = "";
        t_mem_login.Text = "";

    }

    protected void Edit_Command(object source, DataListCommandEventArgs e)
    {
        MultiView1.SetActiveView(View2);
        h_id.Text = "no";

        int ID = Convert.ToInt32(e.CommandArgument);
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM MemberMaster where MemberId=@TypeId";
        cmd.Parameters.Add("@TypeId", ID);


        cmd.Connection = con1;
        SqlDataReader rdr;
        rdr = cmd.ExecuteReader();
        if (rdr != null)
        {
            while (rdr.Read())
            {
                t_mem_name.Text = rdr.GetString(2);
                t_mem_desc.Text = rdr.GetString(3);
                t_mem_add1.Text = rdr.GetString(4);
                t_mem_add2.Text = rdr.GetString(5);
                t_mem_pin.Text = rdr.GetString(6);
                t_mem_con1.Text = rdr.GetString(7);
                t_mem_con2.Text = rdr.GetString(8);
                t_mem_con3.Text = rdr.GetString(9);
                t_mem_email.Text = rdr.GetString(10);
                t_mem_login.Text = rdr.GetString(11);
                t_mem_loginpass.Text = rdr.GetString(12);
                t_mem_login.Text = rdr.GetString(11);

            }
        }



        databind();
    }

    public void databind()
    {
        dadapter = new SqlDataAdapter("select * from MemberMaster", connstring);
        dset = new DataSet();
        adsource = new PagedDataSource();
        dadapter.Fill(dset);
        adsource.DataSource = dset.Tables[0].DefaultView;
        adsource.PageSize = 25;
        adsource.AllowPaging = true;
        adsource.CurrentPageIndex = pos;
        btnfirst.Enabled = !adsource.IsFirstPage;
        btnprevious.Enabled = !adsource.IsFirstPage;
        btnlast.Enabled = !adsource.IsLastPage;
        btnnext.Enabled = !adsource.IsLastPage;
        DataList2.DataSource = adsource;
        DataList2.DataBind();
    }

    protected void btnfirst_Click(object sender, EventArgs e)
    {
        pos = 0;
        databind();
    }

    protected void btnprevious_Click(object sender, EventArgs e)
    {
        pos = (int)this.ViewState["vs"];
        pos -= 1;
        this.ViewState["vs"] = pos;
        databind();
    }

    protected void btnnext_Click(object sender, EventArgs e)
    {
        pos = (int)this.ViewState["vs"];
        pos += 1;
        this.ViewState["vs"] = pos;
        databind();
    }

    protected void btnlast_Click(object sender, EventArgs e)
    {
        pos = adsource.PageCount - 1;
        databind();
    }

}