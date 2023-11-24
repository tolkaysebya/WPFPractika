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
    /// Логика взаимодействия для SpecializationsPage.xaml
    /// </summary>
    public partial class SpecializationsPage : Page
    {
        Department contextDepartment;
        Specialization contextSpecialization;
        public SpecializationsPage(Department department)
        {
            InitializeComponent();
            contextDepartment = department;
            contextSpecialization = new Specialization() { Department = contextDepartment };
            DataContext = contextSpecialization;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            TBDepartment.Text = contextDepartment.Name;
            App.MainWindowInstance.BBack.Visibility = Visibility.Visible;
            Refresh();
        }

        private void Refresh()
        {
            DGSpecialization.ItemsSource = App.DB.Specialization.Where(x => x.DepartmentShifr == contextDepartment.Shifr).ToList();
        }

        private void DGSpecialization_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(DGSpecialization.SelectedItem is Specialization specialization)
            {
                contextSpecialization = specialization;
                DataContext = contextSpecialization;
            }
        }

        private void BSave_Click(object sender, RoutedEventArgs e)
        {
            var error = string.Empty;
            var specialization = App.DB.Specialization.FirstOrDefault(x => x.Number == contextSpecialization.Number);
            if (specialization != null && specialization != contextSpecialization)
                error += "This specialization number already exists";
            var validationContext = new ValidationContext(contextSpecialization);
            var results = new List<System.ComponentModel.DataAnnotations.ValidationResult>();
            if (!Validator.TryValidateObject(contextSpecialization, validationContext, results, true))
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
            if (specialization == null)
                App.DB.Specialization.Add(contextSpecialization);
            App.DB.SaveChanges();
            Refresh();
            contextSpecialization = null;
            contextSpecialization = new Specialization() { Department = contextDepartment };
            DataContext = contextSpecialization;
            DGSpecialization.SelectedItem = null;
        }

        private void BClear_Click(object sender, RoutedEventArgs e)
        {
            DataContext = null;
            contextSpecialization = new Specialization() { Department = contextDepartment };
            DGSpecialization.SelectedItem = null;
            DataContext = contextSpecialization;
        }

        private void BRemove_Click(object sender, RoutedEventArgs e)
        {
            if (DGSpecialization.SelectedItem is Specialization specialization)
            {
                App.DB.Specialization.Remove(specialization);
                App.DB.SaveChanges();
                Refresh();
                DataContext = null;
                contextSpecialization = new Specialization() { Department = contextDepartment };
                DGSpecialization.SelectedItem = null;
                DataContext = contextSpecialization;
            }
        }
    }
}
