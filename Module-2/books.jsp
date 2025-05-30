//Ean Masoner Module 2 Assignment
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book List</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

    <h1>Books I’ve Enjoyed Reading</h1>
    
    <% 
        // Create a list of books using an ArrayList
        class Book {
            String title, author, genre;
            Book(String title, String author, String genre) {
                this.title = title;
                this.author = author;
                this.genre = genre;
            }
        }

        ArrayList<Book> books = new ArrayList<>();
        books.add(new Book("To Kill a Mockingbird", "Harper Lee", "Classic Fiction"));
        books.add(new Book("1984", "George Orwell", "Dystopian"));
        books.add(new Book("The Great Gatsby", "F. Scott Fitzgerald", "Classic Fiction"));
        books.add(new Book("Harry Potter and the Sorcerer's Stone", "J.K. Rowling", "Fantasy"));
        books.add(new Book("The Hobbit", "J.R.R. Tolkien", "Fantasy"));
    %>

    <table>
        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Genre</th>
        </tr>
        <% 
            for (Book book : books) {
        %>
        <tr>
            <td><%= book.title %></td>
            <td><%= book.author %></td>
            <td><%= book.genre %></td>
        </tr>
        <% } %>
    </table>

</body>
</html>
