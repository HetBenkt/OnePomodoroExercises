package nl.bos.onepomodoroexercises.models;

import java.util.List;

@lombok.Data
public class Day {
    private String description;
    private List<Integer> exercises;
    private String date;
    private int id;
}
