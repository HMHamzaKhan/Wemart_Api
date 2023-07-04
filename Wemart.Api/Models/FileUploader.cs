using Microsoft.AspNetCore.Http;
using System.IO;
using System.Threading.Tasks;

namespace Wemart.Api.Models
{
    public class FileUploader
    {
        public static async Task<string> AddFile(IFormFile file, string foldername, string filename)
        {
            string msg = "";
            if (file != null)
            {
                if (file.Length > 0)
                {
                    var fileExtension = Path.GetExtension(file.FileName);
                    var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/" + foldername, filename + fileExtension);
                    //var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/" + foldername, filename + fileExtension);
                    //fileExtension = fileExtension.ToLower();
                    //if (fileExtension == ".jpg" || fileExtension == ".png" || fileExtension == ".jpeg" || fileExtension == ".svg" || fileExtension == ".pjpeg" || fileExtension == ".gif")

                    if (CheckImgExtension(fileExtension.ToUpper()))
                    {
                        using (FileStream fileStream = new FileStream(path, FileMode.Create))
                        {
                            await file.CopyToAsync(fileStream);
                        }
                        msg = $"/{foldername}/{filename + fileExtension}";
                    }
                    else
                    {
                        msg = "invalid file";
                    }
                }
                else
                {
                    msg = "";
                }
            }
            else
            {
                msg = "please select file";
            }

            return msg;
        }
        private static bool CheckImgExtension(string fileExtension)
        {
            string[] Imagearray = { ".JPG", ".PNG", ".GIF", ".WEBP", ".TIFF", ".PSD", ".RAW", ".BMP", ".HEIF", ".INDD", ".JPEG 2000", ".JPG", ".JPEG", ".JPE", ".JIF", ".JFIF", ".JFI", ".TIFF", ".PJP", ".PJEPG", ".TIF", ".GIF", ".SVG", ".BMP", ".SVGZ", ".WEBP", ".ICO", ".XBM" };
            string[] Videoarray = { "WEBM", "MPG", "MP2", "MPEG", "MPE", "MPV", "OGG", "MP4", "M4P", "M4V", "AVI", "WMV", "MOV", "QT", "FLV", "SWF", "AVCHD" };
            string[] Docarray = { "PDF", "DOC", "DOCX" };

            return Imagearray.Contains(fileExtension);
        }
    }
}
