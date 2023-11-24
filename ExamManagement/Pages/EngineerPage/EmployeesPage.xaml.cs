using ExamManagement.Models;
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

namespace ExamManagement.Pages.EngineerPage
{
    /// <summary>
    /// Логика взаимодействия для EmployeesPage.xaml
    /// </summary>
    public partial class EmployeesPage : Page
    {
        public EmployeesPage()
        {
            InitializeComponent();
            var posts = App.DB.Employee.Select(x => x.Post).Distinct().ToList();
            posts.Insert(0, "Показать всё");
            CBPost.ItemsSource = posts.ToList();
            CBPost.SelectedIndex = 0;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Refresh();
            App.MainWindowInstance.BBack.Visibility = Visibility.Visible;
            TBLoggedUser.Text =  $"{App.loggedEmployee.Surname} - {App.loggedEmployee.Post}";
        }

        private void Refresh()
        {
            var filtred = App.DB.Employee.Where(x => x.IsDelete != true).ToList();
            var value = CBPost.SelectedValue as string;
            var surchText = TBSurch.Text.ToLower();
            if(value != "" && value != null && CBPost.SelectedIndex != 0)
                filtred = filtred.Where(x => x.Post == value).ToList();
            if(!string.IsNullOrWhiteSpace(TBSurch.Text))
                filtred = filtred.Where(x => x.Surname.ToLower().Contains(surchText)).ToList();  
            LVEmployees.ItemsSource = filtred.ToList();
        }

        private void BAdd_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddEmployeePage(new Employee()));
        }

        private void BRemove_Click(object sender, RoutedEventArgs e)
        {
            if (LVEmployees.SelectedItem is Employee employee)
            {
                if(employee == App.loggedEmployee)
                {
                    MessageBox.Show("Вы не можете удалить самого себя");
                    return;
                }
                employee.IsDelete = true;
                App.DB.SaveChanges();
                Refresh();
            }
        }

        private void BEdit_Click(object sender, RoutedEventArgs e)
        {
            if (LVEmployees.SelectedItem is Employee employee)
            {
                NavigationService.Navigate(new AddEmployeePage(employee));

            }
        }

        private void TBSurch_TextChanged(object sender, TextChangedEventArgs e)
        {
            Refresh();
        }

        private void CBPost_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Refresh();

        }
    }
}
