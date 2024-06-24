package com.project.myPage.dto.request;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ModifyPasswordDto {
    private String oldPassword;
    private String newPassword;
}
