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
    /// Логика взаимодействия для DisciplinesPage.xaml
    /// </summary>
    public partial class DisciplinesPage : Page
    {
        public DisciplinesPage()
        {
            InitializeComponent();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Refresh();
        }

        private void Refresh()
        {
            DGDisciplines.ItemsSource = App.DB.Discipline.ToList();
            App.MainWindowInstance.BBack.Visibility = Visibility.Visible;
        }
    }
}
