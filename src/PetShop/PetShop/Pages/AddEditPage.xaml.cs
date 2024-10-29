using PetShop.Classes;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PetShop.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddEditPage.xaml
    /// </summary>
    public partial class AddEditPage : Page
    {
        public AddEditPage()
        {
            InitializeComponent();
            
            var CategoryList = Data.TradesEntities.GetContext().Category.ToList();
            CategoryList.Insert(0, new Data.Category { Category1 = "Категория" });
            CategoryCombo.ItemsSource =CategoryList;
            CategoryCombo.SelectedIndex = 0;
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new ViewPage());
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
