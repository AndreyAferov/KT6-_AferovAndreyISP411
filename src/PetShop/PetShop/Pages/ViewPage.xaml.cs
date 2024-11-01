using PetShop.Classes;
using System;
using System.Collections.Generic;
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
    /// Логика взаимодействия для ViewPage.xaml
    /// </summary>
    public partial class ViewPage : Page
    {
        public ViewPage()
        {
            InitializeComponent();

            ProductListView.ItemsSource = Data.TradesEntities.GetContext().Product.ToList();

            Init();
        }
        public void Init()
        {
            ProductListView.ItemsSource = Data.TradesEntities.GetContext().Product.ToList();
            var manufactList = Data.TradesEntities.GetContext().Manufacture.ToList();
            manufactList.Insert(0, new Data.Manufacture { Name = "Все производители" });
            ManufacturerComboBox.ItemsSource = manufactList;
            ManufacturerComboBox.SelectedIndex = 0;
            CountOfLabel.Content = $"{Data.TradesEntities.GetContext().Product.Count()}/" +
                $"{Data.TradesEntities.GetContext().Product.Count()}";
            if (Manager.CurrentUser != null)
            {
                FIOLabel.Visibility = Visibility.Visible;
                FIOLabel.Content = $"{Manager.CurrentUser.UserSurname} " +
                    $"{Manager.CurrentUser.UserName} " +
                    $"{Manager.CurrentUser.UserPatronymic}";
            }
            else
            {
                FIOLabel.Visibility = Visibility.Hidden;

            }
            CountOfLabel.Content = $"{Data.TradesEntities.GetContext().Product.Count()}/" +
                $"{Data.TradesEntities.GetContext().Product.Count()}";
        }

        public List<Data.Product> _currentProduct = Data.TradesEntities.GetContext().Product.ToList();
        public void Update()
        {
            try
            {
                _currentProduct = Data.TradesEntities.GetContext().Product.ToList();
                _currentProduct = (from item in Data.TradesEntities.GetContext().Product
                                   where item.ProductName.Name.ToLower().Contains(SearchTextBox.Text) ||
                                   item.ProductDiscription.ToLower().Contains(SearchTextBox.Text) ||
                                   item.Manufacture.Name.ToLower().Contains(SearchTextBox.Text) ||
                                   item.ProductCost.ToString().ToLower().Contains(SearchTextBox.Text) ||
                                   item.ProductQuantityInStock.ToString().ToLower().Contains(SearchTextBox.Text)
                                   select item).ToList();
                if (SortRadioButton.IsChecked == true)
                {
                    _currentProduct = _currentProduct.OrderBy(d => d.ProductCost).ToList();
                }
                if (SortDownRadioButton.IsChecked == true)
                {
                    _currentProduct = _currentProduct.OrderByDescending(d => d.ProductCost).ToList();
                }
                var selected = ManufacturerComboBox.SelectedItem as Data.Manufacture;
                if (selected != null && selected.Name != "Все производители")
                {
                    _currentProduct = _currentProduct.Where(d => d.IdManufacturer == selected.Id).ToList();

                }
                CountOfLabel.Content = $"{_currentProduct.Count}/{Data.TradesEntities.GetContext().Product.Count()}";
                ProductListView.ItemsSource = _currentProduct;
            }
            catch (Exception)
            {
            MessageBox.Show("Ошибка!","Ошибка", MessageBoxButton.OK,MessageBoxImage.Error);
            }
        }

        private void SortRadioButton_Checked(object sender, RoutedEventArgs e)
        {
            Update();
        }

        private void SortDownRadioButton_Checked(object sender, RoutedEventArgs e)
        {
            Update();
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }

        private void ManufacturerComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void BackButon_Click(object sender, RoutedEventArgs e)
        {
            Manager.CurrentUser = null;
            Manager.MainFrame.Navigate(new LoginPage());
            
        }
    }
}
