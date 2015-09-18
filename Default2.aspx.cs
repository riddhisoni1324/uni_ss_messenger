using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
    public partial class Default2 : System.Web.UI.Page
    {
        SqlDataAdapter dadapter;
        DataSet dset;
        PagedDataSource adsource;
        string connstring  = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        int pos;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ViewState["vs"] = 0;
            }
            pos = (int)this.ViewState["vs"];
            databind();

        }
        public void databind()
        {
            dadapter = new SqlDataAdapter("select * from student_detail order by roll_no asc", connstring);
            dset = new DataSet();
            adsource = new PagedDataSource();
            dadapter.Fill(dset);
            adsource.DataSource = dset.Tables[0].DefaultView;
            adsource.PageSize = 3;
            adsource.AllowPaging = true;
            adsource.CurrentPageIndex = pos;
            btnfirst.Enabled = !adsource.IsFirstPage;
            btnprevious.Enabled = !adsource.IsFirstPage;
            btnlast.Enabled = !adsource.IsLastPage;
            btnnext.Enabled = !adsource.IsLastPage;
            DataList1.DataSource = adsource;
            DataList1.DataBind();
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
            cmd.CommandText = "SELECT * FROM student_detail where roll_no=@ID";
            cmd.Parameters.Add("@ID", ID);


            cmd.Connection = con1;
            SqlDataReader rdr;
            rdr = cmd.ExecuteReader();
            int j = 0;
            if (rdr != null)
            {
                while (rdr.Read())
                {
                    j++;
                    // var myString = rdr.GetString(0); 
                    //txtFacultyCode.Text = 1;
                    TextBox1.Text = rdr.GetString(0);
                    TextBox2.Text = rdr.GetString(1);


                    Response.Write(TextBox1.Text+""+TextBox2.Text);


                }
                Response.Write(" " + j + " ");
            }
        }

        protected void update(object sender, EventArgs e)
        {

            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("update student_detail set s_name=@TypeDesc where roll_no=@TypeId", con);
            cmd.Parameters.Add("@TypeId",TextBox1.Text);
            cmd.Parameters.Add("@Typedesc", TextBox2.Text);
            if ((con.State & ConnectionState.Open) > 0)
            {
                Response.Write("Connection OK!");
                int i = cmd.ExecuteNonQuery();
                if (i != 0)
                {
                    Response.Write(i);
                    Response.Write("row inserted");
                    con.Close();
                    databind();
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

        protected void cat_SelectedIndexChanged(object sender, EventArgs e)
        {


        }
}
