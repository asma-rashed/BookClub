# BookClub

A web application where friends share the books they have read and their thoughts about them. Users register, log in, add books to their own shelf, and read what everyone else has shared.

Built with **Java 17, Spring Boot, Spring MVC, Spring Data JPA, MySQL and JSP**.

## Features

- Register and log in (passwords are hashed with BCrypt)
- See all books shared by all members, with the name of who posted each one
- Add a book with a title, an author and your thoughts
- Open a book to read the poster's thoughts
- Edit your own books (the Edit button only appears for the owner)
- Form validation with error messages (name, email, password length, matching passwords)
- Log out


## Tech stack

| Layer | Technology |
|---|---|
| Language | Java 17 |
| Framework | Spring Boot 2.7, Spring MVC |
| Data | Spring Data JPA (Hibernate), MySQL |
| Views | JSP, JSTL, Spring form tags, Bootstrap 5 |
| Validation | Bean Validation (`spring-boot-starter-validation`) |
| Security | jBCrypt for password hashing, session-based login |
| Build | Maven |

## Getting started

### Requirements

- JDK 17 or newer
- MySQL Server running on `localhost:3306`
- An IDE such as Spring Tool Suite, Eclipse or IntelliJ IDEA (or Maven installed)

### Run it locally

1. Clone the repository:
   ```bash
   git clone https://github.com/asma-rashed/BookClub.git
   ```
2. Create the database in MySQL:
   ```sql
   CREATE DATABASE bookclub;
   ```
3. Open `BookClub/src/main/resources/application.properties` and set your MySQL username and password:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/bookclub
   spring.datasource.username=root
   spring.datasource.password=your_password
   ```
   The tables are created automatically on the first run (`spring.jpa.hibernate.ddl-auto=update`).
4. Import the `BookClub` folder (the one that contains `pom.xml`) as an existing Maven project, then run `BookClubApplication` as a Spring Boot app. With Maven installed you can also run this inside that folder:
   ```bash
   mvn spring-boot:run
   ```
   Run it with the IDE or `spring-boot:run`, not `java -jar`, because JSP pages do not work from a Spring Boot jar.
5. Open <http://localhost:8080>, register an account and add your first book.

## Pages

| URL | What it does |
|---|---|
| `/` | Register and log in |
| `/books` | All books |
| `/books/{id}` | One book and its thoughts |
| `/books/new` | Add a book |
| `/books/edit/{id}` | Edit a book |
| `/logout` | Log out |

## Project structure

```
src/main
├── java/com/example/demo
│   ├── controllers   UserController, BookController
│   ├── services      UserService, BookService
│   ├── repositories  UserRepository, BookRepository
│   └── models        User, Book, LoginUser
├── resources         application.properties
└── webapp/WEB-INF    JSP pages (reg, books, new, view, edit)
```

## Database

Two tables with a one-to-many relationship: one `user` has many `books` (`books.postedBy_id` points to `user.id`).

## Planned improvements

- Delete a book
- Enforce "only the owner can edit" on the server as well as in the page
- Unit and integration tests
- Move to Spring Security

## Author

Asma Rashed, [github.com/asma-rashed](https://github.com/asma-rashed)
