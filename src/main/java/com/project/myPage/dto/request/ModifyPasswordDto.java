package com.project.myPage.dto.request;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
public class ModifyPasswordDto {
    private String initialPassword;
    private String newPassword;
}
