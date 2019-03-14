package com.example.mongo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.*;
import org.springframework.stereotype.Repository;

import java.util.List;

import static org.springframework.data.mongodb.core.aggregation.Aggregation.*;


@Repository
public class RepoMongoTempl {

    private final MongoTemplate template;

    @Autowired
    private ResultsRepository repositoryR;

    @Autowired
    public RepoMongoTempl(MongoTemplate mongoTemplate) {
        this.template = mongoTemplate;
    }

    public List<User> getAllUser() {
        return template.findAll(User.class);
    }


    public String aggr() {
        GroupOperation groupOperation = group("SName", "userName", "questNumber", "result");
        SortOperation sortByAvgPopAsc = sort(new Sort(Sort.Direction.DESC, "questNumber"));
        LimitOperation limitToOnlyFirstDoc = limit(1);
        Aggregation aggregation = newAggregation(groupOperation);
        Aggregation aggregation1 = newAggregation(groupOperation, sortByAvgPopAsc, limitToOnlyFirstDoc);
        AggregationResults<Results> resNew =template.aggregate(aggregation, "results", Results.class);
        AggregationResults<Results> sorted = template.aggregate(aggregation1, "results", Results.class);
        Results maxNumber = sorted.getUniqueMappedResult();
        String ret = maxNumber.getQuestNumber();
        repositoryR.deleteAll();
        repositoryR.insert(resNew);
        //for (Results rr:resNew
        //     )
        //    repositoryR.insert(rr);
        return ret;
    }
}
