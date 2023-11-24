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

namespace ExamManagement.Pages.ZavDepartamentPages
{
    /// <summary>
    /// Логика взаимодействия для DepartamentsPage.xaml
    /// </summary>
    public partial class DepartamentsPage : Page
    {
        public DepartamentsPage()
        {
            InitializeComponent();
            var faculcy = App.DB.Faculcy.ToList();
            faculcy.Insert(0, new Faculcy() { Name = "Показать всё" });
            CBFaculcy.ItemsSource = faculcy.ToList();
            CBFaculcy.SelectedIndex = 0;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Refresh();
            App.MainWindowInstance.BBack.Visibility = Visibility.Visible;
            TBLoggedUser.Text = $"{App.loggedEmployee.Surname} - {App.loggedEmployee.Post}";
        }

        private void Refresh()
        {
            var filtred = App.DB.Department.Where(x => x.IsDelete != true).ToList();
            var faculcy = CBFaculcy.SelectedItem as Faculcy;
            if (CBFaculcy.SelectedItem != null && CBFaculcy.SelectedIndex != 0)
                filtred = filtred.Where(x => x.FaculcyAbbr == faculcy.Abbr).ToList();
            DGDepartment.ItemsSource = filtred.ToList();
        }

        private void BAdd_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddDepartmentPage(new Department()));
        }

        private void BEdit_Click(object sender, RoutedEventArgs e)
        {
            if(DGDepartment.SelectedItem is Department department)
            {
                NavigationService.Navigate(new AddDepartmentPage(department));
            }
            else
            {
                MessageBox.Show("Select department");
            }
        }

        private void CBFaculcy_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Refresh();
        }

        private void DGDepartment_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if(DGDepartment.SelectedItem is Department department)
            {
                NavigationService.Navigate(new SpecializationsPage(department));
            }
            else
            {
                MessageBox.Show("Select department");
                return;
            }
        }

        private void BDelete_Click(object sender, RoutedEventArgs e)
        {
            if(DGDepartment.SelectedItem is Department department)
            {
                department.IsDelete = true;
                App.DB.SaveChanges();
            }
            Refresh();
        }
    }
}
