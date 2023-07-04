using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using Wemart.Helpers;
using Wemart.Helpers.Enums;



namespace Wemart.SQL
{
    public class Notify 
    { 

        #region  Sent Email To Users

        public static async Task SendAsyncEmailTo(UserTypes userTypes, string MSG, string Subject, int ID = 0)
        {
            DataTable dt = null;
            switch (userTypes)
            {
                case UserTypes.Admin:

                    dt = await Connection.Instance.GetDataAsync("SELECT Email FROM Admins");
                    for (int i = 0; i < dt.Rows.Count; i++) await Email.SendEmailAsync(new MailAddress(dt.Rows[i][0].ToString(),"Admin"), MSG, Subject);

                    break;
                case UserTypes.Shop:

                    dt = await Connection.Instance.GetDataAsync("SELECT Email FROM Shops WHERE ID = @ID", new Dictionary<string, object> { { "@ID", ID } });
                    await Email.SendEmailAsync(new MailAddress(dt.Rows[0][0].ToString(), "Vendor"), MSG, Subject);

                    break;
                case UserTypes.User:

                    dt = await Connection.Instance.GetDataAsync("SELECT Email FROM User WHERE ID = @ID", new Dictionary<string, object> { { "@ID", ID } });
                    await Email.SendEmailAsync(new MailAddress(dt.Rows[0][0].ToString(), "User"), MSG, Subject);

                    break;
                case UserTypes.Rider:

                    dt = await Connection.Instance.GetDataAsync("SELECT Email FROM Rider WHERE ID = @ID", new Dictionary<string, object> { { "@ID", ID } });
                    await Email.SendEmailAsync(new MailAddress(dt.Rows[0][0].ToString(), "Rider"), MSG, Subject);

                    break;
                default:

                    await SMS.SendSMSAsync("03423519691", "Something went wrong : " + MSG);
                    await SMS.SendSMSAsync("03423519691", "Something went wrong : " + MSG);

                    break;
            }
        }

        public static void SendEmailTo(UserTypes userTypes, string MSG, int ID = 0)
        {
            switch (userTypes)
            {
                case UserTypes.Admin:
                    break;
                case UserTypes.Shop:
                    break;
                case UserTypes.User:
                    break;
                case UserTypes.Rider:
                    break;
                default:
                    break;
            }
        }

        #endregion

        #region Sent SMS To Users

        public static async Task SendAsyncSMSTo(UserTypes userTypes, string MSG, int ID = 0)
        {

            DataTable dt = null;
            switch (userTypes)
            {
                case UserTypes.Admin:

                    dt = await Connection.Instance.GetDataAsync("SELECT Number FROM Admins");
                    for (int i = 0; i < dt.Rows.Count; i++) await SMS.SendSMSAsync(dt.Rows[i][0].ToString(), MSG);

                    break;
                case UserTypes.Shop:

                    dt = await Connection.Instance.GetDataAsync("SELECT Number FROM Shops WHERE ID = @ID", new Dictionary<string, object> { { "@ID", ID } });
                    await SMS.SendSMSAsync(dt.Rows[0][0].ToString(), MSG);

                    break;
                case UserTypes.User:

                    dt = await Connection.Instance.GetDataAsync("SELECT Number FROM User WHERE ID = @ID", new Dictionary<string, object> { { "@ID", ID } });
                    await SMS.SendSMSAsync(dt.Rows[0][0].ToString(), MSG);

                    break;
                case UserTypes.Rider:

                    dt = await Connection.Instance.GetDataAsync("SELECT Number FROM Rider WHERE ID = @ID", new Dictionary<string, object> { { "@ID", ID } });
                    await SMS.SendSMSAsync(dt.Rows[0][0].ToString(), MSG);

                    break;
                default:

                    await SMS.SendSMSAsync("03423519691", "Something went wrong : " + MSG);
                    await SMS.SendSMSAsync("03423519691", "Something went wrong : " + MSG);
                    
                    break;
            }
            
        }

        public static void SendSMSTo(UserTypes userTypes, string SMS, int ID = 0)
        {
            switch (userTypes)
            {
                case UserTypes.Admin:
                    break;
                case UserTypes.Shop:
                    break;
                case UserTypes.User:
                    break;
                case UserTypes.Rider:
                    break;
                default:
                    break;
            }
        }

        #endregion

    }
}
