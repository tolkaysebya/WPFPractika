using ExamManagement.Models;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity.Infrastructure;
using System.IO;
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
    /// Логика взаимодействия для AddEmployeePage.xaml
    /// </summary>
    public partial class AddEmployeePage : Page
    {
        Employee contextEmployee;
        DbPropertyValues OldValue;
        public AddEmployeePage(Employee employee)
        {
            InitializeComponent();
            CBChief.ItemsSource = App.DB.Employee.ToList();
            CBRole.ItemsSource = App.DB.Employee.Select(x => x.Post).Distinct().ToList();
            CBDepartment.ItemsSource = App.DB.Department.ToList();
            contextEmployee = employee;
            DataContext = contextEmployee;
            if (contextEmployee.TabNumber != 0)
                OldValue = App.DB.Entry(contextEmployee).CurrentValues.Clone();
        }

        private void BAddPhoto_Click(object sender, RoutedEventArgs e)
        {
            var dialog = new OpenFileDialog() { Filter = ".png, .jpg, .jpeg | *.png; *.jpg; *.jpeg;" };
            if (dialog.ShowDialog().GetValueOrDefault())
            {
                contextEmployee.Image = File.ReadAllBytes(dialog.FileName);
                DataContext = null;
                DataContext = contextEmployee;
            }
        }

        private void BSave_Click(object sender, RoutedEventArgs e)
        {
            var error = string.Empty;
            var validationContext = new ValidationContext(contextEmployee);
            var results = new List<System.ComponentModel.DataAnnotations.ValidationResult>();
            var student = App.DB.Student.FirstOrDefault(x => x.Login == contextEmployee.Login);
            var employee = App.DB.Employee.FirstOrDefault(x => x.Login == contextEmployee.Login);
            if (student != null || employee != null)
            {
                error += "Такой логин уже существует";
            }
            if (!Validator.TryValidateObject(contextEmployee, validationContext, results, true))
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
            if (contextEmployee.TabNumber == 0)
                App.DB.Employee.Add(contextEmployee);
            App.DB.SaveChanges();
            NavigationService.GoBack();
        }

        private void BCancel_Click(object sender, RoutedEventArgs e)
        {
            if (contextEmployee.TabNumber != 0)
                App.DB.Entry(contextEmployee).CurrentValues.SetValues(OldValue);
            NavigationService.GoBack();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            App.MainWindowInstance.BBack.Visibility = Visibility.Collapsed;
        }
    }
}
