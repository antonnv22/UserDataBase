package web.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import web.model.User;
import web.repository.UserRepository;

import java.util.List;

@Component
@Transactional
public class UserDAOImpl implements UserDAO {
    private UserRepository repository;

    public UserDAOImpl(){
    }

    @Autowired
    public UserDAOImpl(UserRepository repository) {
        super();
        this.repository = repository;
    }

    @Override
    public List<User> allUsers() {
        return repository.findAll();
    }

    @Override
    public void save(User user) {
        repository.save(user);
    }

    @Override
    public void delete(User user) {
        repository.delete(user);
    }

    @Override
    public User getById(Long id) {
        return repository.findById(id).orElse(null);
    }
}
