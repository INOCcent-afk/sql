CREATE TYPE reaction AS ENUM ('like', 'heart', 'laugh', 'suprised', 'sad', 'angry');


CREATE TABLE User (
    id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    password  VARCHAR(50) NOT NULL,
    
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    -- updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE Profile (
    id INT PRIMARY KEY,
    user_id INT REFERENCES User(id),
    bio VARCHAR(100),
    cover_photo TEXT,
    profile_picture TEXT

    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    -- updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE Post (
    id INT PRIMARY KEY,
    user_id INT REFERENCES User(id),
    body TEXT NOT NULL,

    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    -- updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE PostReaction (
    id INT PRIMARY KEY,
    user_id INT REFERENCES User(id),
    post_id INT REFERENCES Post(id),
    reaction reaction

    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    -- updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
);


CREATE TABLE Comment (
    id INT PRIMARY KEY,
    user_id INT REFERENCES User(id),
    post_id INT REFERENCES Post(id),
    body TEXT NOT NULL

    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    -- updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
);


CREATE TABLE CommentReaction (
    id INT PRIMARY KEY,
    user_id INT REFERENCES User(id),
    comment_id INT REFERENCES Comment(id),
    reaction reaction

    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    -- updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
);

