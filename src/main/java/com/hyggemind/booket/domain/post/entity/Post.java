package com.hyggemind.booket.domain.post.entity;

import com.hyggemind.booket.domain.user.entity.User;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.Date;

@Entity
@Getter
@NoArgsConstructor
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY) // 실무에서는 성능상 LAZY를 권장합니다.
    @JoinColumn(name = "author_id", nullable = false) // 실제 DB의 외래키 컬럼명과 매핑
    private User authorId;

    @Column(name = "meeting_id")
    private Long meetingId;

    @Column(name = "title")
    private String title;

    @Column(name = "content")
    private String content;

    @Column(name = "created_")
    private Date createdAt;
}
