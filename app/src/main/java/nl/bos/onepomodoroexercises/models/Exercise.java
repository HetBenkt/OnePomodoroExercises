package nl.bos.onepomodoroexercises.models;

import lombok.Data;

@Data
public class Exercise {
    //from json
    private int id;
    private String name;
    private String description;
    private int category;
    private int duration;
    private String steps;

    //non json
    private boolean done;
}
