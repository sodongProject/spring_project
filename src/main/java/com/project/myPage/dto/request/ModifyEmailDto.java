package com.project.myPage.dto.request;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ModifyEmailDto {
    String newEmail;
}
