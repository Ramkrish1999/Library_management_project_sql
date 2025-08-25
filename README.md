📚 Library Store Database Project  

## 📖 Overview  
This project is a **Library Store Management System** implemented using **MySQL**. It provides a structured database schema to manage:  
- Publishers  
- Books & Authors  
- Library Branches  
- Book Copies  
- Borrowers  
- Book Loans  

It also includes **sample data inserts** and **SQL queries** to answer practical business questions about the library.  

---

🗂 Database Schema  
The project creates the following tables:  
- `tbl_publisher` → Stores publisher details.  
- `tbl_book` → Stores books and their publishers.  
- `tbl_book_authors` → Stores author information for each book.  
- `tbl_library_branch` → Stores library branch details.  
- `tbl_book_copies` → Tracks number of copies per branch.  
- `tbl_borrower` → Stores borrower information.  
- `tbl_book_loans` → Tracks book loan transactions.  

---

⚡ Setup Instructions  
1. Open **MySQL Workbench** or any SQL client.  
2. Create a new database by running:  
   ```sql
   create database bookstore;
   use bookstore;
