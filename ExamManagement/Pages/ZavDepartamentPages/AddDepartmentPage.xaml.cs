using ExamManagement.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity.Infrastructure;
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
    /// Логика взаимодействия для AddDepartmentPage.xaml
    /// </summary>
    public partial class AddDepartmentPage : Page
    {
        Department contextDepartment;
        DbPropertyValues OldValue;
        public AddDepartmentPage(Department department)
        {
            InitializeComponent();
            CBFaculcy.ItemsSource = App.DB.Faculcy.ToList();
            contextDepartment = department;
            DataContext = contextDepartment;
            if (contextDepartment.Shifr != null)
            {
                OldValue = App.DB.Entry(contextDepartment).CurrentValues.Clone();
                TBShifr.IsEnabled = false;
            }
        }

        private void BSave_Click(object sender, RoutedEventArgs e)
        {
            var error = string.Empty;
            var validationContext = new ValidationContext(contextDepartment);
            var results = new List<System.ComponentModel.DataAnnotations.ValidationResult>();
            var department = App.DB.Department.FirstOrDefault(x => x.Shifr == contextDepartment.Shifr);
            if (department != null && department != contextDepartment)
                error += "This department shifr already exists";
            if (!Validator.TryValidateObject(contextDepartment, validationContext, results, true))
            {
                foreach (var result in results)
                {
                    error += $"{result.ErrorMessage}\n";
                }
            }
            if (!string.IsNullOrWhiteSpace(error))
            {
                MessageBox.Show(error);
                return;
            }
            if (department == null)
                App.DB.Department.Add(contextDepartment);
            App.DB.SaveChanges();
            NavigationService.GoBack();
        }

        private void BCancel_Click(object sender, RoutedEventArgs e)
        {
            if (contextDepartment.Shifr != "" && contextDepartment.Shifr != null)
                App.DB.Entry(contextDepartment).CurrentValues.SetValues(OldValue);
            NavigationService.GoBack();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            App.MainWindowInstance.BBack.Visibility = Visibility.Collapsed;
        }
    }
}
