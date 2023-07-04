using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Wemart.Helpers
{
    public class SMS
    {

        public static void SendSMS(string number, string msg)
        {
            try
            {
                ServicePointManager.Expect100Continue = true;
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                string username = "923170805812";
                string password = "6934";
                string HostURI = "https://sendpk.com/api/sms.php?username=" + username + "&password=" + password + "&sender=NLM&mobile=" + number + "&message=" + msg;
                HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(HostURI);
                request.Method = "GET";
                String test = String.Empty;
                using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
                {
                    Stream dataStream = response.GetResponseStream();
                    StreamReader reader = new StreamReader(dataStream);
                    test = reader.ReadToEnd();
                    reader.Close();
                    dataStream.Close();
                }
            }
            catch (Exception ae)
            {
                //Logs.WriteError("WebTech.Common.Email", "SendMail(" + from + "," + to + "," + subject + "," + body + ")", "General", ae.Message);                
            }
        }

        public static async Task SendSMSAsync(string number, string msg)
        {
            try
            {
                ServicePointManager.Expect100Continue = true;
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                string username = "923170805812";
                string password = "6934";
                string HostURI = "https://sendpk.com/api/sms.php?username=" + username + "&password=" + password + "&sender=NLM&mobile=" + number + "&message=" + msg;
                HttpWebRequest request = (HttpWebRequest) HttpWebRequest.Create(HostURI);
                request.Method = "GET";
                String test = String.Empty;
                using (HttpWebResponse response = (HttpWebResponse) await request.GetResponseAsync())
                {
                    Stream dataStream = response.GetResponseStream();
                    StreamReader reader = new StreamReader(dataStream);
                    test = reader.ReadToEnd();
                    reader.Close();
                    dataStream.Close();
                }
            }
            catch (Exception ae)
            {
                //Logs.WriteError("WebTech.Common.Email", "SendMail(" + from + "," + to + "," + subject + "," + body + ")", "General", ae.Message);                
            }
        }
    }
}
