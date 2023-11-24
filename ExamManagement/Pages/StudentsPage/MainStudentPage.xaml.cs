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

namespace ExamManagement.Pages.StudentsPage
{
    /// <summary>
    /// Логика взаимодействия для MainStudentPage.xaml
    /// </summary>
    public partial class MainStudentPage : Page
    {
        public MainStudentPage()
        {
            InitializeComponent();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            TBStudent.Text = App.loggedStudent.Surname;
            Refresh();
        }

        private void Refresh()
        {
            DGExams.ItemsSource = App.DB.Exam.Where(x => x.RegNumber == App.loggedStudent.RegNumber).ToList();
            App.MainWindowInstance.BBack.Visibility = Visibility.Visible;
        }

        private void BProfile_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new EditStudentPage());
        }
    }
}
