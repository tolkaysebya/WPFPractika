using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamManagement.Models.Metadata
{
    public class DepartmentMetadata
    {
        [Required, MaxLength(2)]
        public string Shifr { get; set; }
        [Required, MaxLength(50)]
        public string Name { get; set; }
        [Required]
        public virtual Faculcy Faculcy { get; set; }
    }
}
