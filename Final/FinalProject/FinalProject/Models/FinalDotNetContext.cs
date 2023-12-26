using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace FinalProject.Models;

public partial class FinalDotNetContext : DbContext
{
    public FinalDotNetContext()
    {
    }

    public FinalDotNetContext(DbContextOptions<FinalDotNetContext> options)
        : base(options)
    {
    }

    public virtual DbSet<AdminLogin> AdminLogins { get; set; }

    public virtual DbSet<Agent> Agents { get; set; }

    public virtual DbSet<AgentDetail> AgentDetails { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<ItemCatalog> ItemCatalogs { get; set; }

    public virtual DbSet<ItemOrdered> ItemOrdereds { get; set; }

    public virtual DbSet<OrderTable> OrderTables { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=LAPTOP-49UGQVQ3\\SQLEXPRESS;Initial Catalog=FinalDotNet;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<AdminLogin>(entity =>
        {
            entity.HasKey(e => e.UserName).HasName("PK__AdminLog__C9F2845788E70E58");

            entity.ToTable("AdminLogin");

            entity.Property(e => e.UserName).HasMaxLength(255);
            entity.Property(e => e.Password)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Agent>(entity =>
        {
            entity.HasKey(e => e.AgentId).HasName("PK__Agent__9AC3BFD1FADCE191");

            entity.ToTable("Agent");

            entity.Property(e => e.AgentId)
                .ValueGeneratedNever()
                .HasColumnName("AgentID");
            entity.Property(e => e.Password)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Role)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.UserName).HasMaxLength(255);
        });

        modelBuilder.Entity<AgentDetail>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__AgentDet__3214EC27A2BC8269");

            entity.ToTable("AgentDetail");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.AgentId).HasColumnName("AgentID");
            entity.Property(e => e.Email)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.FullName).HasMaxLength(255);
            entity.Property(e => e.LoginTime).HasColumnType("datetime");
            entity.Property(e => e.LogoutTime).HasColumnType("datetime");
        });

        modelBuilder.Entity<Customer>(entity =>
        {
            entity.HasKey(e => e.CustId).HasName("PK__Customer__049E3A89CA75A514");

            entity.ToTable("Customer");

            entity.Property(e => e.CustId)
                .ValueGeneratedNever()
                .HasColumnName("CustID");
            entity.Property(e => e.Address).HasMaxLength(255);
            entity.Property(e => e.FullName).HasMaxLength(255);
            entity.Property(e => e.TypeOfCustomer)
                .HasMaxLength(255)
                .IsUnicode(false);
        });

        modelBuilder.Entity<ItemCatalog>(entity =>
        {
            entity.HasKey(e => e.ProductId).HasName("PK__ItemCata__B40CC6EDBAD735D8");

            entity.ToTable("ItemCatalog");

            entity.Property(e => e.ProductId)
                .ValueGeneratedNever()
                .HasColumnName("ProductID");
            entity.Property(e => e.BarCode)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.Category).HasMaxLength(255);
            entity.Property(e => e.CreationDate).HasColumnType("date");
            entity.Property(e => e.ImportPrice).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.ProductName).HasMaxLength(255);
            entity.Property(e => e.RetailPrice).HasColumnType("decimal(10, 2)");
        });

        modelBuilder.Entity<ItemOrdered>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__ItemOrde__3214EC2757BE741E");

            entity.ToTable("ItemOrdered");

            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .HasColumnName("ID");
            entity.Property(e => e.OrderId).HasColumnName("OrderID");
            entity.Property(e => e.ProductId).HasColumnName("ProductID");
            entity.Property(e => e.TotalPriceOfItem).HasColumnType("decimal(10, 2)");
        });

        modelBuilder.Entity<OrderTable>(entity =>
        {
            entity.HasKey(e => e.OrderId).HasName("PK__OrderTab__C3905BAF070C81D6");

            entity.ToTable("OrderTable");

            entity.Property(e => e.OrderId)
                .ValueGeneratedNever()
                .HasColumnName("OrderID");
            entity.Property(e => e.CustId).HasColumnName("CustID");
            entity.Property(e => e.MoneyReceived).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.MoneyRefund).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.OrderDate).HasColumnType("date");
            entity.Property(e => e.TotalPriceOfOrder).HasColumnType("decimal(10, 2)");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
