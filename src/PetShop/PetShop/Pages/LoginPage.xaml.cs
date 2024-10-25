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
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
        StringBuilder errors = new StringBuilder();
            if (String.IsNullOrEmpty(loginBox.Text))
            {
                errors.AppendLine("Введите логин");
            }
            if (String.IsNullOrEmpty(PasswordBox.Password))
            {
                errors.AppendLine("Введите пароль");
            }
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            if(Data.TradesEntities.GetContext().User.Any(d => d.UserLogin == loginBox.Text && d.UserPassword == PasswordBox.Password))
            {

            }
        }
    }
}
