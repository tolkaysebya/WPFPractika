using ExamManagement.Pages;
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

namespace ExamManagement
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            App.MainWindowInstance = this;
            MainFrame.Navigate(new LoginPage());
        }

        private void BBack_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.GoBack();
        }

        private void BQR_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new QRPage());
        }
    }
}
