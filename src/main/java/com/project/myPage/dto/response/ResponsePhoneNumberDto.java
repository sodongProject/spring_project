package com.project.myPage.dto.response;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ResponsePhoneNumberDto {

    private String phoneNumFront;
    private String phoneNumMid;
    private String phoneNumLast;

}
