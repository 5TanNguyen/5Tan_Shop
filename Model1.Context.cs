﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DoAn_555
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class B1910293Entities : DbContext
    {
        public B1910293Entities()
            : base("name=B1910293Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<chitiethoadon> chitiethoadons { get; set; }
        public virtual DbSet<hoadon> hoadons { get; set; }
        public virtual DbSet<khachhang> khachhangs { get; set; }
        public virtual DbSet<loaisanpham> loaisanphams { get; set; }
        public virtual DbSet<nhanvien> nhanviens { get; set; }
        public virtual DbSet<nhasanxuat> nhasanxuats { get; set; }
        public virtual DbSet<sanpham> sanphams { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<chucvu> chucvus { get; set; }
        public virtual DbSet<loaikhachhang> loaikhachhangs { get; set; }
        public virtual DbSet<chitietdondat> chitietdondats { get; set; }
        public virtual DbSet<dondat> dondats { get; set; }
        public virtual DbSet<trangthaidondat> trangthaidondats { get; set; }
    }
}
