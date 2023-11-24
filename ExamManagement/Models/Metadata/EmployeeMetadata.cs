using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamManagement.Models.Metadata
{
    public class EmployeeMetadata
    {
        [Required, MaxLength(50)]
        public string Surname { get; set; }
        [Required, MaxLength(50)]
        public string Post { get; set; }
        [Required, Range(10000, 150000)]
        public decimal Salary { get; set; }
        [Required]
        public byte[] Image { get; set; }
        [Required, MaxLength(50)]
        public string Login { get; set; }
        [Required, MaxLength(50)]
        public string Password { get; set; }
        [Required]
        public virtual Department Department { get; set; }
    }

}
