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
    SqlDataAdapter dadapter;
    DataSet dset;
    PagedDataSource adsource;
    string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    int pos;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        for (int o = 0; o < 5; o++)
        {
            ListItem li = new ListItem();
            li.Text = "hii";
            li.Value = "hello";
            DropDiwnList1.Items.Add(li);
        }
        if (!IsPostBack)
        {
            this.ViewState["vs"] = 0;

        }
        pos = (int)this.ViewState["vs"];
        databind();
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

    public void databind()
    {
        dadapter = new SqlDataAdapter("select * from CategoryMaster inner join TypeMaster on CategoryMaster.TypeId=TypeMaster.TypeId", connstring);
        dset = new DataSet();
        adsource = new PagedDataSource();
        dadapter.Fill(dset);
        adsource.DataSource = dset.Tables[0].DefaultView;
        adsource.PageSize = 5;
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
        int ID = Convert.ToInt32(e.CommandArgument);

        Response.Write("hello efit clicked" + ID + "..");
        //btnBack.Text = "Cancel";
        string cs1 = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con1 = new SqlConnection(cs1);
        con1.Open();

        SqlCommand cmd = new SqlCommand();

        // SqlCommand cmd = new SqlCommand("SELECT * FROM TypeMaster where typeid=1",con1);
        cmd.CommandText = "SELECT * FROM CategoryMaster where CategoryId=@CategoryId ";
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
                TextBox1.Text = rdr.GetDecimal(0).ToString();
                TextBox2.Text = rdr.GetString(2);


                Response.Write(TextBox1.Text + "" + TextBox2.Text);


            }
            Response.Write(" " + j + " ");
        }
        databind();
    }



    protected void btnSave_Click(object sender, EventArgs e)
    {

        string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection con = new SqlConnection(cs);
        con.Open();
        SqlCommand cmd = new SqlCommand("update CategoryMaster set CategoryDesc=@CategoryDesc where categoryId=@categoryId", con);
        cmd.Parameters.Add("@categoryId", TextBox1.Text);
        cmd.Parameters.Add("@CategoryDesc", TextBox2.Text);
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
        databind();
    }




}