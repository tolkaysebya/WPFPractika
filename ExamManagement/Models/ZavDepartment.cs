//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ExamManagement.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ZavDepartment
    {
        public int TabNumber { get; set; }
        public int WorkExperience { get; set; }
    
        public virtual Employee Employee { get; set; }
    }
}
