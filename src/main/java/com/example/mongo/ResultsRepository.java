package com.example.mongo;

import org.springframework.data.mongodb.repository.MongoRepository;

public interface ResultsRepository extends MongoRepository<Results, String> {

    Long deleteResultsByuserName(String usrName);
}
