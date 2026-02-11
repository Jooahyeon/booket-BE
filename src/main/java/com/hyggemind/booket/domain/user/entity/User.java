package com.hyggemind.booket.domain.user.entity;

import com.hyggemind.booket.global.common.BaseTimeEntity;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "users")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class User extends BaseTimeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 100)
    private String email;

    @Column(nullable = false, length = 50)
    private String nickname;

    @Column(nullable = false, length = 20)
    private String provider; // KAKAO, NAVER, GOOGLE

    @Column(nullable = false, unique = true)
    private String providerId;

    @Column(nullable = false, length = 20)
    private String role; // USER, ADMIN
}


