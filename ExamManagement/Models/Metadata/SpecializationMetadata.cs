using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamManagement.Models.Metadata
{
    public class SpecializationMetadata
    {
        [Required, MaxLength(50)]
        public string Number { get; set; }
        [Required, MaxLength(50)]
        public string Direction { get; set; }
        [Required]
        public virtual Department Department { get; set; }
    }
}
