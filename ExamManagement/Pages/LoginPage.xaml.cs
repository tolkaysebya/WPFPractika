using ExamManagement.Pages.EngineerPage;
using ExamManagement.Pages.StudentsPage;
using ExamManagement.Pages.TeacherPages;
using ExamManagement.Pages.ZavDepartamentPages;
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

namespace ExamManagement.Pages
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

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            App.MainWindowInstance.BBack.Visibility = Visibility.Collapsed;
        }

        private void BLogin_Click(object sender, RoutedEventArgs e)
        {
            var employee = App.DB.Employee.FirstOrDefault(x => x.Login == TBLogin.Text && x.Password == PBPassword.Password);
            var student = App.DB.Student.FirstOrDefault(x => x.Login == TBLogin.Text && x.Password == PBPassword.Password);
            if(employee != null)
            {
                App.loggedEmployee = employee;
                if (employee.Post == "преподаватель")
                    NavigationService.Navigate(new ExamsPage());
                if (employee.Post == "инженер")
                    NavigationService.Navigate(new EmployeesPage());
                if (employee.Post == "зав. кафедрой")
                    NavigationService.Navigate(new DepartamentsPage());
            }
            else if(student != null)
            {
                App.loggedStudent = student;
                NavigationService.Navigate(new MainStudentPage());
            }
            else
            {
                MessageBox.Show("Неправильный логин или пароль");
                return;
            }
        }
    }
}
