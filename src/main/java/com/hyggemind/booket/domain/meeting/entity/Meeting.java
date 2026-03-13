package com.hyggemind.booket.domain.meeting.entity;

import com.hyggemind.booket.domain.user.entity.User;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;

@Entity
@Table(name = "metings")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@EntityListeners(AuditingEntityListener.class)
public class Meeting {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "host_id", nullable = false)
    private User hostId;

    @Column(nullable = false, length = 200)
    private String title;

    @Column(nullable = false)
    private Integer price;

    @Column(name = "max_capacity", nullable = false)
    private Integer maxCapacity;

    @Column(name = "current_count", nullable = false)
    private Integer currentCount;

    @Column(nullable = false, length = 20)
    private String status;

    @Version
    private Long version;

    @CreatedDate
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;


    @Builder
    public Meeting(User host, String title, Integer price, Integer maxCapacity, Integer currentCount, String status) {
        this.hostId = host;
        this.title = title;
        this.price = price;
        this.maxCapacity = maxCapacity;
        this.currentCount = (currentCount == null) ? 0 : currentCount;
        this.status = status;

    }

}
