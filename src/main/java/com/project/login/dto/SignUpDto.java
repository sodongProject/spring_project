package com.project.login.dto;

import com.project.entity.Auth;
import com.project.entity.Gender;
import com.project.login.entity.Users;
import lombok.*;

import org.aspectj.util.FileUtil;
import org.springframework.web.multipart.MultipartFile;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Setter
@Getter @ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EqualsAndHashCode
public class SignUpDto {

    //프로필 사진 업데이트
    private MultipartFile profileImage;

    @NotBlank(message = "아이디는 필수값입니다.")
    @Size(min = 4, max = 14, message = "아이디는 4~14글자")
    @Pattern(regexp = "^[a-zA-Z0-9]+$", message = "아이디는 4~14글자 사이 영어와 숫자가 포함되어야 합니다.")
    private String account;

    @NotBlank(message = "비밀번호는 필수값입니다.")
    @Size(min = 4, max = 14, message = "비밀번호는 4~14글자 사이입니다.")
    @Pattern(regexp = "^[a-zA-Z0-9!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]+$", message = "비밀번호는 영문과 숫자 및 특수문자가 포함되어야 합니다.")
    private String password;

    @NotBlank(message = "이메일은 필수값입니다.")
    @Email
    private String email;

    @NotBlank(message = "실명을 적어주세요.")
    @Size(min = 2, max = 5)
    @Pattern(regexp = "^[가-힣]+$", message = "이름에는 한글만 포함해야 합니다.")
    private String userName;

    @NotBlank(message = "전화번호는 필수값입니다.")
    @Pattern(regexp = "^\\d{3}-\\d{3,4}-\\d{4}$", message = "유효한 전화번호 형식이어야 합니다. (예: 010-1234-5678)")
    private String phoneNumber;

    @NotBlank
    private String gender;

    @NotBlank(message = "주소는 필수값입니다.")
    @Size(max = 255, message = "주소는 최대 255자까지 입력 가능합니다.")
    private String address;


    public Users toEntity() {

        return Users.builder()
                .account(this.account)
                .userName(this.userName)
                .email(this.email)
                .password(this.password)
                .phoneNumber(this.phoneNumber)
                .gender(Gender.valueOf(this.gender))
                .address(this.address)
                .build();
    }
}