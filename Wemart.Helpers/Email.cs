using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using Wemart.Helpers.Enums;

namespace Wemart.Helpers
{
    public class Email
    {
        private static MailAddress senderEmail = new MailAddress("wemartdevelopers@gmail.com", "Wemart");
        private static string senderPassword = "wemart_1246".Trim();

        //public static void SendEmail(string receiver, string subject, string message, string name)
        //{
        //    try
        //    {
        //        var senderEmail = new MailAddress("mamamariasender@gmail.com", "Customer");
        //        var receiverEmail = new MailAddress("mamamariareciever@gmail.com", "Owner");
        //        var body = " Name : " + name
        //                  + "\n Email : " + receiver
        //                  + "\n Message : " + message;
        //        var smtp = new SmtpClient
        //        {
        //            Host = "smtp.gmail.com",
        //            Port = 587,
        //            EnableSsl = true,
        //            DeliveryMethod = SmtpDeliveryMethod.Network,
        //            UseDefaultCredentials = false,
        //            Credentials = new NetworkCredential(senderEmail.Address, "mama@12345")
        //        };

        //        using (var mess = new MailMessage(senderEmail, receiverEmail)
        //        {
        //            Subject = subject,
        //            Body = body
        //        })
        //        {
        //            smtp.Send(mess);
        //        }
                
        //    }
        //    catch (Exception)
        //    {

        //    }
        //}


        public static bool SendEmail(MailAddress recieverEmail, string body, string subject)
        {
            try
            {

                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(senderEmail.Address, senderPassword)
                };

                using (var mess = new MailMessage(senderEmail, recieverEmail)
                {
                    Subject = subject,
                    Body = body
                })
                {
                    smtp.Send(mess);
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }



        public static async Task<bool> SendEmailAsync(string EmailTo, string EmailBcc, string subject, string bodyContent)
        {
            try
            {

                SmtpClient myclient = new SmtpClient("smtp.gmail.com");

                MailMessage msg = new MailMessage();

                Setup_EmailTo(EmailTo, msg);
                Setup_EmailBcc(EmailBcc, msg);

                AlternateView av1 = null;

                av1 = GetEMailBody(bodyContent);
               
                msg.From = new MailAddress("no-reply@wemart.com", "Wemart Team");
                msg.Subject = subject;
                msg.AlternateViews.Add(av1);
                msg.IsBodyHtml = true;
                msg.BodyEncoding = Encoding.UTF8;
                msg.SubjectEncoding = Encoding.UTF8;
                NetworkCredential nc = new NetworkCredential("wemartdevelopers@gmail.com", "wemart_1246");
                myclient.Credentials = nc;

                myclient.EnableSsl = true;
                myclient.Port = 587;

                myclient.SendAsync(msg,"");
                return true;
            }
            catch (Exception ex)
            {
                string error = ex.Message;
                return false;
            }
        }

        private static void Setup_EmailBcc(string EmailBcc, MailMessage msg)
        {
            if (EmailBcc.Length > 0)
            {
                string[] bccArray = EmailBcc.Split(';');
                for (int k = 0; k < bccArray.Length; k++)
                {
                    //validate ==> bccArray[k]
                    msg.Bcc.Add(bccArray[k]);
                }
            }
        }

        private static void Setup_EmailTo(string EmailTo, MailMessage msg)
        {
            string[] toArray = EmailTo.Split(';');
            for (int i = 0; i < toArray.Length; i++)
            {
                //validate ==> toArray[i]
                msg.To.Add(toArray[i]);
            }
        }
        public static async Task<bool> SendEmailAsync(MailAddress recieverEmail, string subject, string body)
        {
            try
            {
                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(senderEmail.Address, senderPassword)
                };

                using (var mess = new MailMessage(senderEmail, recieverEmail)
                {
                    Subject = subject,
                    Body = body
                })
                {
                   await smtp.SendMailAsync(mess);
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }


        public static string GetEmailTemplateBody(EmailBodyEnum emailBodyID)
        {
            string content = "";
            try
            {
                string emailBody = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/EmailTemplates/" + emailBodyID.GetDescription());
                using (StreamReader reader = new StreamReader(emailBody))
                {
                    content = reader.ReadToEnd();
                }
            }
            catch (Exception ex)
            {
            }
            return content;
        }

        private static AlternateView GetEMailBody(string content)
        {
            string wemartLogoPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/Logo/Wemartz-whitebackground-logo.png");
            LinkedResource Logo = new LinkedResource(wemartLogoPath, System.Net.Mime.MediaTypeNames.Image.Jpeg);
            Logo.ContentId = "Logo";

            AlternateView av1 = AlternateView.CreateAlternateViewFromString(content, null, System.Net.Mime.MediaTypeNames.Text.Html);
            av1.LinkedResources.Add(Logo);

            return av1;
        }
    }
}
