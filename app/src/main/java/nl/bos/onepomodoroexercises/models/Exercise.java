package nl.bos.onepomodoroexercises.models;

import lombok.Data;

@Data
public class Exercise {
    //from json
    private int id;
    private int excelrow;
    private String name;
    private String description;
    private String image;
    private int weight;
    private String category;
    private int sets;
    private int reps;
    private String units;

    //non json
    private boolean done;
}
