using ExamManagement.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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
    /// Логика взаимодействия для StudentsInExamPage.xaml
    /// </summary>
    public partial class StudentsInExamPage : Page
    {
        Exam contextExam;
        public StudentsInExamPage(Exam exam)
        {
            InitializeComponent();
            contextExam = exam;
            CBStudent.ItemsSource = App.DB.Student.ToList();
            CBMarkForSurch.SelectedIndex = 0;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Refresh();
            TBDiscipline.Text = $"{contextExam.Discipline.Name}-{contextExam.Date.ToShortDateString()}";

        }

        private void Refresh()
        {
            App.MainWindowInstance.BBack.Visibility = Visibility.Visible;
            var filtred = App.DB.Exam.Where(x => x.Date == contextExam.Date && x.DisciplineCode == contextExam.DisciplineCode).ToList();
            if (CBMarkForSurch.SelectedIndex != 0 && CBMarkForSurch.SelectedValue != null)
                filtred = filtred.Where(x => x.Mark == int.Parse((CBMarkForSurch.SelectedValue as TextBlock).Text)).ToList();
            if (!string.IsNullOrWhiteSpace(TBSurch.Text))
                filtred = filtred.Where(x => x.Student.Surname.ToLower().Contains(TBSurch.Text.ToLower())).ToList();
            DGStudents.ItemsSource = filtred.ToList();
        }

        private void BAdd_Click(object sender, RoutedEventArgs e)
        {
            string error = string.Empty;
            var exam = contextExam;
            exam.Student = null;
            exam.RegNumber = -1;
            if (CBMark.SelectedValue != null)
                exam.Mark = int.Parse((CBMark.SelectedValue as TextBlock).Text);
            else
                error = "Выберите оценку\n";
            if (CBStudent.SelectedItem != null)
            {
                exam.RegNumber = (CBStudent.SelectedItem as Student).RegNumber;
                exam.Student = App.DB.Student.FirstOrDefault(x => x.RegNumber == exam.RegNumber);
            }
            else
                exam.Student = null;
            var studentInExam = App.DB.Exam.FirstOrDefault(x => x.Date == contextExam.Date && x.DisciplineCode == contextExam.DisciplineCode && x.RegNumber == exam.RegNumber);
            if (studentInExam != null)
                error += "Этот студент уже добавлен\n";
            var validationContext = new ValidationContext(exam);
            var results = new List<System.ComponentModel.DataAnnotations.ValidationResult>();
            if(!Validator.TryValidateObject(exam, validationContext, results, true))
            {
                foreach(var result in results)
                {
                    error += $"{result.ErrorMessage}\n";
                }
            }
            if (!string.IsNullOrWhiteSpace(error))
            {
                MessageBox.Show(error);
                return;
            }
            App.DB.Exam.Add(exam);
            App.DB.SaveChanges();
            contextExam = exam;
            CBMark.SelectedItem = null;
            CBStudent.SelectedItem = null;
            Refresh();
        }

        private void BDel_Click(object sender, RoutedEventArgs e)
        {
            if(DGStudents.SelectedItem is Exam exam)
            {
                App.DB.Exam.Remove(exam);
                App.DB.SaveChanges();
                Refresh();
            }
            else
            {
                MessageBox.Show("Выберите экзамен");
                return;
            }
        }

        private void TBSurch_TextChanged(object sender, TextChangedEventArgs e)
        {
            Refresh();
        }

        private void CBMarkForSurch_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Refresh();
        }
    }
}
