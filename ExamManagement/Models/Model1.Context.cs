﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ExamManagementAshmarinEntities : DbContext
    {
        public ExamManagementAshmarinEntities()
            : base("name=ExamManagementAshmarinEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<ApplicationForm> ApplicationForm { get; set; }
        public virtual DbSet<Department> Department { get; set; }
        public virtual DbSet<Discipline> Discipline { get; set; }
        public virtual DbSet<Employee> Employee { get; set; }
        public virtual DbSet<Engineer> Engineer { get; set; }
        public virtual DbSet<Exam> Exam { get; set; }
        public virtual DbSet<Faculcy> Faculcy { get; set; }
        public virtual DbSet<Specialization> Specialization { get; set; }
        public virtual DbSet<Student> Student { get; set; }
        public virtual DbSet<Teacher> Teacher { get; set; }
        public virtual DbSet<ZavDepartment> ZavDepartment { get; set; }
    }
}
