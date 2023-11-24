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

namespace ExamManagement.Pages.StudentsPage
{
    /// <summary>
    /// Логика взаимодействия для EditStudentPage.xaml
    /// </summary>
    public partial class EditStudentPage : Page
    {
        Student contextStudent;
        DbPropertyValues OldValue;
        public EditStudentPage()
        {
            InitializeComponent();
            CBSpecialization.ItemsSource = App.DB.Specialization.ToList();
            contextStudent = App.loggedStudent;
            OldValue = App.DB.Entry(contextStudent).CurrentValues.Clone();
            DataContext = contextStudent;
        }

        private void BSave_Click(object sender, RoutedEventArgs e)
        {
            var error = "";
            var validationContext = new ValidationContext(contextStudent);
            var results = new List<System.ComponentModel.DataAnnotations.ValidationResult>();
            var student = App.DB.Student.FirstOrDefault(x => x.Login == contextStudent.Login);
            var employee = App.DB.Employee.FirstOrDefault(x => x.Login == contextStudent.Login);
            if(student != null || employee != null)
            {
                error += "Такой логин уже существует";
            }
            if (!Validator.TryValidateObject(contextStudent,validationContext,results, true))
            {
                foreach(var result in results)
                {
                    error += $"{result}\n";
                }
            }
            if (!string.IsNullOrWhiteSpace(error))
            {
                MessageBox.Show(error);
                return;
            }
            App.DB.SaveChanges();
            NavigationService.GoBack();
        }

        private void BCancel_Click(object sender, RoutedEventArgs e)
        {
            App.DB.Entry(contextStudent).CurrentValues.SetValues(OldValue);
            NavigationService.GoBack();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            App.MainWindowInstance.BBack.Visibility = Visibility.Collapsed; 
        }
    }
}
