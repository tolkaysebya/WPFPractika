using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamManagement.Models.Metadata
{
    public class StudentMetadata
    {
        [Required]
        public int RegNumber { get; set; }
        [Required]
        [MaxLength(50)]
        public string Surname { get; set; }
        [Required]
        [MaxLength(50)]
        public string Login { get; set; }
        [Required]
        [MaxLength(50)]
        public string Password { get; set; }
        [Required]
        public virtual Specialization Specialization { get; set; }
    }
}
