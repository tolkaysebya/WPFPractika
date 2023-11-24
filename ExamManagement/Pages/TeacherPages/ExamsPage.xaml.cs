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

namespace ExamManagement.Pages.TeacherPages
{
    /// <summary>
    /// Логика взаимодействия для ExamsPage.xaml
    /// </summary>
    public partial class ExamsPage : Page
    {
        public ExamsPage()
        {
            InitializeComponent();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Refresh();
            App.MainWindowInstance.BBack.Visibility = Visibility.Visible;
            TBLoggedUser.Text = $"{App.loggedEmployee.Surname} - {App.loggedEmployee.Post}";
        }
        private void Refresh()
        {
            DGExams.ItemsSource = App.DB.Exam.Where(x => x.TabNumber == App.loggedEmployee.TabNumber).ToList();
        }
        private void DGExams_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (DGExams.SelectedItem is Exam exam)
            {
                NavigationService.Navigate(new StudentsInExamPage(exam));
            }
        }
    }
}
