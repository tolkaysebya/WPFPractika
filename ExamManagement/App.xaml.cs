using ExamManagement.Models;
using ExamManagement.Models.Metadata;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace ExamManagement
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static ExamManagementAshmarinEntities DB = new ExamManagementAshmarinEntities();
        public static MainWindow MainWindowInstance;
        public static Employee loggedEmployee;
        public static Student loggedStudent;
        public App()
        {
            DispatcherUnhandledException += App_DispatcherUnhandledException;
            RegistrateDescriptors();
        }

        private void RegistrateDescriptors()
        {
            AddDescriptor<Exam, ExamMetadata>();
            AddDescriptor<Employee, EmployeeMetadata>();
            AddDescriptor<Department, DepartmentMetadata>();
            AddDescriptor<Specialization, SpecializationMetadata>();
            AddDescriptor<Student, StudentMetadata>();  
        }

        private void AddDescriptor<T1, T2>()
        {
            var provider = new AssociatedMetadataTypeTypeDescriptionProvider(typeof(T1), typeof(T2));
            TypeDescriptor.AddProviderTransparent(provider, typeof(T1));
        }

        private void App_DispatcherUnhandledException(object sender, System.Windows.Threading.DispatcherUnhandledExceptionEventArgs e)
        {
            e.Handled = true;
            MessageBox.Show(e.Exception.Message);
        }

    }
}
