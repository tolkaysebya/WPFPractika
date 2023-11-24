using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamManagement.Models
{
    public partial class Employee
    {
        public bool IsChief
        {
            get
            {
                if(Chief == TabNumber)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
    }
}
