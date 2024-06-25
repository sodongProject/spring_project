package com.project.myPage.dto.request;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ModifyAdressDto {

    private String city;
    private String town;
}
