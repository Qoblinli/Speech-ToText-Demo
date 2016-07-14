using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Oxford.Speech.JS
{
    public partial class test : System.Web.UI.Page
    {

        string url = "https://stream.watsonplatform.net/speech-to-text/api";
        string authon = "https://stream.watsonplatform.net/authorization/api";
        string username = "dd68bc8d-082c-4c94-8ea1-06285bb5d80e";
        string password = "hBrkADh05V5V";
        string version = "v1";
        string _url = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            _url += authon + "/v1/token?url=" + url;
            try
            {


                WebClient client = new WebClient();
                //string parm = "username=" + username + "&password=" + password;
                //byte[] postData=Encoding.UTF8.GetBytes(parm);
                string auth = string.Format("{0}:{1}", username, password);
                string auth64 = Convert.ToBase64String(Encoding.UTF8.GetBytes(auth));
                string credentials = string.Format("{0} {1}", "Basic", auth64);  
                                  
                client.Headers.Add("Authorization", credentials);

                Stream stream = client.OpenRead(_url);
                StreamReader read = new StreamReader(stream);
                string res = read.ReadToEnd();

                Response.Write(res);
                Response.End();
            }
            catch (WebException ex)
            {
                string res = ex.Response.ContentType;
            }
        }
    }
}