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
    SqlCommand insert_cat; int id = 0;
    SqlDataAdapter dadapter;
    DataSet dset; string t_id; int c_id = 0;
    PagedDataSource adsource;
    string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    int pos;

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



    public void databind()
    {
        dadapter = new SqlDataAdapter("select * from CategoryMaster inner join TypeMaster on CategoryMaster.TypeId=TypeMaster.TypeId", connstring);
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

    protected void Edit_Command(object source, DataListCommandEventArgs e)
    {
        MultiView1.SetActiveView(View2);
        DropDownList2.Enabled = false;
        h_id.Text = "no";
        int ID = Convert.ToInt32(e.CommandArgument);
        id = ID;

        //Response.Write("hello efit clicked" + ID + "..");
        //btnBack.Text = "Cancel";
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();

        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "select * from CategoryMaster inner join TypeMaster on CategoryMaster.TypeId=TypeMaster.TypeId where CategoryId=@CategoryId ";
        cmd.Parameters.Add("@CategoryId", ID);


        cmd.Connection = con1;
        SqlDataReader rdr;
        rdr = cmd.ExecuteReader();
        int j = 0;
        if (rdr != null)
        {
            while (rdr.Read())
            {
                j++;
                t_cat_desc.Text = rdr.GetString(2);
                t_id = rdr.GetDecimal(1).ToString();
                c_id = Convert.ToInt32(t_id);
                flag.Text = rdr.GetDecimal(0).ToString();
                string t = rdr.GetString(7);
                DropDownList2.ClearSelection();
                DropDownList2.Items.FindByText(t).Selected = true;
                //  Response.Write("tiasjdias is "+t_id +"cat is "+c_id+"type name "+t);

            }

        }
        databind();
    }



    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (h_id.Text == "fl")
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('insert.');", true);
            DropDownList2.Enabled = true;
            var s = DropDownList2.SelectedItem.Value;
            string s1 = DropDownList2.SelectedItem.Text;
            //Response.Write(t_cat_desc.Text+s1);
            string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con1 = new SqlConnection(cs1);
            con1.Open();
            insert_cat = new SqlCommand("INSERT INTO Categorymaster (TypeID,CategoryDesc) VALUES(@TypeID,@CategoryDesc)", con1);
            insert_cat.Parameters.Add("@TypeId", s);
            insert_cat.Parameters.Add("@CategoryDesc", t_cat_desc.Text + " -" + s1);

            if ((con1.State & ConnectionState.Open) > 0)
            {
                int i = insert_cat.ExecuteNonQuery();
                if (i != 0)
                {
                    //Response.Write(i);
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Category Added Succesfully.');", true);
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

            t_cat_desc.Text = " ";
            con1.Close();
            MultiView1.SetActiveView(View1);
            databind();

        }
        else
        {
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("update CategoryMaster set CategoryDesc=@CategoryDesc where categoryId=@categoryId", con);
            //Response.Write("sfsfsf is " + flag.Text+ "id is "+id);

            cmd.Parameters.Add("@categoryId", flag.Text);
            cmd.Parameters.Add("@CategoryDesc", t_cat_desc.Text);
            if ((con.State & ConnectionState.Open) > 0)
            {
                //Response.Write("Connection OK!");
                int i = cmd.ExecuteNonQuery();
                if (i != 0)
                {
                    // Response.Write(i);
                    //  Response.Write("row inserted");
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Category Updated Succesfully.');", true);
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




    protected void b_add_category_click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View2);
        h_id.Text = "fl";
        t_cat_desc.Text = " ";
        DropDownList2.Enabled = true;

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View1);
    }
}