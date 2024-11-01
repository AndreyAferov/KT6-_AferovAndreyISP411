using PetShop.Classes;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration.Configuration;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
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
        public string FlagAddorEdit = "default";
        public Data.Product _currentproduct = new Data.Product();
        public AddEditPage(Data.Product product)
        {
            InitializeComponent();

            if (product != null)
            {
                _currentproduct = product;
                FlagAddorEdit = "edit";
            }
            else
            {
                FlagAddorEdit = "add";
            }
            DataContext = _currentproduct;

            Init();
        }

        public void Init()
        {
            try
            {
                CategoryCombo.ItemsSource = Data.TradesEntities.GetContext().Category.ToList();
                if (FlagAddorEdit == "add")
                {
                    IdTextBox.Visibility = Visibility.Hidden;
                    IdLabel.Visibility = Visibility.Hidden;

                    CategoryCombo.SelectedItem = null;
                    CountTextBox.Text = string.Empty;
                    UnitTextBox.Text = string.Empty;
                    NameTextBox.Text = string.Empty;
                    CostTextBox.Text = string.Empty;
                    SupplierTextBox.Text = string.Empty;
                    DescriptionTextBox.Text = string.Empty;
                    IdTextBox.Text = Data.TradesEntities.GetContext().Product.Max(d => d.Id + 1).ToString();
                }
                else if (FlagAddorEdit == "edit")
                {
                    IdTextBox.Visibility = Visibility.Visible;
                    IdLabel.Visibility = Visibility.Visible;
                    CategoryCombo.SelectedItem = null;
                    CountTextBox.Text = _currentproduct.ProductQuantityInStock.ToString();
                    UnitTextBox.Text = _currentproduct.Units.NameOfUnit;
                    NameTextBox.Text = _currentproduct.ProductName.Name;
                    CostTextBox.Text = _currentproduct.ProductCost.ToString();
                    SupplierTextBox.Text = _currentproduct.Manufacture.Name;
                    DescriptionTextBox.Text = _currentproduct.ProductDiscription;
                    IdTextBox.Text = _currentproduct.Id.ToString();
                    CategoryCombo.SelectedItem = Data.TradesEntities.GetContext().Category.Where(d => d.Id == _currentproduct.IdCategory).FirstOrDefault();
                    if (_currentproduct.ProductPhote != null)
                    {
                        using (var ms = new System.IO.MemoryStream(_currentproduct.ProductPhote))
                        {
                        }
                    }
                    else
                    {
                    }
                }
            }
            catch (Exception)
            {

            }
        }
        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errors = new StringBuilder();
                if (string.IsNullOrEmpty(NameTextBox.Text))
                {
                    errors.AppendLine("Заполните наименование");
                }
                if (CategoryCombo.SelectedItem == null)
                {
                    errors.AppendLine("Выберите категорию");
                }
                if (string.IsNullOrEmpty(CountTextBox.Text))
                {
                    errors.AppendLine("Заполните количество");
                }
                else
                {
                    var tryQuantity = Int32.TryParse(CountTextBox.Text, out var resultQuantity);
                    if (!tryQuantity)
                    {
                        errors.AppendLine("Количество - целое число");
                    }
                }
                if (string.IsNullOrEmpty(UnitTextBox.Text))
                {
                    errors.AppendLine("Заполните ед.измерения");
                }
                if (string.IsNullOrEmpty(SupplierTextBox.Text))
                {
                    errors.AppendLine("Заполните поставщика");
                }
                if (string.IsNullOrEmpty(CostTextBox.Text))
                {
                    errors.AppendLine("Заполните стоимость");
                }
                else
                {
                    var tryCost = Decimal.TryParse(CostTextBox.Text, out var resultCost);
                    if (!tryCost)
                    {
                        errors.AppendLine("Стоимость - дробное число");
                    }
                    else
                    {
                        int decimalSeparatorIndex = CostTextBox.Text.IndexOfAny(new char[] { ',', '.' });

                        if (decimalSeparatorIndex != -1)
                        {
                            int decimalsCount = CostTextBox.Text.Length - decimalSeparatorIndex - 1;

                            if (decimalsCount > 2)
                            {
                                errors.AppendLine("Допускается не более двух знаков после запятой.");
                            }
                        }
                    }
                    if (tryCost && resultCost < 0)
                    {
                        errors.AppendLine("Стоимость не может быть отрицательной");
                    }
                }
                if (string.IsNullOrEmpty(DescriptionTextBox.Text))
                {
                    errors.AppendLine("Заполните описание");
                }

                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                var selectedCategory = CategoryCombo.SelectedItem as Data.Category;
                _currentproduct.IdCategory = Data.TradesEntities.GetContext().Category.Where(d => d.Id == selectedCategory.Id).FirstOrDefault().Id;
                _currentproduct.ProductQuantityInStock = Convert.ToInt32(CountTextBox.Text);
                _currentproduct.ProductCost = Convert.ToDecimal(CostTextBox.Text);
                _currentproduct.ProductDiscription = DescriptionTextBox.Text;

                var searchUnit = (from item in Data.TradesEntities.GetContext().Units
                                  where item.NameOfUnit == UnitTextBox.Text
                                  select item).FirstOrDefault();
                if (searchUnit != null)
                {
                    _currentproduct.IdUnits = searchUnit.Id;
                }
                else
                {
                    Data.Units units = new Data.Units()
                    {
                        NameOfUnit = UnitTextBox.Text
                    };
                    Data.TradesEntities.GetContext().Units.Add(units);
                    Data.TradesEntities.GetContext().SaveChanges();
                    _currentproduct.IdUnits = units.Id;
                }

                var searchProductName = (from item in Data.TradesEntities.GetContext().ProductName
                                         where item.Name == NameTextBox.Text
                                         select item).FirstOrDefault();
                if (searchProductName != null)
                {
                    _currentproduct.IdProductName = searchProductName.Id;
                }
                else
                {
                    Data.ProductName productName = new Data.ProductName()
                    {
                        Name = NameTextBox.Text
                    };
                    Data.TradesEntities.GetContext().ProductName.Add(productName);
                    Data.TradesEntities.GetContext().SaveChanges();
                    _currentproduct.IdProductName = productName.Id;
                }

                var searchManufacture = (from item in Data.TradesEntities.GetContext().Manufacture
                                         where item.Name == SupplierTextBox.Text
                                         select item).FirstOrDefault();

                if (searchManufacture != null)
                {
                    _currentproduct.IdManufacturer = searchManufacture.Id;
                }
                else
                {
                    Data.Manufacture manufacture = new Data.Manufacture()
                    {
                        Name = SupplierTextBox.Text
                    };
                    Data.TradesEntities.GetContext().Manufacture.Add(manufacture);
                    Data.TradesEntities.GetContext().SaveChanges();
                    _currentproduct.IdManufacturer = manufacture.Id;
                }
               
                if (FlagAddorEdit == "add")
                {
                    Data.TradesEntities.GetContext().Product.Add(_currentproduct);
                    Data.TradesEntities.GetContext().SaveChanges();
                    MessageBox.Show("Успешно добавлено", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                    Manager.MainFrame.Navigate(new LkAdmin());
                }

                else if (FlagAddorEdit == "edit")
                {
                    Data.TradesEntities.GetContext().SaveChanges();
                    MessageBox.Show("Успешно добавлено", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                    Manager.MainFrame.Navigate(new LkAdmin());
                }
            }

            catch (Exception)
            {

            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new LkAdmin());
        }

        private void ProductImage_MouseDown(object sender, MouseButtonEventArgs e)
        {
            Microsoft.Win32.OpenFileDialog openFileDialog = new Microsoft.Win32.OpenFileDialog();
            openFileDialog.Filter = "Image Files|*.jpg;*.jpeg;*.png;*.bmp";

            if (openFileDialog.ShowDialog() == true)
            {
                BitmapImage bitmap = new BitmapImage(new Uri(openFileDialog.FileName));

                if (bitmap.PixelWidth == 300 && bitmap.PixelHeight == 200)
                {
                    ProductImage.Source = bitmap;

                    _currentproduct.ProductPhote = ImageToByteArray(bitmap);

                    Data.TradesEntities.GetContext().SaveChanges();
                }
                else
                {
                    MessageBox.Show("Изображение должно быть размером 300x200 пикселей.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
        private byte[] ImageToByteArray(BitmapImage image)
        {
            byte[] data;
            JpegBitmapEncoder encoder = new JpegBitmapEncoder();
            encoder.Frames.Add(BitmapFrame.Create(image));

            using (MemoryStream ms = new MemoryStream())
            {
                encoder.Save(ms);
                data = ms.ToArray();
            }
            return data;
        }

    }
}
