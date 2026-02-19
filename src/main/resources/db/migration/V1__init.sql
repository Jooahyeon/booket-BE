-- 1. 회원 테이블
CREATE TABLE users (
                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                       email VARCHAR(100) NOT NULL UNIQUE,
                       nickname VARCHAR(50) NOT NULL,
                       provider VARCHAR(20) NOT NULL,
                       provider_id VARCHAR(255) NOT NULL UNIQUE,
                       role VARCHAR(20) NOT NULL,
                       created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. 모임 테이블
CREATE TABLE meetings (
                          id BIGINT AUTO_INCREMENT PRIMARY KEY,
                          host_id BIGINT NOT NULL,
                          title VARCHAR(200) NOT NULL,
                          price INT NOT NULL DEFAULT 0,
                          max_capacity INT NOT NULL,
                          current_count INT NOT NULL DEFAULT 0,
                          status VARCHAR(20) NOT NULL,
                          version BIGINT DEFAULT 0,
                          created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                          CONSTRAINT fk_meeting_host FOREIGN KEY (host_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. 예약 테이블
CREATE TABLE reservations (
                              id BIGINT AUTO_INCREMENT PRIMARY KEY,
                              user_id BIGINT NOT NULL,
                              meeting_id BIGINT NOT NULL,
                              status VARCHAR(20) NOT NULL,
                              reserved_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                              CONSTRAINT fk_reservation_user FOREIGN KEY (user_id) REFERENCES users(id),
                              CONSTRAINT fk_reservation_meeting FOREIGN KEY (meeting_id) REFERENCES meetings(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. 게시글(블로그) 테이블
CREATE TABLE posts (
                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                       author_id BIGINT NOT NULL,
                       meeting_id BIGINT NULL,
                       title VARCHAR(255) NOT NULL,
                       content TEXT NOT NULL,
                       created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                       CONSTRAINT fk_post_author FOREIGN KEY (author_id) REFERENCES users(id),
                       CONSTRAINT fk_post_meeting FOREIGN KEY (meeting_id) REFERENCES meetings(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5. 채팅방 테이블
CREATE TABLE chat_rooms (
                            id BIGINT AUTO_INCREMENT PRIMARY KEY,
                            meeting_id BIGINT NOT NULL,
                            CONSTRAINT fk_chatroom_meeting FOREIGN KEY (meeting_id) REFERENCES meetings(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 6. 채팅 멤버 테이블
CREATE TABLE chat_members (
                              id BIGINT AUTO_INCREMENT PRIMARY KEY,
                              room_id BIGINT NOT NULL,
                              user_id BIGINT NOT NULL,
                              status VARCHAR(20) NOT NULL,
                              joined_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                              CONSTRAINT fk_chatmember_room FOREIGN KEY (room_id) REFERENCES chat_rooms(id),
                              CONSTRAINT fk_chatmember_user FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 7. 채팅 메시지 테이블
CREATE TABLE chat_messages (
                               id BIGINT AUTO_INCREMENT PRIMARY KEY,
                               room_id BIGINT NOT NULL,
                               sender_id BIGINT NOT NULL,
                               message TEXT NOT NULL,
                               type VARCHAR(20) NOT NULL,
                               created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                               CONSTRAINT fk_chatmessage_room FOREIGN KEY (room_id) REFERENCES chat_rooms(id),
                               CONSTRAINT fk_chatmessage_sender FOREIGN KEY (sender_id) REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;