package com.example.mongo;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.aggregation.GroupOperation;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Optional;

import static org.springframework.data.mongodb.core.aggregation.Aggregation.group;
import static org.springframework.data.mongodb.core.aggregation.Aggregation.newAggregation;

@RestController
public class    ControllerServlet {

@Autowired
private RepoMongoTempl repoMongoTempl;

    @Autowired
    private UserRepository repository;

    @Autowired
    private QuestionRepository repositoryQ;

    @Autowired
    private ResultsRepository repositoryR;

    @Autowired
    private Environment environment;

   /* @RequestMapping("/new")
    public ModelAndView wlc (@RequestParam(value = "error", required = false) String error) {


        ModelAndView mw = new ModelAndView();
        if (error != null) {
            mw.addObject("error", "Invalid username and password!");
        }
        mw.setViewName("login");
        return mw;
    }*/


    @RequestMapping("/")
    public ModelAndView wlc (@RequestParam(value = "error", required = false) String error) {


        ModelAndView mw = new ModelAndView();
        if (error != null) {
            mw.addObject("error", "Invalid username and password!");
        }
        mw.setViewName("login");
        return mw;
    }

    @RequestMapping("/new")
    public ModelAndView new1() {
       // String gender = "M";
      //String ss =  environment.getProperty("sss");
      ModelAndView mw = new ModelAndView();
      //  mw.addObject("gender", gender);
      // mw.addObject("male", "sss");
        Question question = new Question();
        mw.addObject(question);
      mw.setViewName("QuestionEnterNew");
        return mw;
    }

    @RequestMapping("/question")
    public ModelAndView formQuestion () {

        List<Question> listQuestions = new ArrayList<>(repositoryQ.findAll());

        ModelAndView mw = new ModelAndView();
        mw.addObject("listQuestions", listQuestions);
        mw.setViewName("BookForm");
        return mw;
    }


    @RequestMapping("/getResult")
    public ModelAndView  getRes(HttpServletRequest req){

        String pv="0";

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

      //  if ((!(auth instanceof AnonymousAuthenticationToken)) && auth != null) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            String usn = userDetail.getUsername();
            User user = repository.findByuserName(usn);
            String fam = user.getSName();

            Results res = new Results();

        Long nz = repositoryR.deleteResultsByuserName(usn);
        //

        Enumeration<String> id = req.getParameterNames();

        while (id.hasMoreElements()) {

            String paramName = id.nextElement();

            String[] paramValues = req.getParameterValues(paramName);
            for (String par:paramValues
                 ) {
               pv = par;
            }
            res.setUserName(usn);
            res.setSName(fam);
            res.setQuestNumber(paramName);
            res.setResult(pv);

            repositoryR.save(res);




        }
        //дальше добавить сравнение с полем в базе квестон, правильный ответ и сложить все прааильные, ретурн инт куданибудь
        String NQuest = repoMongoTempl.aggr();
        List<Results> listR = new ArrayList<>(repositoryR.findAll());
        List<List<String>> listOfLists = new ArrayList<>();

        int i=1;
        Results item0 = listR.get(1);
        List<String> we  = new ArrayList<>();

        for (Results res1 : listR) {        //добавляем построчно фамилию и ответы из базы для jsp
            if (i==1) we.add(res1.getSName());

            if (item0.getUserName().equals(res1.getUserName())) {
                we.add(res1.getResult());
                i++;
            }
            else {i=1;
            listOfLists.add(we);
                we.clear();
            }

            item0 = res1;
        }
        listOfLists.add(we); //последний не добавляется
        ModelAndView mw = new ModelAndView();
        mw.addObject("NQ", NQuest);
        mw.addObject("listR", listOfLists);


        mw.setViewName("ShowResults");
        return mw;

    }

    @RequestMapping("/newUser")
    public ModelAndView newUser (
    ) {
        ModelAndView mw = new ModelAndView();
        mw.setViewName("NewUser");
        return mw;
    }
    @RequestMapping("/saveUser")
    public ModelAndView insertUser (
                                @RequestParam("userName") String userName,
                                @RequestParam("FName") String fName,
                                @RequestParam("SName") String sName,
                                @RequestParam("email") String email,
                                @RequestParam("password") String password
    ) {
        User newUser = new User(userName, sName, fName, password, email, "User");
        repository.insert(newUser);
        ModelAndView mw = new ModelAndView();
        mw.addObject("User", fName);
        mw.setViewName("Registered");
        return mw;
    }

    @RequestMapping("/insQ")
    public ModelAndView insert (@RequestParam("questNumber") String questNumber,
                                @RequestParam("question") String question,
                                @RequestParam("answer1") String answer1,
                                @RequestParam("answer2") String answer2,
                                @RequestParam("answer3") String answer3,
                                @RequestParam("answer4") String answer4,
                                @RequestParam("rightAnswer") String rightAnswer
    ) {
        Question newQ = new Question(questNumber, question, answer1, answer2, answer3, answer4, rightAnswer);
        repositoryQ.save(newQ);

        return allQ();
    }

    @RequestMapping("/saveQ")
    public ModelAndView insert1 (
                                @RequestParam("id") String id,
                                @RequestParam("questNumber") String questNumber,
                                @RequestParam("question") String question,
                                @RequestParam("answer1") String answer1,
                                @RequestParam("answer2") String answer2,
                                @RequestParam("answer3") String answer3,
                                @RequestParam("answer4") String answer4,
                                @RequestParam("rightAnswer") String rightAnswer
    ) {
        Question newQ = new Question(id, questNumber, question, answer1, answer2, answer3, answer4, rightAnswer);
        repositoryQ.save(newQ);

        return allQ();

    }

    @RequestMapping("/edit")
    public ModelAndView edit (@RequestParam("id") String id) {
        Question existingQ = repositoryQ.findById(id).get();
        ModelAndView mw = new ModelAndView();
        mw.addObject("question", existingQ);
        mw.setViewName("QuestionEnter");
        return mw;
    }

    @RequestMapping("/allQ")
    public ModelAndView allQ(){
        List<Question> listQ = new ArrayList<>(repositoryQ.findAll());

        ModelAndView mw = new ModelAndView();
        mw.addObject("listQuestions", listQ);
        mw.setViewName("QuestEditList");
        return mw;
    }

    @RequestMapping("/delete")
    public ModelAndView delete (@RequestParam("id") String id) {
        repositoryQ.deleteById(id);
        return allQ();
    }


    @RequestMapping("/all")
    public ModelAndView all(){
        List<User> listUsers = new ArrayList<>(repository.findAll());

        ModelAndView mw = new ModelAndView();
        mw.addObject("listUsers", listUsers);
        mw.setViewName("BookList");
        return mw;
    }


}
