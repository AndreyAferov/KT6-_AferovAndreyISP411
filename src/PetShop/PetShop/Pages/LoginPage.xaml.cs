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
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }
        private int failedAttempts = 0; 
        private CaptchaGenerator captchaGenerator;
        private async void LoginButton_Click(object sender, RoutedEventArgs e)
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
            if (failedAttempts == 1  && !IsCaptchaCorrect())
            {
                errors.AppendLine("Неправильная CAPTCHA");
                LoadCaptcha();
                failedAttempts++;
            }
            
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            if (failedAttempts >= 2 && !!IsCaptchaCorrect())
            {
                MessageBox.Show("Неправильные данные или CAPTCHA. Вход заблокирован на 10 секунд.", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                LoginButton.IsEnabled = false;
                LoadCaptcha();
                await Task.Delay(10000);
                LoginButton.IsEnabled = true;
                return;
            }
            if (Data.TradesEntities.GetContext().User.Any(d => d.UserLogin == loginBox.Text && d.UserPassword == PasswordBox.Password))
            {
                var user = Data.TradesEntities.GetContext().User
                                       .FirstOrDefault(d => d.UserLogin == loginBox.Text && d.UserPassword == PasswordBox.Password);

                Manager.CurrentUser = user;

                switch (user.Role.RoleName)
                {
                    case "Администратор":
                        Manager.MainFrame.Navigate(new LkAdmin());
                        break;
                    case "Клиент":
                        Manager.MainFrame.Navigate(new ViewPage());
                        break;
                    case "Менеджер":
                        Manager.MainFrame.Navigate(new ViewPage());
                        break;
                }

                MessageBox.Show("Успех", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                failedAttempts = 0;
            }
            else
            {
                failedAttempts++;
                if (failedAttempts == 1)
                {
                    MessageBox.Show("Некорректный логин или пароль.", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    LoadCaptcha();
                }
                else
                {
                    MessageBox.Show("Некорректный логин или пароль.", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
        private void LoadCaptcha()
        {
            captchaGenerator = new CaptchaGenerator();
            captchaGenerator.GenerateCaptcha(CaptchaCanvas); 
            CaptchaCanvas.Visibility = Visibility.Visible;
            CaptchaTextBox.Visibility = Visibility.Visible;
        }

        private bool IsCaptchaCorrect()
        {
            return CaptchaTextBox.Text == captchaGenerator.CaptchaText;
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new ViewPage());
        }
    }
}
