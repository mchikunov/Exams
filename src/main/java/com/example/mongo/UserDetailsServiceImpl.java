package com.example.mongo;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.Objects;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {



    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
        // с помощью нашего сервиса UserService получаем User
        User user = null;
        try {
            user = userRepository.findByuserName(name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // указываем роли для этого пользователя
       // Roles roles111 = user.getRoles();
       /* Set<Roles> roles1;

      roles1 = user.getRoles();

        HashSet<GrantedAuthority>roles = new HashSet<>(roles1.size());

        for (Roles role : roles1)
            roles.add(new SimpleGrantedAuthority(role.getRoles()));*/



        // на основании полученных данных формируем объект UserDetails
        // который позволит проверить введенный пользователем логин и пароль
        // и уже потом аутентифицировать пользователя

        return new org.springframework.security.core.userdetails.User(Objects.requireNonNull(user).getUserName(),
                user.getPassword(),
                user.getAuthorities());
    }

}