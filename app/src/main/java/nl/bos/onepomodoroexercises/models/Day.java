package nl.bos.onepomodoroexercises.models;

import java.util.List;

@lombok.Data
public class Day {
    //from json
    private int id;
    private String title;
    private String description;
    private String date;
    private List<Integer> exercises;
}
