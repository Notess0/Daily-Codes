CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO users (username, email) VALUES ('john_doe', 'john@example.com');
INSERT INTO users (username, email) VALUES ('jane_smith', 'jane@example.com');
INSERT INTO posts (user_id, title, content) VALUES (1, 'First Post', 'This is my first post');
INSERT INTO posts (user_id, title, content) VALUES (2, 'Hello World', 'Welcome to my blog');
INSERT INTO comments (post_id, user_id, content) VALUES (1, 2, 'Great post!');
INSERT INTO comments (post_id, user_id, content) VALUES (2, 1, 'Thanks for sharing');

SELECT u.username, COUNT(p.post_id) as post_count 
FROM users u 
LEFT JOIN posts p ON u.user_id = p.user_id 
GROUP BY u.user_id, u.username;

SELECT p.title, u.username, COUNT(c.comment_id) as comment_count
FROM posts p
JOIN users u ON p.user_id = u.user_id
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY p.post_id, p.title, u.username
ORDER BY comment_count DESC;

SELECT c.content, u.username, p.title
FROM comments c
JOIN users u ON c.user_id = u.user_id
JOIN posts p ON c.post_id = p.post_id
WHERE p.user_id != c.user_id;
