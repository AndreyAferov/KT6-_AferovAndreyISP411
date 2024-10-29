using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace PetShop.Classes
{
    internal class Manager
    {
        public static Frame MainFrame { get; set; }
        public static Data.User CurrentUser { get; set; }
        public static void GetImageData()
        {
            try
            {
                var list = Data.TradesEntities.GetContext().Product.ToList();
                foreach (var item in list)
                {
                    string path = Directory.GetCurrentDirectory() + @"\img\" + item.PhotoName;
                    if (File.Exists(path))
                    {
                        item.ProductPhote = File.ReadAllBytes(path);
                    }

                }
                Data.TradesEntities.GetContext().SaveChanges();
            }
            catch { }
        }
    }
}
