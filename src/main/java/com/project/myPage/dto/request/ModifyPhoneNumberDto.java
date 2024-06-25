package com.project.myPage.dto.request;


import lombok.*;

import java.text.Format;

@Getter @Setter @ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ModifyPhoneNumberDto {

    private String phoneNumFront;
    private String phoneNumMid;
    private String phoneNumLast;



}
