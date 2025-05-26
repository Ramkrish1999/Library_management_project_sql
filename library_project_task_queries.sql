
-- Question 1:
-- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
SELECT bc.No_Of_Copies
FROM book_copies bc
JOIN books b ON bc.BookID = b.BookID
JOIN library_branch lb ON bc.BranchID = lb.BranchID
WHERE b.Title = 'The Lost Tribe' AND lb.BranchName = 'Sharpstown';


-- Question 2:
-- How many copies of the book titled "The Lost Tribe" are owned by each library branch?
SELECT lb.BranchName, bc.No_Of_Copies
FROM book_copies bc
JOIN books b ON bc.BookID = b.BookID
JOIN library_branch lb ON bc.BranchID = lb.BranchID
WHERE b.Title = 'The Lost Tribe';


-- Question 3:
-- Retrieve the names of all borrowers who do not have any books checked out.
SELECT b.BorrowerName
FROM borrower b
WHERE b.CardNo NOT IN (
    SELECT DISTINCT CardNo FROM book_loans
);


-- Question 4:
-- For each book that is loaned out from the "Sharpstown" branch and whose DueDate is 2/3/18,
-- retrieve the book title, the borrower's name, and the borrower's address.
SELECT bk.Title, br.BorrowerName, br.BorrowerAddress
FROM book_loans bl
JOIN books bk ON bl.BookID = bk.BookID
JOIN borrower br ON bl.CardNo = br.CardNo
JOIN library_branch lb ON bl.BranchID = lb.BranchID
WHERE lb.BranchName = 'Sharpstown' AND bl.DueDate = '2018-02-03';


-- Question 5:
-- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
SELECT lb.BranchName, COUNT(*) AS TotalLoans
FROM book_loans bl
JOIN library_branch lb ON bl.BranchID = lb.BranchID
GROUP BY lb.BranchName;


-- Question 6:
-- Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.
SELECT br.BorrowerName, br.BorrowerAddress, COUNT(*) AS BooksCheckedOut
FROM book_loans bl
JOIN borrower br ON bl.CardNo = br.CardNo
GROUP BY br.BorrowerName, br.BorrowerAddress
HAVING COUNT(*) > 5;


-- Question 7:
-- For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
SELECT b.Title, bc.No_Of_Copies
FROM books b
JOIN book_authors ba ON b.BookID = ba.BookID
JOIN book_copies bc ON b.BookID = bc.BookID
JOIN library_branch lb ON bc.BranchID = lb.BranchID
WHERE ba.AuthorName = 'Stephen King' AND lb.BranchName = 'Central';
