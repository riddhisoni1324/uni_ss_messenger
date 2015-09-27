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
        Button1.Focus();
        if (!IsPostBack)
        {
            
            MultiView1.SetActiveView(View1);
            this.ViewState["vs"] = 0;
            Button1.Focus();
        }
        pos = (int)this.ViewState["vs"];
        databind();
    }

    //---display category according type is selected
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
                cmd = new SqlCommand("select * from categorymaster inner join TypeMaster on CategoryMaster.TypeId=TypeMaster.TypeId where CategoryMaster.TypeId=@tid ", con);
                cmd.Parameters.Add("@tid", item.Value);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                cmd.Connection = con;
                rdr = cmd.ExecuteReader();
                ListBox2.DataSource = rdr;
                ListBox2.DataTextField = "categorydesc";
                ListBox2.DataValueField = "categoryid";
                ListBox2.DataBind();
                //if (rdr != null)
                //{
                //    while (rdr.Read())
                //    {
                //        li.Text = rdr.GetString(2);
                //        li.Value = rdr[0].ToString();
                //        ListBox2.Items.Add(li);
                //    }
                //}
                con.Close();

            }
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //Button1.Focus();
        //Response.Write("button");
        //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('insersadasdt.');", true);
        ////--if it is in insert mode
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
                        //Response.Write("selct is "+selectedItem1);
                        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        SqlConnection con = new SqlConnection(cs);
                        con.Open();
                        cmd = new SqlCommand("select * from categorymaster where categoryid=@cid", con);
                        cmd.Parameters.Add("@cid", selectedItem1);
                        cmd.Connection = con;
                        rdr = cmd.ExecuteReader();
                        //---fetch category and type id and insert each in membertype table as pk membercode
                        if (rdr != null)
                        {
                            while (rdr.Read())
                            {
                                int c_id = Convert.ToInt32(rdr.GetDecimal(0));
                                int t_id = Convert.ToInt32(rdr.GetDecimal(1));
                                //Response.Write("cat is :" + c_id + "typeid : " + t_id);
                                SqlCommand insert_mem_type;
                                string cs2 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                                SqlConnection con2 = new SqlConnection(cs2);
                                con2.Open();
                                insert_mem_type = new SqlCommand("INSERT INTO Membertype (MemberId,TypeID,CategoryID) VALUES(@MemberId,@TypeID,@CategoryID)", con2);
                                insert_mem_type.Parameters.Add("@MemberId", t_mem_code.Text);
                                insert_mem_type.Parameters.Add("@TypeID", t_id);
                                insert_mem_type.Parameters.Add("@CategoryID", c_id);

                                if ((con2.State & ConnectionState.Open) > 0)
                                {
                                    int i1 = insert_mem_type.ExecuteNonQuery();
                                    if (i1 != 0)
                                    {
                                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Type Added Succesfully.');", true);
                                    }
                                }
                                else
                                {
                                    con2.Close();
                                }
                            }
                        }
                        //--end of insert in membertype
                        con.Close();

                    }//--end of cat list selected item
                }//--end of tot cat list count
            }//--end of cat list item > 0

            //insert rest of data 
            SqlCommand insert_mem;
            string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con1 = new SqlConnection(cs1);
            con1.Open();
            insert_mem = new SqlCommand("INSERT INTO MemberMaster (MemberName,MemberDesc,code,Address1,Address2,PinCode,Contact1,Contact2,Contact3,EmailID,LoginID,LoginPass) VALUES(@MemberName,@MemberDesc,@code,@Address1,@Address2,@PinCode,@Contact1,@Contact2,@Contact3,@EmailID,@LoginID,@LoginPass)", con1);
            insert_mem.Parameters.AddWithValue("@code", t_mem_code.Text);
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
                int i = insert_mem.ExecuteNonQuery();
                if (i != 0)
                {
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
            //insert done for rest of data
            databind();
            MultiView1.SetActiveView(View1);

        }
        //--end of insert mode
        //--else start of update mode

        else
        {
            //--delete member type data for perticular meber to update cat and type
            string cs6 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con6 = new SqlConnection(cs6);
            con6.Open();
            SqlCommand cmd1 = new SqlCommand("Delete from membertype where memberid=@mid", con6);
            cmd1.Parameters.Add("@mid", t_mem_code.Text);
            int del = cmd1.ExecuteNonQuery();
            con6.Close();
            //--delet done

            if (ListBox2.Items.Count > 0)
            {
                for (int i = 0; i < ListBox2.Items.Count; i++)
                {
                    if (ListBox2.Items[i].Selected)
                    {
                        string selectedItem1 = ListBox2.Items[i].Value;
                        //Response.Write("val is " + selectedItem1);
                        //---get cat and type according cat and insert into membertype
                        string cs9 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        SqlConnection con56 = new SqlConnection(cs9);
                        con56.Open();
                        SqlCommand cmd;
                        cmd = new SqlCommand("select * from categorymaster where categoryid=@cid", con56);
                        cmd.Parameters.Add("@cid", selectedItem1);
                        cmd.Connection = con56;
                        rdr = cmd.ExecuteReader();

                        if (rdr != null)
                        {
                            while (rdr.Read())
                            {
                                int c_id = Convert.ToInt32(rdr.GetDecimal(0));
                                int t_id = Convert.ToInt32(rdr.GetDecimal(1));
                                // Response.Write("cat is :" + c_id + "typeid : " + t_id);
                                SqlCommand insert_mem_type;
                                string cs29 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                                SqlConnection con29 = new SqlConnection(cs29);
                                con29.Open();
                                insert_mem_type = new SqlCommand("INSERT INTO Membertype (MemberId,TypeID,CategoryID) VALUES(@MemberId,@TypeID,@CategoryID)", con29);
                                insert_mem_type.Parameters.Add("@MemberId", t_mem_code.Text);
                                insert_mem_type.Parameters.Add("@TypeID", t_id);
                                insert_mem_type.Parameters.Add("@CategoryID", c_id);

                                if ((con29.State & ConnectionState.Open) > 0)
                                {
                                    int i1 = insert_mem_type.ExecuteNonQuery();
                                    if (i1 != 0)
                                    {
                                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Type Added Succesfully.');", true);
                                    }
                                }
                                else
                                {
                                    con29.Close();
                                }


                            }
                        }

                        con56.Close();

                    }
                }
            }

            //-------update another data
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('update.');", true);
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con7 = new SqlConnection(cs);
            con7.Open();
            SqlCommand cmd12 = new SqlCommand("update MemberMaster set MemberName=@MemberName,memberdesc=@memberdesc,Address1=@Address1,Address2=@Address2,PinCode=@PinCode,Contact1=@Contact1,Contact2=@Contact2,Contact3=@Contact3,EmailID=@EmailID,LoginPass=@LoginPass,code=@code where LoginId=@LoginId", con7);

            cmd12.Parameters.AddWithValue("@code", t_mem_code.Text);
            cmd12.Parameters.Add("@MemberName", t_mem_name.Text);
            cmd12.Parameters.Add("@MemberDesc", t_mem_desc.Text);
            cmd12.Parameters.Add("@Address1", t_mem_add1.Text);
            cmd12.Parameters.Add("@Address2", t_mem_add2.Text);
            cmd12.Parameters.Add("@PinCode", t_mem_pin.Text);
            cmd12.Parameters.Add("@Contact1", t_mem_con1.Text);
            cmd12.Parameters.Add("@Contact2", t_mem_con2.Text);
            cmd12.Parameters.Add("@Contact3", t_mem_con3.Text);
            cmd12.Parameters.Add("@EmailID", t_mem_email.Text);
            cmd12.Parameters.Add("@LoginID", t_mem_login.Text);
            cmd12.Parameters.Add("@LoginPass", t_mem_loginpass.Text);
            if ((con7.State & ConnectionState.Open) > 0)
            {
                int i = cmd12.ExecuteNonQuery();
                if (i != 0)
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('member Updated Succesfully.');", true);
                    con7.Close();
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
            MultiView1.SetActiveView(View1);

            //--update done
            databind();
        }

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
        t_mem_code.Text = " ";
        ListBox1.ClearSelection();
        ListBox2.ClearSelection();

    }

    protected void Edit_Command(object source, DataListCommandEventArgs e)
    {
        ListBox1.ClearSelection();
        ListBox2.ClearSelection();
        MultiView1.SetActiveView(View2);
        ListBox1.Items.Clear();
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
                t_mem_code.Text = Convert.ToInt32(rdr.GetDecimal(1)).ToString();
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

        ArrayList a3 = new ArrayList();
        ArrayList a1 = new ArrayList();

        using (SqlConnection sc5 = new SqlConnection(connstring))
        {
            SqlCommand smd = new SqlCommand("select * from membertype where memberid=@mid ", sc5);
            smd.Parameters.Add("@mid", t_mem_code.Text);

            sc5.Open();
            rdr = smd.ExecuteReader();
            if (rdr != null)
            {
                while (rdr.Read())
                {
                    string type_id = Convert.ToInt32(rdr.GetDecimal(1)).ToString();
                    string cat_id = Convert.ToInt32(rdr.GetDecimal(2)).ToString();
                    a3.Add(type_id);
                    a1.Add(cat_id);
                }

            }

        }

        string cs12 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con12 = new SqlConnection(cs12);
        con12.Open();
        SqlCommand cmd12 = new SqlCommand("select * from typemaster", con12);
        rdr = cmd12.ExecuteReader();
        ListBox1.DataTextField = "typedesc";
        ListBox1.DataValueField = "typeid";
        ListBox1.DataBind();
        con12.Close();

        ArrayList a4 = new ArrayList();
        //--bydefault selection of type
        foreach (string i1 in a3)
        {
            ListBox1.SelectedIndex = ListBox1.Items.IndexOf(ListBox1.Items.FindByValue(i1));
            a4.Add(ListBox1.SelectedIndex);
        }

        foreach (int i5 in a4)
        {
            ListBox1.Items[i5].Selected = true;
        }



        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        cmd = new SqlCommand("select * from categorymaster  inner join membertype on categorymaster.typeid=membertype.typeid where memberid=@mid ", con);
        cmd.Parameters.Add("@mid", t_mem_code.Text);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        cmd.Connection = con;
        rdr = cmd.ExecuteReader();
        ListBox2.DataSource = rdr;
        ListBox2.DataTextField = "categorydesc";
        ListBox2.DataValueField = "categoryid";
        ListBox2.DataBind();
        ArrayList a2 = new ArrayList();
        //--by default selection of category
        foreach (string i1 in a1)
        {
            ListBox2.SelectedIndex = ListBox2.Items.IndexOf(ListBox2.Items.FindByValue(i1));
            a2.Add(ListBox2.SelectedIndex);
        }
        foreach (int i2 in a2)
        {
            ListBox2.Items[i2].Selected = true;
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

    protected void Button3_Click1(object sender, EventArgs e)
    {
        Button1.Focus();
       // Response.Write("press save");
        foreach (ListItem li in ListBox1.Items)
        {
            li.Selected = true;
        }

        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        con.Open();
        cmd = new SqlCommand("select * from categorymaster  inner join TypeMaster on CategoryMaster.TypeId=TypeMaster.TypeId ", con);
        // cmd.Parameters.Add("@tid", item.Value);
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        cmd.Connection = con;
        rdr = cmd.ExecuteReader();
        ListBox2.DataSource = rdr;
        ListBox2.DataTextField = "categorydesc";
        ListBox2.DataValueField = "categoryid";
        ListBox2.DataBind();
        con.Close();



    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Button1.Focus();
        foreach (ListItem li1 in ListBox2.Items)
        {
            //Response.Write("sadsad"+li1.Text);
            li1.Selected = true;
        }
    }
  
}