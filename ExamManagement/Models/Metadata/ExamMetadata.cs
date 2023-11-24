using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamManagement.Models.Metadata
{
    public class ExamMetadata
    {
        [Required]
        public int Id { get; set; }
        [Required]
        public System.DateTime Date { get; set; }
        [Required, MaxLength(50)]
        public string Auditorium { get; set; }
        [Required, Range(2,5)]
        public int Mark { get; set; }
        [Required]
        public virtual Discipline Discipline { get; set; }
        [Required]
        public virtual Employee Employee { get; set; }
        [Required]
        public virtual Student Student { get; set; }
    }
}
